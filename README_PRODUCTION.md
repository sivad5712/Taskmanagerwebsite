
# Task Manager - Production Ready

A modern, full-stack task management application built with React, Node.js, and SQLite. Features real-time collaboration, drag-and-drop functionality, and a responsive dark theme UI.

## 🚀 Features

- **Real-time Collaboration**: WebSocket-powered live updates
- **Drag & Drop**: Intuitive kanban board interface
- **Authentication**: Secure JWT-based user authentication
- **Responsive Design**: Mobile-first, responsive UI
- **Dark Theme**: Modern dark theme with Material-UI
- **Activity Logging**: Track all task changes and user actions
- **Production Ready**: Docker, Nginx, CI/CD pipeline included

## 🛠 Technology Stack

### Frontend
- **React 18** - Modern React with hooks
- **Vite** - Fast build tool and dev server
- **Material-UI v5** - Component library with dark theme
- **React Beautiful DnD** - Drag and drop functionality
- **Socket.IO Client** - Real-time communication
- **Axios** - HTTP client with interceptors

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **Socket.IO** - WebSocket server
- **SQLite3** - Lightweight database
- **JWT** - Authentication tokens
- **bcrypt** - Password hashing

### DevOps & Production
- **Docker** - Containerization
- **Nginx** - Reverse proxy and static file serving
- **GitHub Actions** - CI/CD pipeline
- **ESLint** - Code linting
- **Security Headers** - Production security

## 📦 Installation & Setup

### Development Mode

1. **Clone and setup**:
   ```bash
   git clone <repository-url>
   cd task-manager
   ```

2. **Install server dependencies**:
   ```bash
   cd server
   npm install
   ```

3. **Install client dependencies**:
   ```bash
   cd ../client
   npm install
   ```

4. **Start development servers**:
   ```bash
   # Terminal 1 - Start backend
   cd server
   npm run dev

   # Terminal 2 - Start frontend
   cd client
   npm run dev
   ```

5. **Access the application**:
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:3001

### Production Deployment

#### Using Docker Compose (Recommended)

1. **Setup environment**:
   ```bash
   cp .env.example .env
   # Edit .env with your production values
   ```

2. **Build and run**:
   ```bash
   docker-compose up -d
   ```

3. **Access**:
   - Application: http://localhost
   - API: http://localhost/api

#### Manual Deployment

1. **Build client**:
   ```bash
   cd client
   npm run build
   ```

2. **Start server**:
   ```bash
   cd server
   NODE_ENV=production npm start
   ```

3. **Configure Nginx** (copy nginx.conf to your Nginx config)

## 🔐 Default Credentials

For testing purposes, the application comes with sample users:

- **Admin**: username: `admin`, password: `admin123`
- **User**: username: `user1`, password: `user123`

**⚠️ Change these credentials in production!**

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
# Server Configuration
PORT=3001
NODE_ENV=production

# Security
JWT_SECRET=your-super-secure-jwt-secret-key-here
BCRYPT_ROUNDS=12

# Database
DATABASE_PATH=./database.sqlite

# CORS Configuration
ALLOWED_ORIGINS=https://yourdomain.com

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
```

### Security Features

- **JWT Authentication** with secure token handling
- **Password Hashing** using bcrypt with configurable rounds
- **Rate Limiting** on API endpoints
- **CORS Protection** with configurable origins
- **Security Headers** via Nginx
- **Input Validation** and sanitization
- **Error Handling** with proper error boundaries

### Performance Optimizations

- **Code Splitting** with React lazy loading
- **Static Asset Caching** via Nginx
- **Gzip Compression** for all text assets
- **Database Indexing** for optimal queries
- **WebSocket Connection Pooling**
- **Optimized Docker Images** with multi-stage builds

## 📊 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login

### Boards & Tasks
- `GET /api/boards` - Get all boards with tasks
- `POST /api/tasks` - Create new task
- `PUT /api/tasks/:id` - Update task
- `GET /api/tasks/:id/logs` - Get task activity logs

### WebSocket Events
- `taskCreated` - New task created
- `taskUpdated` - Task updated/moved

## 🧪 Testing

```bash
# Run server tests
cd server && npm test

# Run client tests
cd client && npm test

# Run security audit
npm audit
```

## 🚀 Deployment Checklist

- [ ] Update JWT_SECRET in production
- [ ] Configure CORS origins
- [ ] Set up SSL certificates
- [ ] Configure rate limiting
- [ ] Set up monitoring and logging
- [ ] Configure backup strategy
- [ ] Update default credentials
- [ ] Test all functionality
- [ ] Set up CI/CD pipeline

## 📈 Monitoring & Logging

The application includes:
- Request logging with timestamps
- Error tracking and reporting
- Performance monitoring hooks
- Database query logging
- WebSocket connection monitoring

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Run linting and tests
6. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions:
- Check the GitHub issues
- Review the documentation
- Contact the development team

---

**Built with ❤️ for modern task management**
