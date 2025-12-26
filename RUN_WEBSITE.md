# How to Run the SatAns Website

This guide explains how to run the SatAns website locally with both frontend and backend.

## Prerequisites

- Node.js (v16 or higher)
- PostgreSQL (v12 or higher) - **Linux/Mac only**
- Python (for frontend server)
- npm

## 🚀 Quick Start (Recommended)

### Option 1: Using Startup Scripts (Easiest)

**Windows:**
```bash
# Double-click or run:
start-website.bat
```

**Linux/Mac:**
```bash
# Make executable (first time only)
chmod +x start-website.sh

# Run the script
./start-website.sh
```

This will automatically:
- Start PostgreSQL (Linux/Mac)
- Set up the database
- Install dependencies
- Start both backend and frontend servers
- Open them in separate terminal windows

### Option 2: Manual Startup

**Step 1: Start Backend Server**

Windows:
```bash
start-backend.bat
```

Linux/Mac:
```bash
./start-backend.sh
```

**Step 2: Start Frontend Server (in a new terminal)**

Windows:
```bash
start-frontend.bat
```

Linux/Mac:
```bash
./start-frontend.sh
```

### Access the Website

Once both servers are running:
- **Frontend**: http://localhost:8080/index.html
- **Backend API**: http://localhost:3000

## Detailed Setup (If Quick Start Doesn't Work)

### 1. Install Dependencies

```bash
npm install
```

### 2. Set Up PostgreSQL Database

Start PostgreSQL service:
```bash
# Linux/Mac
sudo service postgresql start

# Or check if it's already running
sudo service postgresql status
```

Create the database and import schema:
```bash
# Create database
sudo -u postgres psql -c "CREATE DATABASE satans_db;"

# Import schema
sudo -u postgres psql satans_db < database.sql
```

### 3. Configure Environment Variables

The `.env` file is already configured with default values. Update these if needed:

- `PORT`: Backend server port (default: 3000)
- `DB_USER`: PostgreSQL username (default: postgres)
- `DB_HOST`: Database host (default: localhost)
- `DB_NAME`: Database name (default: satans_db)
- `DB_PASSWORD`: Your PostgreSQL password
- `DB_PORT`: PostgreSQL port (default: 5432)
- `RAZORPAY_KEY_ID` and `RAZORPAY_KEY_SECRET`: For payment integration
- `EMAIL_USER` and `EMAIL_PASSWORD`: For email notifications

### 4. Start the Backend Server

```bash
# Development mode (with auto-reload)
npm run dev

# Or production mode
npm start
```

You should see:
```
✅ Connected to PostgreSQL database
Server running on port 3000
```

### 5. Start the Frontend Server

In a new terminal, run:
```bash
# Using Python 3
python3 -m http.server 8080

# Or using Python 2
python -m SimpleHTTPServer 8080
```

Alternatively, you can use VS Code Live Server extension or any other HTTP server.

### 6. Access the Website

Open your browser and navigate to:
- **Frontend**: http://localhost:8080/index.html
- **Backend API**: http://localhost:3000

## Available Pages

- `index.html` - Main homepage
- `about.html` - About page
- `connect.html` - Connect page
- `test.html` - Test page
- `detailed-report.html` - Detailed report page

## API Endpoints

The backend provides these API endpoints:

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `POST /api/auth/verify-email` - Verify email
- `POST /api/auth/admin-login` - Admin login

### User
- `GET /api/user/profile` - Get user profile (requires auth)

### Payments
- `POST /api/payment/create-order` - Create payment order
- `POST /api/payment/verify` - Verify payment

### Contact
- `POST /api/contact/submit` - Submit contact form

### Admin (requires admin auth)
- `GET /api/admin/users` - Get all users
- `GET /api/admin/subscriptions` - Get all subscriptions
- `GET /api/admin/contacts` - Get contact submissions

## Testing

### Test User Registration
1. Open http://localhost:8080/index.html
2. Click "LOGIN / REGISTER"
3. Fill in registration form
4. Check email for verification code

### Test Admin Access
1. Click "ADMIN" in the navigation
2. Use credentials from .env file:
   - Email: satansproduction@gmail.com
   - Password: Satans123

### Test Contact Form
1. Scroll to "LET'S CONNECT" section
2. Fill in the contact form
3. Click "Get In Touch"

## Troubleshooting

### Database Connection Error
- Ensure PostgreSQL is running
- Check DB credentials in .env file
- Verify database exists: `sudo -u postgres psql -l`

### Port Already in Use
- Kill process on port 3000: `lsof -ti:3000 | xargs kill -9`
- Or change PORT in .env file

### CORS Errors
- Ensure FRONTEND_URL in .env matches your frontend URL
- Make sure backend is running before loading frontend

### External Resources Blocked
Some external resources (Google Fonts, Razorpay scripts) may be blocked in restricted environments. The website will still function with basic styling.

## Production Deployment

For production deployment:
1. Update NODE_ENV to 'production' in .env
2. Use production Razorpay keys (rzp_live_*)
3. Set up HTTPS
4. Configure proper database credentials
5. Deploy backend to cloud service (Heroku, AWS, etc.)
6. Deploy frontend to static hosting (Netlify, Vercel, etc.)

## Support

For more detailed information, refer to:
- `SETUP_GUIDE.md` - Complete setup guide
- `TESTING_GUIDE.md` - Testing guide
- `ARCHITECTURE.md` - Architecture documentation
- `README.md` - General project information
