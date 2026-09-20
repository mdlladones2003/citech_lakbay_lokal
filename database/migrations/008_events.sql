CREATE TABLE events (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    attraction_id BIGINT UNSIGNED NULL,

    name VARCHAR(200) NOT NULL,
    description TEXT NULL,

    event_date DATE NOT NULL,
    start_time TIME NULL,
    end_time TIME NULL,

    location VARCHAR(255) NULL,

    image VARCHAR(255) NULL,

    status ENUM(
        'draft',
        'published',
        'cancelled',
        'completed'
    ) NOT NULL DEFAULT 'draft',

    created_by BIGINT UNSIGNED NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_events_date (event_date),
    INDEX idx_events_status (status),

    CONSTRAINT fk_events_attraction
        FOREIGN KEY (attraction_id)
        REFERENCES attractions(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_events_creator
        FOREIGN KEY (created_by)
        REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);