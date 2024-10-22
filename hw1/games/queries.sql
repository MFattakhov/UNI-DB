-- name: GameListWithRatings :many
SELECT
    g.title,
    AVG(
        CASE
            WHEN u.is_critic THEN gr.rating
        END
    ) AS avg_critic_rating,
    AVG(
        CASE
            WHEN u.is_critic = FALSE THEN gr.rating
        END
    ) AS avg_user_rating
FROM
    Games g
    JOIN GameRatings gr ON g.game_id = gr.game_id
    JOIN Users u ON gr.user_id = u.user_id
GROUP BY
    g.title;

-- PublishersListWithCriticsRatings :many
SELECT
    p.name AS publisher_name,
    AVG(gr.rating) AS avg_critic_rating
FROM
    Publishers p
    JOIN Games g ON p.publisher_id = g.publisher_id
    JOIN GameRatings gr ON g.game_id = gr.game_id
    JOIN Users u ON gr.user_id = u.user_id
WHERE
    u.is_critic = TRUE
GROUP BY
    p.name;

-- name: GameWithBiggestRatingDiff :one
WITH
    RatingsDiff AS (
        SELECT
            g.title,
            AVG(
                CASE
                    WHEN u.is_critic THEN gr.rating
                END
            ) AS avg_critic_rating,
            AVG(
                CASE
                    WHEN u.is_critic = FALSE THEN gr.rating
                END
            ) AS avg_user_rating
        FROM
            Games g
            JOIN GameRatings gr ON g.game_id = gr.game_id
            JOIN Users u ON gr.user_id = u.user_id
        GROUP BY
            g.game_id
    )
SELECT
    title,
    ABS(avg_critic_rating - avg_user_rating) AS rating_diff
FROM
    RatingsDiff
WHERE
    avg_critic_rating IS NOT NULL
    AND avg_user_rating IS NOT NULL
ORDER BY
    rating_diff DESC
LIMIT
    1;

-- name: GamesWithUserRatingMoreThanAvg :many
WITH
    AvgUserRating AS (
        SELECT
            g.game_id,
            g.title,
            AVG(
                CASE
                    WHEN u.is_critic = FALSE THEN gr.rating
                END
            ) AS avg_user_rating
        FROM
            Games g
            JOIN GameRatings gr ON g.game_id = gr.game_id
            JOIN Users u ON gr.user_id = u.user_id
        GROUP BY
            g.game_id,
            g.title
    ),
    OverallAvgRating AS (
        SELECT
            AVG(avg_user_rating) AS overall_avg_user_rating
        FROM
            AvgUserRating
    )
SELECT
    a.title,
    a.avg_user_rating
FROM
    AvgUserRating a,
    OverallAvgRating o
WHERE
    a.avg_user_rating > o.overall_avg_user_rating;
