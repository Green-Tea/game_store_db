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



COMMIT;

-- Clark Kent buys a single game on sale
BEGIN;



COMMIT;
