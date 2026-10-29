# TutorLoop 🎓

**Helping tutors, students, and parents stay connected through meaningful learning progress.**

TutorLoop is a lightweight web application designed to help English tutors track student progress, record lessons, manage learning goals, and share progress reports with students and parents.

The goal is to make student progress easier to understand while reducing the administrative work involved in keeping everyone informed.

## ✨ Features

### 👩‍🏫 Tutor Dashboard
- Manage multiple student profiles.
- Assess six English language skills: grammar, vocabulary, reading, writing, listening, and speaking.
- Visualize skill development with a progress radar chart.
- Create and track personalized learning goals.
- Record lesson summaries, strengths, and areas for improvement.
- Keep private tutor notes separate from shared lesson information.
- Track homework completion and review student history.

### 🎓 Student Progress Page
- View current skill levels and areas for improvement.
- Review learning goals and completed milestones.
- Access shared lesson summaries.
- Identify recommended areas to practice between lessons.

### 👨‍👩‍👧 Parent Reports
- Review student progress and lesson summaries.
- Understand strengths and areas needing additional practice.
- Access tutor-approved shared information.
- Follow learning goals and homework progress.

### 📱 Responsive Web App
- Clean, modern interface with a dark theme and teal accents.
- Designed for desktop and mobile browsers.
- Includes a web app manifest and service worker for progressive web app functionality.

## 🛠️ Technologies Used

- **HTML5** — Application structure
- **CSS3** — Responsive styling and user interface
- **JavaScript** — Interactive features and application logic
- **LocalStorage** — Local persistence of student data
- **SVG** — Skill visualization and application icon
- **Progressive Web App (PWA)** — Installable web app support
- **GitHub Pages** — Static website hosting

## 🚀 Getting Started

### Run Locally

No build process is required for the current web prototype.

1. Clone the repository:

   ```bash
   git clone https://github.com/YOUR-USERNAME/tutorloop.git
   ```

2. Navigate to the project directory:

   ```bash
   cd tutorloop
   ```

3. Start a local web server:

   ```bash
   python3 -m http.server 8000
   ```

   If your `index.html` is inside a `www` directory, run the server from that directory instead:

   ```bash
   cd www
   python3 -m http.server 8000
   ```

4. Open the application in your browser:

   http://localhost:8000

### Deploy with GitHub Pages

1. Upload `index.html`, `manifest.json`, `sw.js`, and the icon files to the repository root, or configure GitHub Pages to publish from the `www` directory.
2. Navigate to **Settings → Pages** in your GitHub repository.
3. Select **Deploy from a branch**.
4. Choose the `main` branch and the appropriate publishing folder.
5. Save your settings and wait for deployment.

Your application will be available at:

`https://YOUR-USERNAME.github.io/tutorloop/`

Replace `YOUR-USERNAME` with your GitHub username.

## 🗂️ Project Structure

```text
tutorloop/
├── index.html          # Main application and interface
├── manifest.json       # Progressive web app configuration
├── sw.js               # Service worker
├── icon.svg            # Application icon
├── icon-192.png        # PWA icon
├── icon-512.png        # PWA icon
└── README.md           # Project documentation
```

If you retain the original project structure, these web assets are located inside the `www/` directory.

## 💾 Data Storage

The current prototype uses browser LocalStorage to preserve student information between page visits in the same browser.

**Current limitations:**
- Data is stored locally on the device and is not synchronized across devices.
- Authentication and multi-user access are not implemented.
- Student and parent views are part of the prototype rather than independently authenticated accounts.
- The application is not yet suitable for storing real students' sensitive information.

A future version could use a backend service such as Supabase or Firebase to support authentication, centralized data storage, and role-based access controls.

Private tutor notes must remain inaccessible to students and parents, including at the backend and database levels.

## 🔮 Future Improvements

- [ ] User authentication for tutors, students, and parents
- [ ] Shared database with secure, role-based access
- [ ] Automatic progress report generation
- [ ] Historical skill comparisons and progress trends
- [ ] Exportable PDF progress reports
- [ ] Email notifications for published reports
- [ ] Improved student goal tracking
- [ ] AI-assisted feedback and personalized practice recommendations
- [ ] Automated testing and accessibility improvements

## 🎯 Project Goals

TutorLoop is being developed to explore how software can improve the virtual tutoring experience by making student progress more visible, actionable, and easier to communicate.

The project combines frontend development, data visualization, user experience design, and educational technology in a practical application.

## 📄 License

No open-source license has been selected yet. All rights are reserved by the project owner unless a license is added to this repository.

---

**TutorLoop** — Track progress. Celebrate growth. Keep learning.
