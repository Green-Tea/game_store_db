-- Updating promotions
UPDATE games
SET promotion_id = 3
WHERE title = 'Elden Ring';

UPDATE games
SET promotion_id = 2
WHERE title = 'Resident Evil Village';

UPDATE games
SET promotion_id = 4
WHERE game_id = 3;

-- CASE: John Doe purchases World of Warcraft and Assassin Creed Valhalla
BEGIN;

-- Transaction amount and customer id is known
INSERT INTO transaction_details (customer_id, amount)
VALUES (1, 109.98);

-- Fetch corresponding transaction_id. Game IDs can be passed through the frontend
INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (
    1,
    CURRVAL('transaction_details_transaction_id_seq'),
    (SELECT game_id FROM games WHERE title = 'World of Warcraft')
),
(
    1,
    CURRVAL('transaction_details_transaction_id_seq'),
    (SELECT game_id FROM games WHERE title = 'Assassin Creed Valhalla')
);

-- Update customer's owned_game_ids after purchase
UPDATE customers
SET owned_game_ids = owned_game_ids || (
    SELECT ARRAY_AGG(game_id)
    FROM game_purchases
    WHERE customer_id = 1
);

COMMIT;

-- Mary Jane buys 3 games, one of which is a free game
BEGIN;

INSERT INTO transaction_details (customer_id, amount)
VALUES (2, 70.00);

INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (2, CURRVAL('transaction_details_transaction_id_seq'), 1),
(2, CURRVAL('transaction_details_transaction_id_seq'), 2),
(2, CURRVAL('transaction_details_transaction_id_seq'), 3);

COMMIT;

-- Clark Kent buys a single game on sale
BEGIN;

INSERT INTO transaction_details (customer_id, amount)
VALUES (3, 32.00);

INSERT INTO game_purchases (customer_id, transaction_id, game_id)
VALUES (3, CURRVAL('transaction_details_transaction_id_seq'), 5);

COMMIT;
