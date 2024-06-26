-- Insert dummy data into the customers table without games
INSERT INTO customers (
    first_name,
    last_name,
    display_name,
    email,
    password
)
VALUES (
    'John',
    'Doe',
    'JohnnyDooo',
    'JohnDoe@gmail.com',
    'password'
),
(
    'Mary',
    'Jane',
    'MJ',
    'janemary@gmail.com',
    '12345'
),
(
    'Clark',
    'Kent',
    'Superman',
    'imnotsuperman@gmail.com',
    'batman'
),
(
    'Alice',
    'Johnson',
    'AJ',
    'alice.johnson@example.com',
    'alicepass'
),
(
    'Michael',
    'Smith',
    'MSmith',
    'michael.smith@example.com',
    'smith123'
),
(
    'Emily',
    'Davis',
    'EmDav',
    'emily.davis@example.com',
    'emily456'
),
(
    'William',
    'Brown',
    'WillyB',
    'william.brown@example.com',
    'brownie'
),
(
    'Emma',
    'Wilson',
    'EWilson',
    'emma.wilson@example.com',
    'emma789'
),
(
    'David',
    'Brown',
    'DBrown',
    'david.brown@example.com',
    'david123'
),
(
    'Sophia',
    'Garcia',
    'SophG',
    'sophia.garcia@example.com',
    'sophia456'
);

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
INSERT INTO games (
    title, description, retail_price, publisher_id, developer_name, release_date
)
VALUES (
    'World of Warcraft',
    'World of Warcraft is a massively multiplayer online role-playing game released in 2004 by Blizzard Entertainment.',
    49.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Blizzard'),
    'Blizzard Entertainment', CAST('2004-11-23' AS DATE)
),
(
    'FIFA 22',
    'Powered by Football™, EA SPORTS™ FIFA 22 brings the game even closer to the real thing with fundamental gameplay advances and a new season of innovation across every mode.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Electronic Arts'),
    'EA Sports',
    CAST('2021-10-01' AS DATE)
),
(
    'Dark Souls III',
    'Dark Souls continues to push the boundaries with the latest, ambitious chapter in the critically-acclaimed and genre-defining series. Prepare yourself and Embrace The Darkness!',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'FromSoftware Inc.'),
    'FromSoftware Inc.',
    CAST('2016-04-12' AS DATE)
),
(
    'Elden Ring',
    'THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.',
    69.99,
    (SELECT publisher_id FROM publishers WHERE name = 'FromSoftware Inc.'),
    'FromSoftware Inc.',
    CAST('2022-02-25' AS DATE)
),
(
    'Resident Evil Village',
    'Experience survival horror like never before in the 8th major installment in the Resident Evil franchise - Resident Evil Village. With detailed graphics, intense first-person action and masterful storytelling, the terror has never felt more realistic.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'CAPCOM Co., Ltd'),
    'CAPCOM',
    CAST('2021-05-07' AS DATE)
),
(
    'Horizon Forbidden West', 'An action role-playing game', 69.99,
    (SELECT publisher_id FROM publishers WHERE name = 'PlayStation PC LLC'),
    'Guerrilla Games',
    CAST('2022-02-18' AS DATE)
),
(
    'Far Cry 6',
    'Far Cry 6 is an upcoming first-person shooter game developed by Ubisoft Toronto and published by Ubisoft.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Ubisoft'),
    'Ubisoft Toronto',
    CAST('2020-03-18' AS DATE)
),
(
    'Assassin Creed Valhalla', 'An action role-playing game', 59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Ubisoft'),
    'Ubisoft Montreal',
    CAST('2020-11-10' AS DATE)
),
(
    'Bloodborne',
    'Bloodborne is an action role-playing game developed by FromSoftware and published by Sony Computer Entertainment.',
    19.99,
    (SELECT publisher_id FROM publishers WHERE name = 'FromSoftware Inc.'),
    'FromSoftware Inc.',
    CAST('2015-03-24' AS DATE)
),
(
    'The Legend of Zelda: Breath of the Wild',
    'The Legend of Zelda: Breath of the Wild is an action-adventure game developed and published by Nintendo, released for the Nintendo Switch and Wii U consoles on March 3, 2017.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Nintendo'),
    'Nintendo EPD',
    CAST('2017-03-03' AS DATE)
),
(
    'God of War Ragnarok',
    'God of War Ragnarok is an upcoming action-adventure game developed by Santa Monica Studio and published by Sony Interactive Entertainment.',
    69.99,
    (SELECT publisher_id FROM publishers WHERE name = 'PlayStation PC LLC'),
    'Santa Monica Studio',
    CAST('2018-10-05' AS DATE)
),
(
    'Overwatch',
    'Overwatch is a team-based multiplayer first-person shooter developed and published by Blizzard Entertainment. Described as a "hero shooter", Overwatch assigns players into two teams of six, with each player selecting from a large roster of characters, known as "heroes", with unique abilities.',
    19.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Blizzard'),
    'Blizzard Entertainment',
    CAST('2016-05-24' AS DATE)
),
(
    'Final Fantasy XIV: Endwalker',
    'Final Fantasy XIV: Endwalker is the fourth expansion pack for Final Fantasy XIV, an MMORPG developed and published by Square Enix. It was released on December 7, 2021.',
    39.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Square Enix'),
    'Square Enix',
    CAST('2021-12-07' AS DATE)
),
(
    'Portal 2',
    'Portal 2 is a puzzle-platform game developed and published by Valve Corporation. It was released on April 19, 2011.',
    29.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Valve Corporation'),
    'Valve Corporation',
    CAST('2011-04-19' AS DATE)
),
(
    'The Legend of Zelda: Skyward Sword HD',
    'The Legend of Zelda: Skyward Sword HD is an action-adventure game developed and published by Nintendo for the Nintendo Switch. It was released on July 16, 2021.',
    49.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Nintendo'),
    'Nintendo EPD',
    CAST('2021-07-16' AS DATE)
),
(
    'StarCraft II: Wings of Liberty',
    'StarCraft II: Wings of Liberty is a military science fiction real-time strategy game developed and published by Blizzard Entertainment. It was released on July 27, 2010.',
    29.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Blizzard'),
    'Blizzard Entertainment',
    CAST('2010-07-27' AS DATE)
),
(
    'Need for Speed: Heat',
    'Need for Speed: Heat is a racing video game developed by Ghost Games and published by Electronic Arts. It was released on November 8, 2019.',
    49.99,
    (SELECT publisher_id FROM publishers WHERE name = 'Electronic Arts'),
    'Ghost Games',
    CAST('2019-11-08' AS DATE)
),
(
    'Sekiro: Shadows Die Twice',
    'Sekiro: Shadows Die Twice is an action-adventure game developed by FromSoftware and published by Activision. It was released on March 22, 2019.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'FromSoftware Inc.'),
    'FromSoftware Inc.',
    CAST('2019-03-22' AS DATE)
),
(
    'Resident Evil 3',
    'Resident Evil 3 is a survival horror game developed and published by CAPCOM Co., Ltd. It was released on April 3, 2020.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'CAPCOM Co., Ltd'),
    'CAPCOM',
    CAST('2020-04-03' AS DATE)
),
(
    'The Last of Us Part II',
    'The Last of Us Part II is an action-adventure game developed by Naughty Dog and published by PlayStation PC LLC. It was released on June 19, 2020.',
    59.99,
    (SELECT publisher_id FROM publishers WHERE name = 'PlayStation PC LLC'),
    'Naughty Dog',
    CAST('2020-06-19' AS DATE)
);

-- Insert dummy data into customer_payment_info table
INSERT INTO customer_payment_info (
    customer_id,
    cardholder_name,
    card_number,
    cvv,
    expiration_date,
    billing_address,
    card_issuer
)
VALUES (
    1, 'John Doe', 5555555555554444, 123, CAST('2028-04-11' AS DATE),
    '308 Negra Arroyo Lane, Albuquerque, New Mexico', 'MasterCard'
),
(
    2,
    'Mary Jane',
    4111111111111111,
    123,
    CAST('2025-10-21' AS DATE),
    'Example Address',
    'Visa'
),
(
    3,
    'Clark Kent',
    378282246310005,
    123,
    CAST('2027-08-15' AS DATE),
    'Daily Planet Building, Metropolis',
    'American Express'
),
(
    4,
    'Alice Johnson',
    6011111111111117,
    123,
    CAST('2026-05-30' AS DATE),
    '123 Main Street, Anytown, USA',
    'Discover'
),
(
    5,
    'Michael Smith',
    3530111333300000,
    123,
    CAST('2024-12-31' AS DATE),
    '456 Elm Street, Springfield',
    'JCB'
),
(
    6,
    'Emily Davis',
    5105105105105100,
    123,
    CAST('2025-09-25' AS DATE),
    '789 Maple Avenue, Cityville',
    'MasterCard'
),
(
    7,
    'William Brown',
    6759649826438453,
    123,
    CAST('2026-11-15' AS DATE),
    '321 Oak Street, Smalltown',
    'Visa'
),
(
    8,
    'Emma Wilson',
    4903347295834116,
    123,
    CAST('2025-08-30' AS DATE),
    '567 Pine Street, Villageland',
    'MasterCard'
),
(
    9,
    'David Brown',
    4485255488543783,
    123,
    CAST('2026-03-22' AS DATE),
    '789 Elm Street, Springfield',
    'Visa'
),
(
    10,
    'Sophia Garcia',
    6011000990139424,
    123,
    CAST('2025-07-18' AS DATE),
    '456 Maple Avenue, Cityville',
    'Discover'
);

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
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{FPS, Battle Royale, Multiplayer, Free}')
    )
WHERE game_id = 1;

UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Open World, RPG, Dark, Fantasy, Souls-like}')
    )
WHERE game_id = 2;

UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Co-op, Multiplayer, Third Person, PVE}')
    )
WHERE game_id = 3;

UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE
            genre_name = ANY('{Co-op, Multiplayer, Action, Open World, RPG, Hunting}')
    )
WHERE game_id = 4;

UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Action, RPG, Co-op, Multiplayer, Hunting}')
    )
WHERE game_id = 5;

UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Adventure, Action, RPG, Fighting Game, Shooter, Platform}')
    )
WHERE game_id = 6;

UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{FPS, Shooter, Adventure}')
    )
WHERE game_id = 7;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{RPG, Action, Adventure, Fighting Game, Shooter}')
    )
WHERE game_id = 8;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Action, RPG, Fighting Game, Adventure, Survival, Horror}')
    )
WHERE game_id = 9;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Puzzle, Action, Adventure}')
    )
WHERE game_id = 10
;UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Action, Adventure, RPG, Shooter}')
    )
WHERE game_id = 11;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{FPS, Shooter, Fighting Game}')
    )
WHERE game_id = 12;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{MMORPG, RPG, Adventure}')
    )
WHERE game_id = 13;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Puzzle, FPS, Action, Adventure}')
    )
WHERE game_id = 14;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Puzzle, Action, Adventure, Fighting Game}')
    )
WHERE game_id = 15;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{RTS, Adventure}')
    )
WHERE game_id = 16;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Racing, Adventure}')
    )
WHERE game_id = 17;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Action, Adventure, RPG}')
    )
WHERE game_id = 18;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Survival, Horror, Adventure, Third Person, Shooter}')
    )
WHERE game_id = 19;
UPDATE games
SET
    genre_ids = ARRAY(
        SELECT genre_id
        FROM game_genres
        WHERE genre_name = ANY('{Adventure, Action, Survival, Horror, Shooter}')
    )
WHERE game_id = 20;

-- Insert dummy promotions into the promotions table
INSERT INTO promotions (
    discount_percent, promotion_description, start_date, end_date
)
VALUES (
    8,
    'January 2024 Flash Sale',
    CAST('2024-01-05' AS DATE),
    CAST('2024-01-09' AS DATE)
),
(
    20,
    'March 2024 Sale',
    CAST('2024-03-01' AS DATE),
    CAST('2024-03-31' AS DATE)
),
(
    15,
    'Elden Ring Mid March Sale',
    CAST('2024-03-14' AS DATE),
    CAST('2024-03-18' AS DATE)
),
(
    25,
    'Summer 2024 Sale',
    CAST('2024-06-15' AS DATE),
    CAST('2024-07-20' AS DATE)
),
(
    12,
    'CAPCOM Anniversary Sale',
    CAST('2024-05-11' AS DATE),
    CAST('2024-05-18' AS DATE)
),
(
    10,
    'Spring 2024 Sale',
    CAST('2024-04-01' AS DATE),
    CAST('2024-04-30' AS DATE)
),
(
    18,
    'May Madness Sale',
    CAST('2024-05-01' AS DATE),
    CAST('2024-05-15' AS DATE)
),
(
    30,
    'End of Year Clearance',
    CAST('2024-12-01' AS DATE),
    CAST('2024-12-31' AS DATE)
),
(
    15,
    'Holiday Special',
    CAST('2024-11-20' AS DATE),
    CAST('2024-12-25' AS DATE)
),
(
    22,
    'Black Friday Sale',
    CAST('2024-11-29' AS DATE),
    CAST('2024-11-30' AS DATE)
);

-- Append promotions to games
-- @kid please append relevant promotions to some of the games
UPDATE games -- March 2024
SET
    promotion_id = 2
WHERE
    game_id = 5;

UPDATE games -- ELDEN Ring Mid March
SET
    promotion_id = 3
WHERE
    game_id = 4;

UPDATE games -- Jan Flash Sale
SET
    promotion_id = 1
WHERE
    game_id IN (9, 10);

UPDATE games -- Summer 2024
SET
    promotion_id = 4
WHERE
    game_id IN (2, 17, 20);
    
UPDATE games -- CapCom Aniversary
SET
    promotion_id = 5
WHERE
    game_id = 19;

UPDATE games -- Spring 2024
SET
    promotion_id = 6
WHERE
    game_id = 1;
UPDATE games -- May Madness
SET
    promotion_id = 7
WHERE
    game_id = 14;

UPDATE games -- End of Year
SET
    promotion_id = 8
WHERE
    game_id = 11;

UPDATE games -- Holiday Special
SET
    promotion_id = 9
WHERE
    game_id IN (12, 13);

UPDATE games -- Black Friday
SET
    promotion_id = 10
WHERE
    game_id IN (6, 7, 18);

-- Create wishlist for customers
-- first two are examples of how wishlists would be added in production
-- REMEMBER ADDING A WISHLIST MUST MODIFY TWO TABLES
UPDATE customers
SET
    wishlisted_game_id = wishlisted_game_id || 4
WHERE
    customer_id = 1;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = 4;

UPDATE customers
SET
    wishlisted_game_id = wishlisted_game_id || 6
WHERE
    customer_id = 1;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = 6;

-- to save our time we can continue adding wishlists like this
UPDATE customers
SET
    wishlisted_game_id = ARRAY[1,2,3]
WHERE
    customer_id = 2;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[1, 2, 3]);

UPDATE customers -- customer 3
SET
    wishlisted_game_id = ARRAY[6,11,14]
WHERE
    customer_id = 3;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[6, 14, 11]);


UPDATE customers -- customer 4
SET
    wishlisted_game_id = ARRAY[20]
WHERE
    customer_id = 4;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[20]);


UPDATE customers -- customer 5
SET
    wishlisted_game_id = ARRAY[7,8]
WHERE
    customer_id = 5;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[7,8]);


UPDATE customers -- customer 6
SET
    wishlisted_game_id = ARRAY[2, 19]
WHERE
    customer_id = 6;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[2,19]);


UPDATE customers -- customer 7
SET
    wishlisted_game_id = ARRAY[5, 13, 16, 17, 19]
WHERE
    customer_id = 7;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[5, 13, 16, 17, 19]);


UPDATE customers -- customer 9
SET
    wishlisted_game_id = ARRAY[15,18,20]
WHERE
    customer_id = 9;

UPDATE games
SET
    wishlists = wishlists + 1
WHERE
    game_id = ANY(ARRAY[15, 18, 20]);

INSERT INTO game_ratings (game_id, customer_id, rating, comment) VALUES (1,1,5, 'I love this game!');
INSERT INTO game_ratings (game_id, customer_id, rating, comment)
VALUES (1, 2, 1, 'Too laggy'),
       (1, 3, 4, 'Fun game.'),
       (7, 1, 3, 'Good graphics but a bit boring'),
       (2, 2, 2, 'Meh');
