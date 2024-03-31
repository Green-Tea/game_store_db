SELECT game_id FROM game_genres_junction WHERE genre_id = 5;

-- SELECT gjj.game_id, g.title
-- FROM game_genres_junction gjj
-- JOIN games g ON gjj.game_id = g.game_id
-- WHERE gjj.genre_id = 5;
