CREATE TABLE activities (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    attraction_id BIGINT UNSIGNED NOT NULL,

    name VARCHAR(150) NOT NULL,
    description TEXT NULL,
    estimated_cost DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_activities_attraction (attraction_id),

    CONSTRAINT fk_activities_attraction
        FOREIGN KEY (attraction_id)
        REFERENCES attractions(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);