-- Insert dummy data into the publishers table
INSERT INTO publishers (name, email, address, revenue_split)
VALUES ('Blizzard', 'blizzard@example.com', 'USA', 70),
       ('Electronic Arts', 'ea@example.com', 'USA', 65),
       ('FromSoftware Inc.', 'fromsoft@example.com', 'Tokyo, Japan', 40),
       ('CAPCOM Co., Ltd', 'capcom@example.com', 'Osaka, Japan', 40),
       ('PlayStation PC LLC', 'playstation@example.com', 'USA', 30),
       ('Ubisoft', 'ubisoft@example.com', 'USA', 60),
       ('Square Enix', 'squareenix@example.com', 'USA', 50),
       ('Nintendo', 'nintendo@example.com', 'USA', 55),
       ('Bethesda Softworks', 'bethesda@example.com', 'USA', 45),
       ('Valve Corporation', 'valve@example.com', 'USA', 60);

-- Insert dummy data into the games table
-- DO NOT DEFINE GENRES YET, A TRIGGER IS SET TO AUTOMATICALLY UPDATE game_genres_junction UPON SETTING GENRES
INSERT INTO games (title, description, retail_price, publisher_id, developer_name, release_date)
VALUES ('Apex Legends',
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
        CAST('2022-01-13' AS DATE)),
       ('Cyberpunk 2077',
        'Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis obsessed with power, glamour, and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality.',
        50.00,
        6,
        'CD Projekt Red',
        CAST('2020-12-10' AS DATE)),
       ('The Witcher 3: Wild Hunt',
        'The Witcher 3: Wild Hunt is a story-driven, open-world RPG set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher, you play as Geralt of Rivia, a monster hunter tasked with finding a child of prophecy.',
        40.00,
        6,
        'CD Projekt Red',
        CAST('2015-05-19' AS DATE)),
       ('Final Fantasy VII Remake',
        'Final Fantasy VII Remake is a reimagining of the iconic original game that redefined the RPG genre. Experience the unforgettable characters and epic battles of the first game, now with stunning visuals, a revamped combat system, and expanded storylines.',
        60.00,
        7,
        'Square Enix',
        CAST('2020-04-10' AS DATE)),
       ('The Legend of Zelda: Breath of the Wild',
        'The Legend of Zelda: Breath of the Wild is an action-adventure game set in a vast open world. Embark on a journey to discover the secrets of Hyrule while battling enemies, solving puzzles, and exploring breathtaking landscapes.',
        60.00,
        8,
        'Nintendo',
        CAST('2017-03-03' AS DATE)),
       ('Red Dead Redemption 2',
        'Red Dead Redemption 2 is an epic tale of life in America at the dawn of the modern age. Play as Arthur Morgan, a member of the Van der Linde gang, as you explore the vast and unforgiving wilderness of the American West.',
        60.00,
        9,
        'Rockstar Games',
        CAST('2018-10-26' AS DATE));

-- Insert dummy data into the customers table
INSERT INTO customers (first_name, last_name, display_name, email, password)
VALUES ('John', 'Doe', 'JohnnyDooo', 'JohnDoe@gmail.com', 'password'),
       ('Mary', 'Jane', 'MJ', 'janemary@gmail.com', '12345'),
       ('Clark', 'Kent', 'Superman', 'imnotsuperman@gmail.com', 'batman'),
       ('Alice', 'Johnson', 'AJ', 'alice.johnson@example.com', 'alicepass'),
       ('Michael', 'Smith', 'MSmith', 'michael.smith@example.com', 'smith123'),
       ('Emily', 'Davis', 'EmDav', 'emily.davis@example.com', 'emily456'),
       ('William', 'Brown', 'WillyB', 'william.brown@example.com', 'brownie'),
       ('Emma', 'Wilson', 'EWilson', 'emma.wilson@example.com', 'emma789'),
       ('David', 'Brown', 'DBrown', 'david.brown@example.com', 'david123'),
       ('Sophia', 'Garcia', 'SophG', 'sophia.garcia@example.com', 'sophia456');

-- Insert dummy data into customer_payment_info table
INSERT INTO customer_payment_info (customer_id, cardholder_name, card_number, cvv, expiration_date, billing_address,
                                   card_issuer)
VALUES (1, 'John Doe', 5555555555554444, 123, CAST('2028-04-11' AS DATE),
        '308 Negra Arroyo Lane, Albuquerque, New Mexico', 'MasterCard'),
       (2, 'Mary Jane', 4111111111111111, 123, CAST('2025-10-21' AS DATE), 'Example Address', 'Visa'),
       (3, 'Clark Kent', 378282246310005, 123, CAST('2027-08-15' AS DATE), 'Daily Planet Building, Metropolis',
        'American Express'),
       (4, 'Alice Johnson', 6011111111111117, 123, CAST('2026-05-30' AS DATE), '123 Main Street, Anytown, USA',
        'Discover'),
       (5, 'Michael Smith', 3530111333300000, 123, CAST('2024-12-31' AS DATE), '456 Elm Street, Springfield', 'JCB'),
       (6, 'Emily Davis', 5105105105105100, 123, CAST('2025-09-25' AS DATE), '789 Maple Avenue, Cityville',
        'MasterCard'),
       (7, 'William Brown', 6759649826438453, 123, CAST('2026-11-15' AS DATE), '321 Oak Street, Smalltown', 'Visa'),
       (8, 'Emma Wilson', 4903347295834116, 123, CAST('2025-08-30' AS DATE), '567 Pine Street, Villageland',
        'MasterCard'),
       (9, 'David Brown', 4485255488543783, 123, CAST('2026-03-22' AS DATE), '789 Elm Street, Springfield', 'Visa'),
       (10, 'Sophia Garcia', 6011000990139424, 123, CAST('2025-07-18' AS DATE), '456 Maple Avenue, Cityville',
        'Discover');

-- Pre-define available game genres
INSERT INTO game_genres (genre_name)
VALUES ('Action'),
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
        SELECT genre_id FROM game_genres WHERE genre_name = ANY ('{FPS, Battle Royale, Multiplayer, Free}')
                )
WHERE game_id = 1;

UPDATE games
SET genre_ids = ARRAY(
        SELECT genre_id FROM game_genres WHERE genre_name = ANY ('{Open World, RPG, Dark, Fantasy, Souls-like}')
                )
WHERE game_id = 2;

UPDATE games
SET genre_ids = ARRAY(
        SELECT genre_id FROM game_genres WHERE genre_name = ANY ('{Co-op, Multiplayer, Third Person, PVE}')
                )
WHERE game_id = 3;

UPDATE games
SET genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY ('{Co-op, Multiplayer, Action, Open World, RPG, Hunting}')
                )
WHERE game_id = 4;

UPDATE games
SET genre_ids = ARRAY(
        SELECT genre_id FROM game_genres WHERE genre_name = ANY ('{Action, RPG, Co-op, Multiplayer, Hunting}')
                )
WHERE game_id = 5;

-- Insert dummy promotions into the promotions table
INSERT INTO promotions (discount_percent, promotion_description, start_date, end_date)
VALUES (8, 'January 2024 Flash Sale', CAST('2024-01-05' AS DATE), CAST('2024-01-09' AS DATE)),
       (20, 'March 2024 Sale', CAST('2024-03-01' AS DATE), CAST('2024-03-31' AS DATE)),
       (15, 'Elden Ring Mid March Sale', CAST('2024-03-14' AS DATE), CAST('2024-03-18' AS DATE)),
       (25, 'Summer 2024 Sale', CAST('2024-06-15' AS DATE), CAST('2024-07-20' AS DATE)),
       (12, 'CAPCOM Anniversary Sale', CAST('2024-05-11' AS DATE), CAST('2024-05-18' AS DATE)),
       (10, 'Spring 2024 Sale', CAST('2024-04-01' AS DATE), CAST('2024-04-30' AS DATE)),
       (18, 'May Madness Sale', CAST('2024-05-01' AS DATE), CAST('2024-05-15' AS DATE)),
       (30, 'End of Year Clearance', CAST('2024-12-01' AS DATE), CAST('2024-12-31' AS DATE)),
       (15, 'Holiday Special', CAST('2024-11-20' AS DATE), CAST('2024-12-25' AS DATE)),
       (22, 'Black Friday Sale', CAST('2024-11-29' AS DATE), CAST('2024-11-30' AS DATE));

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