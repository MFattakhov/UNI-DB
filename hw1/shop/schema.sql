-- 
CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- 
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES Clients (client_id) ON DELETE CASCADE,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    amount DECIMAL(10, 2) NOT NULL
);
