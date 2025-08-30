# Task Manager Web Application

This repository contains a full‑stack Kanban style task manager designed to boost team productivity. It features a dark themed user interface, drag‑and‑drop task management, real‑time collaboration, authentication with role‑based access control and detailed activity logs for every task. The project is structured into two separate applications: a **Node.js/Express** backend that persists data in a lightweight **SQLite** database and a **React** frontend built with **Vite** and **Material UI**.

## 🌟 Live Demo

**[Try the Live Website](https://taskmanagerwebsite.abacusai.app/)**

## 🚀 Technology Stack

### Backend

| Layer        | Technology                              | Rationale                                                  |
|--------------|------------------------------------------|------------------------------------------------------------|
| Language     | Node.js (v22+)                          | Modern JavaScript runtime with broad ecosystem support     |
| Framework    | Express                                  | Minimal HTTP server with middleware support                |
| Database     | SQLite via [better‑sqlite3](https://github.com/WiseLibs/better-sqlite3) | Serverless, zero‑config, production‑capable relational DB   |
| Auth         | JSON Web Tokens (JWT) + bcrypt          | Stateless authentication, hashed passwords                 |
| Real‑time    | Socket.IO                               | WebSocket library for broadcasting task updates            |

### Frontend

| Layer       | Technology                        | Rationale                                                    |
|-------------|------------------------------------|--------------------------------------------------------------|
| Framework   | React 18                          | Declarative UI with component composition                    |
| Build Tool  | Vite                              | Fast development server and bundler                          |
| UI Library  | Material UI (MUI)                 | Accessible, responsive components with built‑in dark theme    |
| Drag & Drop | react‑beautiful‑dnd               | Intuitive drag‑and‑drop interactions                        |
| Networking  | Axios                             | Promise‑based HTTP client                                    |
| Real‑time   | socket.io‑client                  | Connects to the Socket.IO server                             |

## 📂 Project Structure

```
task-manager/
├── client/               # React frontend
│   ├── index.html        # HTML entry point
│   ├── package.json      # Client dependencies and scripts
│   ├── vite.config.js    # Vite configuration
│   └── src/
│       ├── main.jsx      # Entry point mounting React
│       ├── App.jsx       # Defines routes and theme
│       ├── api/
│       │   └── axios.js  # Configured Axios instance
│       ├── context/
│       │   └── AuthContext.jsx  # Authentication context & hook
│       ├── pages/
│       │   ├── Login.jsx       # Login form
│       │   ├── Register.jsx    # Registration form
│       │   └── Dashboard.jsx   # Kanban board and activity log
│       └── components/         # Shared UI components (extendable)
├── server/               # Express backend
│   ├── index.js          # Entry point setting up routes, DB and sockets
│   ├── package.json      # Server dependencies and scripts
│   └── database.sqlite   # Generated at runtime; holds persistent data
├── .gitignore            # Common ignores for Node, SQLite and build outputs
└── README.md             # You are here
```

## 🛠️ Setup Instructions

The frontend and backend are completely decoupled. Each resides in its own subdirectory and maintains its own dependencies. Make sure you have **Node.js v16+** installed on your machine.

1. **Clone the repository**

   ```bash
   git clone <your-fork-url>
   cd task-manager
   ```

2. **Install server dependencies**

   ```bash
   cd server
   npm install
   ```

3. **Install client dependencies**

   ```bash
   cd ../client
   npm install
   ```

4. **Run the backend server**

   ```bash
   cd ../server
   # Optionally create a .env file and override PORT or JWT_SECRET
   npm start
   ```

   The server listens on `http://localhost:3001` by default. On first run it automatically creates a `database.sqlite` file containing sample data:

   - **Admin user**: `admin` / `admin123`
   - **Regular user**: `user1` / `user123`
   - One board named “Default Board” with three example tasks.

5. **Run the frontend client**

   In a separate terminal:

   ```bash
   cd client
   npm run dev
   ```

   The app will be available at `http://localhost:5173`. It automatically proxies requests to the backend API via the configured base URL.

## ✨ Features

* **Dark theme** – Leveraging Material UI’s dark mode, the entire interface is easy on the eyes.
* **Kanban board with drag‑and‑drop** – Organise tasks across *Todo*, *In Progress* and *Done* columns. Drag tasks to move them between columns.
* **User authentication** – Sign up or log in. JWTs secure API calls and protect routes. Passwords are salted and hashed with bcrypt.
* **Role‑based access** – Users have roles (`admin` or `user`). You can extend the role checks in the API to restrict actions such as assigning tasks.
* **Real‑time collaboration** – The app uses Socket.IO to broadcast task creation and updates instantly to all connected clients. Open multiple tabs to see the synchronisation in action.
* **Activity logs** – Every change to a task (creation, updates, moves) is recorded. Click a task card to view a timestamped history of who did what.
* **Responsive design** – The layout adapts down to tablet and mobile sizes. Columns collapse gracefully on smaller screens.
* **Sample data** – The first run seeds the database with users and tasks so you can explore the functionality immediately.

## 🧑‍💻 Extending the Project

This implementation serves as a solid foundation but can be extended in numerous ways:

* **Multiple boards** – Allow creation of multiple boards and join specific Socket.IO rooms per board.
* **Task assignments** – Introduce user selectors to assign tasks to different team members.
* **Comments and attachments** – Enhance tasks with rich comments or file uploads.
* **Notifications** – Send email or push notifications when tasks are updated.

