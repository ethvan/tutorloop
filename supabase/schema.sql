-- TutorLoop schema. Run once in Supabase: SQL Editor > New query > paste > Run.
create table students(
  id uuid primary key default gen_random_uuid(),
  tutor_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name text not null, subject text default '', approved boolean default false,
  skills jsonb default '[]', lessons jsonb default '[]',  -- lessons here hold ONLY shareable fields
  created_at timestamptz default now());
create table private_notes(  -- tutor-only; never read by share links
  student_id uuid primary key references students(id) on delete cascade,
  tutor_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  notes jsonb default '{}');
create table shares(
  token text primary key,
  student_id uuid not null references students(id) on delete cascade,
  role text not null check (role in ('parent','student')),
  expires_at timestamptz not null, revoked boolean default false,
  created_at timestamptz default now());
alter table students enable row level security;
alter table private_notes enable row level security;
alter table shares enable row level security;
create policy own_students on students for all using (tutor_id=auth.uid()) with check (tutor_id=auth.uid());
create policy own_notes on private_notes for all using (tutor_id=auth.uid())
  with check (tutor_id=auth.uid() and exists(select 1 from students s where s.id=student_id and s.tutor_id=auth.uid()));
create policy own_shares on shares for all
  using (exists(select 1 from students s where s.id=student_id and s.tutor_id=auth.uid()))
  with check (exists(select 1 from students s where s.id=student_id and s.tutor_id=auth.uid()));
-- The only door for parents/students: a valid, unexpired, unrevoked token returns shareable data only.
create function get_shared(p_token text) returns jsonb language sql security definer set search_path=public stable as $$
  select jsonb_build_object('name',s.name,'subject',s.subject,'approved',s.approved,'role',h.role,
    'skills',case when h.role='parent' and not s.approved then '[]'::jsonb else s.skills end,
    'lessons',case when h.role='parent' and not s.approved then '[]'::jsonb
      else coalesce((select jsonb_agg(l) from jsonb_array_elements(s.lessons) l where (l->>'shared')::boolean),'[]'::jsonb) end)
  from shares h join students s on s.id=h.student_id
  where h.token=p_token and not h.revoked and h.expires_at>now() $$;
revoke all on function get_shared(text) from public;
grant execute on function get_shared(text) to anon, authenticated;
