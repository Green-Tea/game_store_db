DROP TABLE IF EXISTS promotions CASCADE;
DROP TABLE IF EXISTS publishers CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS customer_wishlist CASCADE;
DROP TABLE IF EXISTS transaction_details CASCADE;
DROP TABLE IF EXISTS game_purchases CASCADE;
DROP TABLE IF EXISTS game_ratings CASCADE;
DROP TABLE IF EXISTS customer_payment_info CASCADE;
DROP TABLE IF EXISTS game_genres CASCADE;
DROP TABLE IF EXISTS game_genres_junction CASCADE;

CREATE TABLE promotions
(
    promotion_id          SERIAL PRIMARY KEY,
    discount_percent      INT  NOT NULL,
    promotion_description VARCHAR(255),
    start_date            DATE NOT NULL,
    end_date              DATE NOT NULL,
    duration_days         INT GENERATED ALWAYS AS (end_date - start_date + 1) STORED
);

-- If a publisher is removed, all games associated with the publisher should be removed too
CREATE TABLE publishers
(
    publisher_id  SERIAL PRIMARY KEY,
    name          VARCHAR(255) UNIQUE NOT NULL,
    email         VARCHAR(255) UNIQUE NOT NULL,
    address       VARCHAR(255) NOT NULL,
    revenue_split INT                 NOT NULL
);

CREATE TABLE game_genres
(
    genre_id   SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE games
(
    game_id        SERIAL PRIMARY KEY UNIQUE,
    title          VARCHAR(255)   NOT NULL UNIQUE,
    description    TEXT,
    retail_price   DECIMAL(10, 2) NOT NULL,
    modified_price DECIMAL(10, 2) DEFAULT NULL,
    promotion_id   INT            DEFAULT NULL,
    publisher_id   INT            NOT NULL,
    developer_name VARCHAR(255)   NOT NULL, -- We only need to store the name for documentation purposes. We have no actual contact with developers
    release_date   DATE,
    genre_ids      INT[]          DEFAULT ARRAY []::INT[],
    wishlists      INT            DEFAULT 0,

    CONSTRAINT games_promotion_fk FOREIGN KEY (promotion_id) REFERENCES promotions (promotion_id),
    CONSTRAINT games_publisher_fk FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
);

CREATE TABLE game_genres_junction
(
    game_id  INT NOT NULL,
    genre_id INT NOT NULL,

    CONSTRAINT game_genre_pk PRIMARY KEY (game_id, genre_id),
    CONSTRAINT fk_game FOREIGN KEY (game_id) REFERENCES games (game_id) ON DELETE CASCADE,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES game_genres (genre_id) ON DELETE CASCADE
);

CREATE TABLE customers
(
    customer_id    SERIAL PRIMARY KEY,
    first_name     VARCHAR(255) NOT NULL,
    last_name      VARCHAR(255) NOT NULL,
    display_name   VARCHAR(20),
    email          VARCHAR(255) NOT NULL,
    password       VARCHAR(64)  NOT NULL,
    owned_game_ids INT[] DEFAULT ARRAY []::INT[] NULL,
    wishlisted_game_id INT[] DEFAULT ARRAY[]::INT[] NULL
);

CREATE TABLE customer_payment_info
(
    customer_id     INT          NOT NULL UNIQUE,
    cardholder_name VARCHAR(255) NOT NULL,
    card_number     VARCHAR(19)  NOT NULL,
    cvv             VARCHAR(4)   NOT NULL,
    expiration_date DATE         NOT NULL,
    billing_address VARCHAR(255) NOT NULL,
    card_issuer     VARCHAR(255) NOT NULL,

    CONSTRAINT customer_payment_info_fk FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE transaction_details
(
    transaction_id       SERIAL PRIMARY KEY,
    customer_id          INT       NOT NULL,
    amount               money     NOT NULL,
    transaction_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT transaction_details_customer_fk FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

/*
CASE: User purchases 2+ games in one transaction

METHOD: Input as separate purchase_id and game_id but keep transaction_id and purchase_datetime the same
*/
CREATE TABLE game_purchases
(
    purchase_id       SERIAL PRIMARY KEY,
    customer_id       INT       NOT NULL,
    transaction_id    INT       NOT NULL,
    game_id           INT       NOT NULL,
    purchase_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT unique_purchase_combination UNIQUE (transaction_id, game_id),
    CONSTRAINT game_purchases_fk FOREIGN KEY (transaction_id) REFERENCES transaction_details (transaction_id),
    CONSTRAINT game_purchase_game_fk FOREIGN KEY (game_id) REFERENCES games (game_id),
    CONSTRAINT game_purchases_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE game_ratings
(
    rating_id   SERIAL PRIMARY KEY,
    game_id     INT NOT NULL,
    customer_id INT NOT NULL,
    rating      INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment     TEXT,

    CONSTRAINT ratings_game_id_fk FOREIGN KEY (game_id) REFERENCES games (game_id),
    CONSTRAINT ratings_customer_fk FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);