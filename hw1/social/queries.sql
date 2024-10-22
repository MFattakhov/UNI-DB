-- name: GetUserSubscriptions :many
SELECT
    u_b.username
FROM
    UserSubscriptions us
    JOIN Users u_a ON us.user_id_a = u_a.user_id
    JOIN Users u_b ON us.user_id_b = u_b.user_id
WHERE
    u_a.username = $1::text;

-- name: GetUserSubscribers :many
SELECT
    u_a.username
FROM
    UserSubscriptions us
    JOIN Users u_a ON us.user_id_a = u_a.user_id
    JOIN Users u_b ON us.user_id_b = u_b.user_id
WHERE
    u_b.username = $1::text;

-- name: GetMutualSubscribers :many
SELECT
    u_b.username
FROM
    UserSubscriptions us1
    JOIN UserSubscriptions us2 ON us1.user_id_a = us2.user_id_b
    AND us1.user_id_b = us2.user_id_a
    JOIN Users u_a ON us1.user_id_a = u_a.user_id
    JOIN Users u_b ON us1.user_id_b = u_b.user_id
WHERE
    u_a.username = $1::text;

-- name: GetUsersNoSubscriptions :many
SELECT
    u.username
FROM
    Users u
    LEFT JOIN UserSubscriptions us ON u.user_id = us.user_id_a
WHERE
    us.user_id_a IS NULL;

-- name: GetUsersNoSubscribers :many
SELECT
    u.username
FROM
    Users u
    LEFT JOIN UserSubscriptions us ON u.user_id = us.user_id_b
WHERE
    us.user_id_b IS NULL;

-- name: GetAllUserPosts :many
SELECT
    p.post_id,
    p.content,
    p.post_date
FROM
    Posts p
    JOIN Users u ON p.user_id = u.user_id
WHERE
    u.username = $1::text
ORDER BY
    p.post_date DESC;

-- name: GetUserPosts :many
SELECT
    p.post_id,
    p.content,
    p.post_date
FROM
    Posts p
    JOIN Users u ON p.user_id = u.user_id
WHERE
    u.username = $1::text
    AND p.post_date BETWEEN $2::timestamp AND $3::timestamp
ORDER BY
    p.post_date DESC;

-- name: GetUserPostsPage :many
WITH
    RankedPosts AS (
        SELECT
            p.post_id,
            p.content,
            p.post_date,
            ROW_NUMBER() OVER (
                ORDER BY
                    p.post_date DESC
            ) AS row_num
        FROM
            Posts p
            JOIN Users u ON p.user_id = u.user_id
        WHERE
            u.username = $1::text
    )
SELECT
    post_id,
    content,
    post_date
FROM
    RankedPosts
WHERE
    row_num BETWEEN ($2::int - 1) * $3::int + 1 AND $2::int * $3::int;

-- name: GetUserFeedPge :many
WITH
    RankedPosts AS (
        SELECT
            p.post_id,
            p.content,
            p.post_date,
            ROW_NUMBER() OVER (
                ORDER BY
                    p.post_date DESC
            ) AS row_num
        FROM
            Posts p
            JOIN UserSubscriptions us ON p.user_id = us.user_id_b
            JOIN Users u_a ON us.user_id_a = u_a.user_id
        WHERE
            u_a.username = $1::text
    )
SELECT
    post_id,
    content,
    post_date
FROM
    RankedPosts
WHERE
    row_num BETWEEN ($2::int - 1) * $3::int + 1 AND $2::int * $3::int;

-- name: GetAvgUserPostRating :many
SELECT
    AVG(pr.rating) AS avg_post_rating
FROM
    Posts p
    JOIN PostRatings pr ON p.post_id = pr.post_id
    JOIN Users u ON p.user_id = u.user_id
WHERE
    u.username = $1::text;
