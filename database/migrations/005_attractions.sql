CREATE TABLE attractions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_id BIGINT UNSIGNED NOT NULL,
    location_id BIGINT UNSIGNED NOT NULL,

    name VARCHAR(200) NOT NULL,
    slug VARCHAR(220) NOT NULL UNIQUE,
    description TEXT NOT NULL,

    entrance_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    opening_time TIME NULL,
    closing_time TIME NULL,

    contact_number VARCHAR(30) NULL,
    contact_email VARCHAR(150) NULL,

    featured BOOLEAN NOT NULL DEFAULT FALSE,

    status ENUM(
        'draft',
        'published',
        'inactive'
    ) NOT NULL DEFAULT 'draft',

    created_by BIGINT UNSIGNED NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_attractions_category (category_id),
    INDEX idx_attractions_location (location_id),
    INDEX idx_attractions_status (status),
    INDEX idx_attractions_featured (featured),

    CONSTRAINT fk_attractions_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_attractions_location
        FOREIGN KEY (location_id)
        REFERENCES locations(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_attractions_creator
        FOREIGN KEY (created_by)
        REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);