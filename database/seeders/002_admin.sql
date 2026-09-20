INSERT INTO users (
    role_id,
    name,
    email,
    password,
    status
)
VALUES (
    (SELECT id FROM roles WHERE name = 'admin'),
    'System Administrator',
    'admin@example.com',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llCzKp3kXv5W7N5b1YQ7u',
    'active'
);