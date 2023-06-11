DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region VARCHAR(50) NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    prefered_region INTEGER REFERENCES regions ON DELETE SET NULL
    
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    location VARCHAR(50) NOT NULL,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE posts_categories
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
);


INSERT INTO regions (region)
VALUES
('Buffalo'),
('Tulsa'),
('Washington'),
('Scottsdale'),
('Newark'),
('Virginia Beach');

INSERT INTO categories (category)
VALUES
('pet'),
('appliances'),
('boat parts'),
('security'),
('books'),
('auto'),
('housing'),
('jewelry'),
('tools'),
('toys');

INSERT INTO users (username, prefered_region)
VALUES
('Michael-Robinson', 1),
('Andrea-Parker', 2),
('Veronica-Cunningham', 3),
('Terri-Chavez', 4),
('Kenneth-Ramos', 5),
('Donna-Chang', 6);

INSERT INTO posts (category_id, title, description, user_id, location, region_id)
VALUES
(3, 'cameras for sale', '3 security cameras $30 each', 4, 'Arizona', 4),
(2, 'broken washing machine', 'selling broken washer for parts $65 OBO', 1, 'New York', 1),
(6, '$12,000 pristeen toyota camry', 'Best camry you will find for the price. Email me for details', 6, 'Virginia', 6),
(7, 'Room for rent', 'I have a room for rent, wifi included. $400/month. No pets', 3, 'Distric of Columbia', 3),
(3, 'Kiwasoki boat engine for sale', '$4,000 obo. 300 hours on the motor', 2, 'Oklahoma', 2);

INSERT INTO posts_categories (post_id, category_id)
VALUES
(1,3),
(2,2),
(3,6),
(4,7),
(5,3);

