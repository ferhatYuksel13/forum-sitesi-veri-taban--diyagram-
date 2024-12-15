CREATE TABLE IF NOT EXISTS `categories` (
	`id` int NOT NULL,
	`name` varchar(255) DEFAULT '100',
	`description` text,
	`created_at` datetime,
	`updated_at` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `emoji_reactions` (
	`emoji` varchar(255) DEFAULT '50',
	`id` int NOT NULL,
	`post_id` int,
	`user_id` int,
	`created_at` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `likes` (
	`id` int NOT NULL,
	`post_id` int,
	`user_id` int,
	`created_at` datetime,
	`updated_at` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `posts` (
	`id` int NOT NULL,
	`title` varchar(255) DEFAULT '255',
	`content` text,
	`user_id` int,
	`category_id` int,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `replies` (
	`id` int NOT NULL,
	`content` text,
	`post_id` int,
	`user_id` int,
	`created_at` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `sessions` (
	`id` int NOT NULL,
	`user_id` int,
	`session_token` varchar(255) DEFAULT '255',
	`created_at` datetime,
	`expires_at` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `topics` (
	`id` int NOT NULL,
	`title` varchar(255) DEFAULT '255',
	`category_id` int,
	`created_at` datetime,
	`updated_at` datetime,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `users` (
	`id` int NOT NULL,
	`username` varchar(255) DEFAULT '100',
	`email` varchar(255) DEFAULT '100',
	`password_hash` varchar(255) DEFAULT '255',
	`created_at` datetime,
	PRIMARY KEY (`id`)
);


ALTER TABLE `emoji_reactions` ADD CONSTRAINT `emoji_reactions_fk2` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `emoji_reactions` ADD CONSTRAINT `emoji_reactions_fk3` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);
ALTER TABLE `likes` ADD CONSTRAINT `likes_fk1` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `likes` ADD CONSTRAINT `likes_fk2` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);
ALTER TABLE `posts` ADD CONSTRAINT `posts_fk3` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `posts` ADD CONSTRAINT `posts_fk4` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE `replies` ADD CONSTRAINT `replies_fk2` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);

ALTER TABLE `replies` ADD CONSTRAINT `replies_fk3` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);
ALTER TABLE `sessions` ADD CONSTRAINT `sessions_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);
ALTER TABLE `topics` ADD CONSTRAINT `topics_fk2` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);
