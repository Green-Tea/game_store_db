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
