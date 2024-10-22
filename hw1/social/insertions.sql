--
INSERT INTO
    Users (username, email)
VALUES
    ('john_doe', 'john@example.com'),
    ('jane_smith', 'jane@example.com'),
    ('alice_jones', 'alice@example.com'),
    ('bob_brown', 'bob@example.com'),
    ('charlie_clark', 'charlie@example.com');

--
INSERT INTO
    Posts (user_id, content, post_date)
VALUES
    (1, 'First post by John', '2024-01-01 10:00:00'),
    (1, 'Second post by John', '2024-01-05 12:00:00'),
    (1, 'Third post by John', '2024-02-01 14:00:00'),
    (2, 'First post by Jane', '2024-01-10 15:00:00'),
    (2, 'Second post by Jane', '2024-01-20 16:00:00'),
    (3, 'First post by Alice', '2024-01-25 17:00:00'),
    (3, 'Second post by Alice', '2024-02-05 18:00:00'),
    (4, 'First post by Bob', '2024-01-30 19:00:00'),
    (4, 'Second post by Bob', '2024-02-10 20:00:00'),
    (5, 'First post by Charlie', '2024-02-15 21:00:00');

-- 
INSERT INTO
    UserSubscriptions (user_id_a, user_id_b)
VALUES
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4),
    (3, 1),
    (3, 4),
    (4, 2),
    (4, 5),
    (5, 3);

--
INSERT INTO
    PostRatings (post_id, user_id, rating)
VALUES
    (1, 2, 4),
    (1, 3, 5),
    (2, 4, 3),
    (3, 5, 4),
    (4, 1, 5),
    (4, 3, 4),
    (5, 1, 3),
    (6, 2, 5),
    (7, 4, 2),
    (8, 3, 4),
    (9, 5, 3),
    (10, 1, 5);
