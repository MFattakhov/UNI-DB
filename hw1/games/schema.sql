-- 
CREATE TABLE Publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- 
CREATE TABLE Games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    publisher_id INT REFERENCES Publishers (publisher_id) ON DELETE CASCADE
);

-- 
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    is_critic BOOLEAN DEFAULT FALSE
);

-- 
CREATE TABLE GameRatings (
    rating_id SERIAL PRIMARY KEY,
    game_id INT REFERENCES Games (game_id) ON DELETE CASCADE,
    user_id INT REFERENCES Users (user_id) ON DELETE CASCADE,
    rating DECIMAL(2, 1) NOT NULL CHECK (
        rating >= 0
        AND rating <= 10
    ),
    rating_date DATE NOT NULL DEFAULT CURRENT_DATE
);