# 🧠 AI Tools Web Portal

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![PHP](https://img.shields.io/badge/php-%3E=7.4-blue)
![MySQL](https://img.shields.io/badge/MySQL-Compatible-lightgrey)
![Status](https://img.shields.io/badge/status-Active-success)
![Security](https://img.shields.io/badge/security-SSL%20recommended-critical)

A secure, modular PHP-based web portal designed to showcase AI tools. It includes OTP-based authentication, dynamic Markdown rendering, a robust admin system, and MySQL database support.

---

## 📁 Project Structure

```
/htdocs
├── /private
│   ├── /lib
│   │   └── /Parsedown
│   │       ├── Parsedown.php
│   │       └── ParsedownExtra.php
│   ├── /PHPMailer
│   │   ├── class.phpmailer.php
│   │   ├── class.smtp.php
│   │   └── class.pop3.php
│   ├── auth.php
│   ├── config.php
│   ├── db.php
│   ├── email_otp.php
│   ├── favicon.php
│   ├── login_tracker.php
│   ├── messages.php
│   ├── password_reset.php
│   └── sync-tools.php
│
├── /public
│   ├── /assets
│   │   ├── /css
│   │   │   ├── markdown-extra.css
│   │   │   ├── profile-protected.css
│   │   │   ├── settings-protected.css
│   │   │   ├── styles.css
│   │   │   ├── tool-display.css
│   │   │   └── tools-portal.css
│   │   ├── /images
│   │   │   ├── android-chrome-192x192.png
│   │   │   ├── android-chrome-512x512.png
│   │   │   ├── apple-touch-icon.png
│   │   │   ├── favicon-16x16.png
│   │   │   ├── favicon-32x32.png
│   │   │   ├── favicon.ico
│   │   │   └── logo.png
│   │   └── /js
│   │       ├── auth.js
│   │       └── main.js
│   ├── /error
│   │   ├── 400.php through 504.php
│   ├── /homepage
│   │   ├── faqs.php, pricing.php, timer.php
│   ├── /page
│   │   ├── about.php, apply.php, careers.php, etc.
│   ├── /settings1
│   │   └── settings-faqs.php
│   ├── /tools
│   │   ├── index.php, tool.php
│   │   ├── /details
│   │   │   ├── text-generator.md
│   │   │   └── image-processor.md
│   │   └── /files
│   │       ├── text-generator.php
│   │       ├── image-processor.php
│   │       └── [additional-tool].php
│   ├── .htaccess
│   ├── ai-tools.php
│   ├── features.php
│   ├── footer.php
│   ├── forgot-password.php
│   ├── header.php
│   ├── index.php
│   ├── login.php
│   ├── logout.php
│   ├── popup-auth.php
│   ├── profile.php
│   ├── profile_update_handler.php
│   ├── register.php
│   ├── reset-password.php
│   ├── search.php
│   ├── settings.php
│   ├── site.webmanifest.php
│   └── verify_otp.php
│
├── .htaccess
```

---

## ✨ Features

- ✅ OTP-based secure login/registration
- ✅ AI tools organized using Markdown and PHP
- ✅ Admin panel for synchronizing tool data
- ✅ Contact form and email communication using PHPMailer
- ✅ Parsedown library for Markdown rendering
- ✅ Clean modular PHP backend

---

## ⚙️ Environment Setup

### Requirements

- PHP 7.4+
- MySQL or MariaDB
- Apache (with `mod_rewrite`)
- Composer (optional)

### Installation

1. Clone the project or unzip it in your server root:
   ```bash
   git clone https://github.com/yourusername/ai-tools-web-portal.git
   ```

2. Set up the database:
   ```bash
   mysql -u root -p your_db < /private/ai_tools_database_tables.sql
   ```

3. Configure credentials in `private/config.php`:
   ```php
   define('DB_HOST', 'localhost');
   define('DB_USER', 'your_user');
   define('DB_PASS', 'your_pass');
   define('DB_NAME', 'your_db');
   ```

4. Set up email in `private/email_otp.php` using PHPMailer:
   ```php
   $mail->Host = 'smtp.example.com';
   $mail->Username = 'your@example.com';
   $mail->Password = 'yourpassword';
   ```

5. Open the app in your browser:
   ```
   http://localhost/
   ```

---

## 🧪 Test Checklist

| Feature           | Tested? | Notes                      |
|------------------|---------|----------------------------|
| Register/Login    | ✅      | OTP email flow works       |
| Tool Preview      | ✅      | Markdown renders correctly |
| Admin Sync        | ✅      | Adds tools from database   |
| Contact Form      | ✅      | Emails delivered via SMTP  |

---

## 🔐 Security Recommendations

- Use HTTPS in production
- Protect `private/` with server-level config
- Sanitize all user inputs
- Enable CSRF tokens on forms
- Regenerate sessions on login

---

## 🚀 Roadmap

- [ ] Add pagination and search to tools
- [ ] Admin dashboard analytics
- [ ] Public API for tools (RESTful)
- [ ] OAuth login via Google/GitHub
- [ ] Language localization support

---

## 👨‍💻 Author

**Piyush Kumar**  
_B.Tech CSE (AI & ML), Gopalganj, Bihar_  
📧 [Add your contact or portfolio link]

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙏 Acknowledgements

- [PHPMailer](https://github.com/PHPMailer/PHPMailer)
- [Parsedown](https://parsedown.org)
- [FontAwesome](https://fontawesome.com/)
