CREATE TABLE IF NOT EXISTS `users`
(
    `id`       BIGINT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email`    VARCHAR(255) NOT NULL,
    CONSTRAINT `jfkwalfje` UNIQUE (`username`),
    CONSTRAINT `kfjweifjt` UNIQUE (`email`)
);

CREATE TABLE IF NOT EXISTS `verify_codes`
(
    `id`         BIGINT PRIMARY KEY AUTO_INCREMENT,
    `code`       VARCHAR(255) NOT NULL,
    `expired_at` DATETIME     NOT NULL,
    `created_at` DATETIME     NOT NULL,
    `user_id`    BIGINT          NOT NULL,
    CONSTRAINT `askelfjwaef` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)