CREATE TABLE reviews (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id BIGINT UNSIGNED NOT NULL,
    attraction_id BIGINT UNSIGNED NOT NULL,

    rating TINYINT UNSIGNED NOT NULL,
    comment TEXT NULL,

    status ENUM(
        'pending',
        'approved',
        'rejected'
    ) NOT NULL DEFAULT 'pending',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_reviews_user (user_id),
    INDEX idx_reviews_attraction (attraction_id),
    INDEX idx_reviews_status (status),

    CONSTRAINT chk_reviews_rating
        CHECK (rating BETWEEN 1 AND 5),

    CONSTRAINT fk_reviews_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_reviews_attraction
        FOREIGN KEY (attraction_id)
        REFERENCES attractions(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    UNIQUE KEY unique_user_attraction_review (
        user_id,
        attraction_id
    )
);