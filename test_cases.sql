-- CASE: John Doe purchases World of Warcraft and Assassin Creed Valhalla
BEGIN;

-- Transaction amount = sum the prices of all games bought (keep promotions in mind, you will have to reference the games table for the modified price)
INSERT INTO transaction_details (customer_id, amount)
VALUES (1, 109.98);

-- Fetch corresponding transaction_id. Game IDs can be passed through the frontend
INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (
    1,
    CURRVAL('transaction_details_transaction_id_seq'),
    1
),
(
    1,
    CURRVAL('transaction_details_transaction_id_seq'),
    8
);

-- Update customer's owned_game_ids after purchase
UPDATE customers
SET owned_game_ids = owned_game_ids || ARRAY[1, 8]
WHERE customer_id = 1;

COMMIT;

-- Mary Jane buys 3 games, one of which is on sale
BEGIN;

-- Transaction amount = sum the prices of all games bought (keep promotions in mind, you will have to reference the games table for the modified price)
INSERT INTO transaction_details (customer_id, amount)
VALUES (2, 128.37);

-- Fetch corresponding transaction_id. Game IDs can be passed through the frontend
INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (
    2,
    CURRVAL('transaction_details_transaction_id_seq'),
    8
),
(
    2,
    CURRVAL('transaction_details_transaction_id_seq'),
    9
),
(
    2,
    CURRVAL('transaction_details_transaction_id_seq'),
    15
);

-- Update customer's owned_game_ids after purchase
UPDATE customers
SET owned_game_ids = owned_game_ids || ARRAY[8, 9, 15]
WHERE customer_id = 2;


COMMIT;

-- Clark Kent buys a single game on sale
BEGIN;

-- Transaction amount = sum the prices of all games bought (keep promotions in mind, you will have to reference the games table for the modified price)
INSERT INTO transaction_details (customer_id, amount)
VALUES (3, 59.49);

-- Fetch corresponding transaction_id. Game IDs can be passed through the frontend
INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (
    3,
    CURRVAL('transaction_details_transaction_id_seq'),
    4
);

-- Update customer's owned_game_ids after purchase
UPDATE customers
SET owned_game_ids = owned_game_ids || ARRAY[4]
WHERE customer_id = 3;


COMMIT;
