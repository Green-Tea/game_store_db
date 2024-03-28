-- Insert dummy data into the publishers table
INSERT INTO publishers (name, email, address, revenue_split)
VALUES
    ('Blizzard', 'blizzard@example.com', 'Blizzard Address', 70),
    ('Electronic Arts', 'ea@example.com', 'EA Address', 65),
    ('FromSoftware Inc.', 'fromsoft@example.com', 'Shibuya Hikarie 27F, 2-21-1 Shibuya, Shibuya-ku, Tokyo, 150-8510 Japan', 40),
    ('CAPCOM Co., Ltd', 'capcom@example.com', '3-1-3 Uchihiranomachi, Chuo-ku, Osaka, 540-0037, Japan', 40),
    ('PlayStation PC LLC', 'playstation@example.com', 'PlayStation Address', 30);

-- Insert dummy data into the games table
-- DO NOT DEFINE GENRES YET, A TRIGGER IS SET TO AUTOMATICALLY UPDATE game_genres_junction UPON SETTING GENRES
INSERT INTO games (title, description, retail_price, publisher_id, developer_name, release_date)
VALUES
    ('Apex Legends',
     'Apex Legends is the award-winning, free-to-play Hero Shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities, and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.',
     0,
     2,
     'Respawn Studios',
     CAST('2020-11-05' AS DATE)),
    ('Elden Ring',
     'THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.',
     60.00,
     3,
     'FromSoftware Inc.',
     CAST('2022-02-25' AS DATE)),
    ('HELLDIVERS 2',
     'The Galaxy’s Last Line of Offence. Enlist in the Helldivers and join the fight for freedom across a hostile galaxy in a fast, frantic, and ferocious third-person shooter.',
     40.00,
     5,
     'Arrowhead Game Studios',
     CAST('2024-02-08' AS DATE)),
    ('Monster Hunter: World',
     'Welcome to a new world! In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.',
     30.00,
     4,
     'CAPCOM Co., Ltd',
     CAST('2018-08-08' AS DATE)),
    ('Monster Hunter: Rise',
     'Rise to the challenge and join the hunt! In Monster Hunter Rise, the latest installment in the award-winning and top-selling Monster Hunter series, you’ll become a hunter, explore brand new maps and use a variety of weapons to take down fearsome monsters as part of an all-new storyline.',
     40.00,
     4,
     'CAPCOM Co., Ltd',
     CAST('2022-01-13' AS DATE));

-- Insert dummy data into the customers table
INSERT INTO customers (first_name, last_name, display_name, email, password)
VALUES
    ('John', 'Doe', 'JohnnyDooo', 'JohnDoe@gmail.com', 'password'),
    ('Mary', 'Jane', 'MJ', 'janemary@gmail.com', '12345'),
    ('Clark', 'Kent', 'Superman', 'imnotsuperman@gmail.com', 'batman');

-- Insert dummy data into customer_payment_info table
INSERT INTO  customer_payment_info (customer_id, cardholder_name, card_number, cvv, expiration_date, billing_address, card_issuer)
VALUES
    (1, 'John Doe', 5555555555554444, 123, CAST('2028-04-11' AS DATE), '308 Negra Arroyo Lane, Albuquerque, New Mexico', 'MasterCard'),
    (2, 'Mary Jane', 4111111111111111, 123, CAST('2025-10-21' AS DATE), 'Example Address', 'Visa');

-- Pre-define available game genres
INSERT INTO game_genres (genre_name)
VALUES
    ('Action'),
    ('Platformer'),
    ('Shooter'),
    ('FPS'),
    ('Third Person'),
    ('Fighting Game'),
    ('Beat em up'),
    ('Stealth'),
    ('Survival'),
    ('Rhythm Game'),
    ('Battle Royale'),
    ('Adventure'),
    ('Horror'),
    ('Metroidvania'),
    ('Text Based'),
    ('Visual Novel'),
    ('Puzzle'),
    ('Physics'),
    ('RPG'),
    ('MMORPG'),
    ('Multiplayer'),
    ('Roguelike'),
    ('Tactical RPG'),
    ('Sandbox'),
    ('Party Game'),
    ('Simulation'),
    ('Strategy'),
    ('Auto Chess'),
    ('MOBA'),
    ('RTS'),
    ('RTT'),
    ('Tower Defense'),
    ('Turn-based'),
    ('Sports'),
    ('Racing'),
    ('Board Game'),
    ('Card Game'),
    ('Gacha'),
    ('Idle'),
    ('Trivia'),
    ('Typing'),
    ('Casual'),
    ('Esports'),
    ('Educational'),
    ('Fitness'),
    ('Creative'),
    ('Open World'),
    ('Free'),
    ('PVE'),
    ('Fantasy'),
    ('Dark'),
    ('Souls-like'),
    ('Co-op'),
    ('Hunting');

-- Update genre for existing games
UPDATE games
SET genre_ids = ARRAY(
    SELECT genre_id FROM game_genres WHERE genre_name = ANY('{FPS, Battle Royale, Multiplayer, Free}')
)
WHERE game_id = 1;

UPDATE games
SET genre_ids = ARRAY(
    SELECT genre_id FROM game_genres WHERE genre_name = ANY('{Open World, RPG, Dark, Fantasy, Souls-like}')
)
WHERE game_id = 2;

UPDATE games
SET genre_ids = ARRAY(
    SELECT genre_id FROM game_genres WHERE genre_name = ANY('{Co-op, Multiplayer, Third Person, PVE}')
)
WHERE game_id = 3;

UPDATE games
SET genre_ids = ARRAY(
    SELECT genre_id FROM game_genres WHERE genre_name = ANY('{Co-op, Multiplayer, Action, Open World, RPG, Hunting}')
)
WHERE game_id = 4;

UPDATE games
SET genre_ids = ARRAY(
    SELECT genre_id FROM game_genres WHERE genre_name = ANY('{Action, RPG, Co-op, Multiplayer, Hunting}')
)
WHERE game_id = 5;

-- Insert dummy promotions into the promotions table
INSERT INTO promotions (discount_percent, promotion_description, start_date, end_date)
VALUES
    (8, 'January 2024 Flash Sale', CAST('2024-01-05' AS DATE), CAST('2024-01-09' AS DATE)),
    (20, 'March 2024 Sale', CAST('2024-03-01' AS DATE), CAST('2024-03-31' AS DATE)),
    (15, 'Elden Ring Mid March Sale', CAST('2024-03-14' AS DATE), CAST('2024-03-18' AS DATE)),
    (25, 'Summer 2024 Sale', CAST('2024-06-15' AS DATE), CAST('2024-07-20' AS DATE)),
    (12, 'CAPCOM Anniversary Sale', CAST('2024-05-11' AS DATE), CAST('2024-05-18' AS DATE));

UPDATE games
SET promotion_id = 3
WHERE title = 'Elden Ring';

UPDATE games
SET promotion_id = 2
WHERE title = 'HELLDIVERS 2';

-- CASE: John Doe purchases game_id 2 and 4 while game 2 is on sale
BEGIN;

-- Transaction amount and customer id is known
INSERT INTO transaction_details (customer_id, amount)
VALUES (1, 81.00);

-- Fetch corresponding transaction_id. Game IDs can be passed through the frontend
INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (1, currval('transaction_details_transaction_id_seq'), 2),
       (1, currval('transaction_details_transaction_id_seq'), 4);

COMMIT;

-- Mary Jane buys 3 games, one of which is a free game
BEGIN;

INSERT INTO transaction_details (customer_id, amount)
VALUES (2, 70.00);

INSERT INTO game_purchases(customer_id, transaction_id, game_id)
VALUES (2, currval('transaction_details_transaction_id_seq'), 1),
       (2, currval('transaction_details_transaction_id_seq'), 2),
       (2, currval('transaction_details_transaction_id_seq'), 3);

COMMIT;

-- Clark Kent buys a single game on sale
BEGIN;

INSERT INTO transaction_details (customer_id, amount)
VALUES (3, 32.00);

INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (3, currval('transaction_details_transaction_id_seq'), 5);

COMMIT;