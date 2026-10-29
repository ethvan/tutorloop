# TutorLoop app

## Option A: Installable web app (PWA), fastest
1. Upload the `www` folder to any HTTPS host (Netlify Drop, Vercel, GitHub Pages).
2. Open the link on a phone, then Share → Add to Home Screen (iPhone) or Install app (Android).
Test locally: `cd www && python3 -m http.server 8000`

## Option B: Real iOS / Android app (Capacitor)
Needs Node.js 18+. Android needs Android Studio; iOS needs a Mac with Xcode.
    npm install
    npx cap add android      # and/or: npx cap add ios
    npx cap sync
    npx cap open android     # or: npx cap open ios
Then run on a device/emulator from Android Studio / Xcode.
Publishing needs a Google Play account ($25 once) and/or an Apple Developer account ($99/year).
Change `appId` in capacitor.config.json to your own (e.g. com.yourname.tutorloop) first.

## Before real students use it
Data is stored only on the device (localStorage). For real use add:
- Logins for tutors (Supabase, Firebase, or similar)
- A database so student/parent links work across devices
- Private notes stored in a tutor-only table, never sent to student/parent pages
- Expiring or login-protected parent links
