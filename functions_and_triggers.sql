-- Update modified price attribute upon adding or removal of a promotion
CREATE OR REPLACE FUNCTION update_modified_price()
    RETURNS TRIGGER AS
$$
DECLARE
    game_retail_price   DECIMAL(10, 2);
    discount_multiplier DECIMAL(10, 2);
BEGIN
    SELECT retail_price INTO game_retail_price FROM games WHERE game_id = NEW.game_id;

    discount_multiplier :=
            1 - (SELECT discount_percent FROM promotions WHERE promotion_id = NEW.promotion_id)::DECIMAL / 100;

    IF NEW.promotion_id IS NOT NULL THEN
        NEW.modified_price = game_retail_price * discount_multiplier;
    ELSE
        NEW.modified_price = NULL;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER games_update_modified_price
    BEFORE INSERT OR UPDATE OF promotion_id
    ON games
    FOR EACH ROW
EXECUTE FUNCTION update_modified_price();

-- Automatically update game_genres_junction when appending genres to a game
CREATE OR REPLACE FUNCTION update_game_genres_junction()
    RETURNS TRIGGER AS
$$
BEGIN
    IF TG_TABLE_NAME = 'games' AND TG_OP = 'UPDATE' AND NEW.genre_ids <> OLD.genre_ids THEN
        DELETE FROM game_genres_junction WHERE game_id = NEW.game_id;

        INSERT INTO game_genres_junction (game_id, genre_id)
        SELECT NEW.game_id, genre_id
        FROM game_genres
        WHERE genre_id = ANY (NEW.genre_ids);
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_game_genres_trigger
    AFTER UPDATE OF genre_ids
    ON games
    FOR EACH ROW
EXECUTE FUNCTION update_game_genres_junction();

-- Increment/decrement wishlist count on games when customer adds/removes a game from their wishlist
CREATE OR REPLACE FUNCTION wishlist_update_trigger()
RETURNS TRIGGER AS
$$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        -- Check if the wishlist_game_ids array has changed
        IF OLD.wishlist_game_ids IS DISTINCT FROM NEW.wishlist_game_ids THEN
            -- Get the added game ID (if any)
            DECLARE
                added_game_id INT;
                removed_game_id INT;
            BEGIN
                added_game_id := (
                    SELECT game_id
                    FROM unnest(NEW.wishlist_game_ids) game_id
                    WHERE game_id NOT IN (SELECT game_id FROM unnest(OLD.wishlist_game_ids))
                    LIMIT 1
                );

                removed_game_id := (
                    SELECT game_id
                    FROM unnest(OLD.wishlist_game_ids) game_id
                    WHERE game_id NOT IN (SELECT game_id FROM unnest(NEW.wishlist_game_ids))
                    LIMIT 1
                );

                -- Increment wishlist count for added game
                IF added_game_id IS NOT NULL THEN
                    UPDATE games
                    SET wishlists = wishlists + 1
                    WHERE game_id = added_game_id;
                END IF;

                -- Decrement wishlist count for removed game
                IF removed_game_id IS NOT NULL THEN
                    UPDATE games
                    SET wishlists = wishlists - 1
                    WHERE game_id = removed_game_id;
                END IF;
            END;
        END IF;
    END IF;
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS after_wishlist_update ON customers;

CREATE TRIGGER after_wishlist_update
AFTER UPDATE OF wishlist_game_ids ON customers
FOR EACH ROW
EXECUTE FUNCTION wishlist_update_trigger();
