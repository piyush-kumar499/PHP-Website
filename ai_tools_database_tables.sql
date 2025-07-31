CREATE TABLE `access_logs` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `action` varchar(50) NOT NULL,
 `accessed_at` timestamp NOT NULL DEFAULT current_timestamp(),
 `ip_address` varchar(45) DEFAULT NULL,
 `details` text DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci






CREATE TABLE `login_attempts` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `identifier` varchar(255) NOT NULL COMMENT 'Email address or IP address',
 `type` enum('email','ip','device') NOT NULL COMMENT 'Type of identifier',
 `attempt_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Number of failed attempts',
 `last_attempt` datetime NOT NULL COMMENT 'Time of the last attempt',
 `is_blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether the user is blocked',
 `block_expires` datetime DEFAULT NULL COMMENT 'When the block expires',
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 PRIMARY KEY (`id`),
 KEY `idx_identifier_type` (`identifier`,`type`),
 KEY `idx_block_status` (`is_blocked`,`block_expires`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci







CREATE TABLE `otp_resend_tracking` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `identifier` varchar(255) NOT NULL COMMENT 'Email or IP address',
 `user_id` int(11) DEFAULT NULL,
 `attempts` int(11) NOT NULL DEFAULT 0,
 `last_resend` datetime NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`),
 UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci





CREATE TABLE `password_resets` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `user_id` int(11) NOT NULL,
 `token` varchar(64) NOT NULL,
 `expires_at` datetime NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`),
 UNIQUE KEY `token` (`token`),
 KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci




CREATE TABLE `tools` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(255) NOT NULL,
 `slug` varchar(255) NOT NULL,
 `description` text DEFAULT NULL,
 `icon` text DEFAULT NULL,
 `icon_type` varchar(50) DEFAULT NULL,
 `file_path` varchar(255) NOT NULL,
 `category` varchar(100) DEFAULT NULL,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 `is_active` tinyint(1) DEFAULT 1,
 PRIMARY KEY (`id`),
 UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci






CREATE TABLE `tools_search_index` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `tool_id` int(11) NOT NULL,
 `search_text` text NOT NULL,
 `keywords` text DEFAULT NULL,
 `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 PRIMARY KEY (`id`),
 UNIQUE KEY `tool_id` (`tool_id`),
 FULLTEXT KEY `search_text` (`search_text`),
 FULLTEXT KEY `keywords` (`keywords`),
 CONSTRAINT `fk_tools_search_index_tool_id` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci







CREATE TABLE `tool_details` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `tool_id` int(11) NOT NULL,
 `markdown_content` longtext NOT NULL,
 `details_file_path` varchar(255) NOT NULL,
 `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
 PRIMARY KEY (`id`),
 UNIQUE KEY `tool_id` (`tool_id`),
 CONSTRAINT `fk_tool_details_tool_id` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci






CREATE TABLE `tool_stats` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `tool_id` int(11) NOT NULL,
 `views` int(11) NOT NULL DEFAULT 0,
 `last_viewed` timestamp NULL DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `tool_id` (`tool_id`),
 CONSTRAINT `fk_tool_stats_tool_id` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci







CREATE TABLE `tool_usage` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `user_id` int(11) NOT NULL,
 `tool_id` int(11) NOT NULL,
 `used_at` timestamp NOT NULL DEFAULT current_timestamp(),
 `details` text DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `user_id` (`user_id`),
 KEY `tool_id` (`tool_id`),
 KEY `used_at` (`used_at`),
 CONSTRAINT `fk_tool_usage_tool_id` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`id`) ON DELETE CASCADE,
 CONSTRAINT `fk_tool_usage_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci





CREATE TABLE `users` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(100) NOT NULL,
 `email` varchar(100) NOT NULL,
 `password` varchar(255) NOT NULL,
 `registration_date` datetime NOT NULL,
 `last_login` datetime NOT NULL,
 `user_level` tinyint(1) NOT NULL DEFAULT 1,
 `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
 `profile_image` varchar(255) DEFAULT NULL,
 `bio` text DEFAULT NULL,
 `scheduled_deletion` datetime DEFAULT NULL,
 `role` enum('user','admin') DEFAULT 'user',
 `email_verified` tinyint(1) DEFAULT 0,
 `registration_status` enum('active','cancelled','completed') NOT NULL DEFAULT 'active',
 `cancelled_at` datetime DEFAULT NULL,
 `reset_token` varchar(64) DEFAULT NULL,
 `reset_expiry` datetime DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `email` (`email`),
 KEY `status` (`status`),
 KEY `user_level` (`user_level`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci






CREATE TABLE `user_logins` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `user_id` int(11) NOT NULL,
 `login_time` datetime NOT NULL,
 `ip_address` varchar(45) DEFAULT NULL,
 `user_agent` varchar(255) DEFAULT NULL,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`),
 KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci






CREATE TABLE `user_otps` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `user_id` int(11) NOT NULL,
 `otp` varchar(10) NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 `expires_at` datetime NOT NULL,
 PRIMARY KEY (`id`),
 KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci