# AI Tools Web Portal

A complete PHP-based AI Tools web application featuring user authentication, admin synchronization, OTP email verification, and database-driven AI tool listings. Designed with security, modularity, and scalability in mind.

---

## 📁 Project Structure

```
htdocs/
│
├── public/                 # Public-facing pages
│   ├── index.php           # Homepage
│   ├── login.php           # Login interface
│   ├── register.php        # Registration form
│   ├── admin-sync.php      # Admin tool for syncing data
│   └── ...                 # Other UI pages and assets
│
├── private/                # Server-side backend logic
│   ├── auth.php            # Auth system
│   ├── db.php              # DB connection and handlers
│   ├── config.php          # Central configuration
│   ├── messages.php        # Contact form handler
│   ├── email_otp.php       # OTP verification via email
│   ├── login_tracker.php   # IP & login logging
│   ├── bootstrap.php       # Core app bootstrap
│   └── ...                 # Additional private scripts
│
├── PHPMailer/              # Included PHPMailer lib
│
├── lib/Parsedown/          # Markdown rendering lib
│
├── ai_tools_database_tables.sql  # SQL schema for the tools DB
├── .htaccess               # Apache rules (redirects, security)
└── README.md               # Project documentation
```

---

## 🚀 Features

- 🔐 **Authentication**: Login, Registration, OTP verification via Email  
- 🛡️ **Security Enhancements**:
  - `.htaccess` for access control
  - SQL Injection protection (prepared statements expected)
  - Login tracking with IP logging
- ⚙️ **Admin Sync Tool**: Synchronize AI tools via `admin-sync.php`
- 📄 **Markdown Parsing**: Using Parsedown for rich content rendering
- 📬 **Contact Form**: Built-in handler with email functionality
- 📊 **Database Integration**: MySQL backend with schema provided
- ✉️ **Email Handling**: Integrated with PHPMailer
- 🔄 **Session Management**: Via `auth.php` and `bootstrap.php`

---

## 🛠️ Setup Instructions

### Requirements

- PHP 7.4+
- MySQL / MariaDB
- Apache Server (with mod_rewrite enabled)
- Composer (optional, for dependency management)

### Installation Steps

1. **Clone or Extract the Repository**

   ```bash
   git clone <your-repo-url>
   # or extract the .zip in your server's web root
   ```

2. **Set Up the Database**

   - Import the SQL file:
     ```bash
     mysql -u your_user -p your_database < private/ai_tools_database_tables.sql
     ```

3. **Configure Database Credentials**

   Open `private/config.php` and update:

   ```php
   define('DB_HOST', 'localhost');
   define('DB_NAME', 'your_database');
   define('DB_USER', 'your_username');
   define('DB_PASS', 'your_password');
   ```

4. **Set Up Email (PHPMailer)**

   In `email_otp.php`, configure SMTP:

   ```php
   $mail->isSMTP();
   $mail->Host = 'smtp.yourmail.com';
   $mail->SMTPAuth = true;
   $mail->Username = 'your_email';
   $mail->Password = 'your_password';
   ```

5. **Deploy on Localhost or Server**

   - Place `htdocs/` contents into `/var/www/html/` or your server root.
   - Ensure `.htaccess` is functioning correctly.

---

## 🧪 Testing

- Register a user and verify OTP
- Submit a contact form
- Log in/out
- Access admin-sync page (if available to user)

---

## 📚 Technologies Used

- **PHP** (Core Logic)
- **MySQL** (Database)
- **PHPMailer** (Email)
- **Parsedown** (Markdown rendering)
- **HTML/CSS/JS** (Frontend)

---

## 🔐 Security Tips (Production)

- Change all default credentials and secure `config.php`
- Implement CSRF tokens on forms
- Restrict `private/` access via `.htaccess`
- Use HTTPS

---

## 👨‍💻 Author

**Piyush Kumar**  
B.Tech CSE (AI & ML)  
Gopalganj, Bihar

---

## 📜 License

This project is licensed under the MIT License.
