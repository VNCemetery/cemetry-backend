-- Bảng Refresh Tokens
CREATE TABLE IF NOT EXISTS refresh_tokens
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id    BIGINT       NOT NULL,
    token      VARCHAR(512) NOT NULL,
    expires_at TIMESTAMP    NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Bảng Logs
CREATE TABLE IF NOT EXISTS logs
(
    id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id   BIGINT,
    action    VARCHAR(255) NOT NULL,
    resource  VARCHAR(255),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);