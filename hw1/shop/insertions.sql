-- 
INSERT INTO
    Clients (name, email)
VALUES
    ('Иван Иванов', 'ivanov@mail.ru'),
    ('Петр Петров', 'petrov@mail.ru'),
    ('Сергей Сергеев', 'sergeev@mail.ru'),
    ('Мария Смирнова', 'smirnova@mail.ru'),
    ('Алексей Алексеев', 'alekseev@mail.ru'),
    ('Дмитрий Дмитриев', 'dmitriev@mail.ru'),
    ('Ольга Ольгина', 'olgina@mail.ru'),
    ('Николай Николаев', 'nikolaev@mail.ru'),
    ('Елена Еленова', 'elenova@mail.ru'),
    ('Анна Анненкова', 'annenkova@mail.ru');

-- 
INSERT INTO
    Orders (client_id, order_date, amount)
VALUES
    (1, '2024-09-01', 100.00),
    (2, '2024-09-15', 200.00),
    (1, '2024-09-20', 150.00),
    (3, '2024-08-10', 50.00),
    (4, '2024-07-22', 300.00),
    (5, '2024-09-05', 250.00),
    (6, '2024-09-18', 175.00),
    (7, '2024-09-25', 400.00),
    (8, '2024-09-30', 350.00),
    (9, '2024-10-01', 225.00);
