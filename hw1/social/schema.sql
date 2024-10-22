--
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL
);

--
CREATE TABLE UserSubscriptions (
    user_id_a INT REFERENCES Users (user_id) ON DELETE CASCADE,
    user_id_b INT REFERENCES Users (user_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id_a, user_id_b)
);

--
CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users (user_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--
CREATE TABLE PostRatings (
    post_id INT REFERENCES Posts (post_id) ON DELETE CASCADE,
    user_id INT REFERENCES Users (user_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    PRIMARY KEY (post_id, user_id)
);
