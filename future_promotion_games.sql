SELECT game_id, title, wishlists FROM games WHERE wishlists > 10 ORDER BY wishlists DESC;

SELECT * FROM promotions WHERE start_date > CURRENT_DATE;
