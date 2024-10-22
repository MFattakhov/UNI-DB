-- 
INSERT INTO
    Publishers (name)
VALUES
    ('Epic Games'),
    ('Ubisoft'),
    ('Valve');

-- 
INSERT INTO
    Games (title, release_date, publisher_id)
VALUES
    ('Fortnite', '2017-07-25', 1),
    ('Assassin''s Creed', '2007-11-13', 2),
    ('Half-Life', '1998-11-19', 3),
    ('Far Cry', '2004-03-23', 2),
    ('Dota 2', '2013-07-09', 3),
    ('Rainbow Six', '1998-08-21', 2),
    ('Unreal Tournament', '1999-11-30', 1),
    ('Left 4 Dead', '2008-11-18', 3),
    ('Valorant', '2020-06-02', 1),
    ('Ghost Recon', '2001-11-13', 2);

-- 
INSERT INTO
    Users (name, is_critic)
VALUES
    ('Анна Критик', TRUE),
    ('Михаил Игрок', FALSE),
    ('Ольга Критик', TRUE),
    ('Евгений Игрок', FALSE),
    ('Ирина Критик', TRUE),
    ('Андрей Игрок', FALSE),
    ('Екатерина Критик', TRUE),
    ('Павел Игрок', FALSE),
    ('Татьяна Критик', TRUE),
    ('Константин Игрок', FALSE);

-- 
INSERT INTO
    GameRatings (game_id, user_id, rating, rating_date)
VALUES
    (1, 1, 9.0, '2024-09-10'),
    (1, 2, 8.0, '2024-09-11'),
    (2, 3, 7.5, '2024-09-12'),
    (2, 4, 8.5, '2024-09-15'),
    (3, 5, 7.0, '2024-09-20'),
    (3, 6, 8.0, '2024-09-22'),
    (4, 7, 9.0, '2024-09-23'),
    (5, 8, 7.5, '2024-09-25'),
    (6, 9, 8.0, '2024-09-27'),
    (7, 10, 8.5, '2024-09-30');