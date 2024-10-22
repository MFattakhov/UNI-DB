-- name: OrderCountByClient :many
SELECT
    c.name,
    COUNT(o.order_id) AS order_count
FROM
    Clients c
    LEFT JOIN Orders o ON c.client_id = o.client_id
GROUP BY
    c.name;

-- name: LastMonthOrders :many
SELECT
    o.order_date,
    c.name
FROM
    Orders o
    JOIN Clients c ON o.client_id = c.client_id
WHERE
    o.order_date >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
    AND o.order_date < DATE_TRUNC('month', CURRENT_DATE)
ORDER BY
    o.order_date DESC;

-- name: MaxOrdersClient :one
SELECT
    c.name,
    COUNT(o.order_id) AS order_count
FROM
    Clients c
    JOIN Orders o ON c.client_id = o.client_id
GROUP BY
    c.name
ORDER BY
    order_count DESC
LIMIT
    1;

-- name: Top10ClientsByOrderCount :many
SELECT
    c.name,
    SUM(o.amount) AS total_amount
FROM
    Clients c
    JOIN Orders o ON c.client_id = o.client_id
GROUP BY
    c.name
ORDER BY
    total_amount DESC
LIMIT
    10;

-- name: MinAvgOrderDelta :one
SELECT
    c.name,
    maod.avg_delta_days
FROM
    Clients c
    RIGHT JOIN (
        SELECT
            client_id,
            (MAX(order_date) - MIN(order_date)) / (COUNT(*) - 1) AS avg_delta_days
        FROM
            Orders o
        GROUP BY
            o.client_id
        HAVING
            COUNT(*) > 1
        ORDER BY
            avg_delta_days
        LIMIT
            1
    ) maod ON maod.client_id = c.client_id;
