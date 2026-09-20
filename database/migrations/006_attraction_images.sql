CREATE TABLE attraction_images (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    attraction_id BIGINT UNSIGNED NOT NULL,

    image_path VARCHAR(255) NOT NULL,
    caption VARCHAR(255) NULL,

    is_primary BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_images_attraction (attraction_id),

    CONSTRAINT fk_images_attraction
        FOREIGN KEY (attraction_id)
        REFERENCES attractions(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);