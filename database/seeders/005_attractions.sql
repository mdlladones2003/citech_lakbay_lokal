INSERT INTO attractions (
    category_id,
    location_id,
    name,
    slug,
    description,
    entrance_fee,
    opening_time,
    closing_time,
    contact_number,
    featured,
    status
)
VALUES
(
    (
        SELECT id
        FROM categories
        WHERE slug = 'waterfall'
    ),
    1,
    'Sample Community Waterfall',
    'sample-community-waterfall',
    'A local natural attraction featuring a scenic waterfall and surrounding natural environment.',
    50.00,
    '08:00:00',
    '17:00:00',
    '09123456789',
    TRUE,
    'published'
),
(
    (
        SELECT id
        FROM categories
        WHERE slug = 'mountain'
    ),
    2,
    'Sample Mountain View',
    'sample-mountain-view',
    'A scenic mountain destination suitable for hiking, sightseeing, and photography.',
    30.00,
    '06:00:00',
    '18:00:00',
    '09123456788',
    TRUE,
    'published'
),
(
    (
        SELECT id
        FROM categories
        WHERE slug = 'historical-site'
    ),
    3,
    'Sample Heritage Site',
    'sample-heritage-site',
    'A local heritage destination highlighting the history and culture of the community.',
    0.00,
    '08:00:00',
    '17:00:00',
    NULL,
    FALSE,
    'published'
);