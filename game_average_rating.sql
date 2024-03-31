SELECT g.game_id, g.title, COALESCE(AVG(gr.rating), 0) AS average_rating
FROM games g
LEFT JOIN game_ratings gr ON g.game_id = gr.game_id
GROUP BY g.game_id, g.title
ORDER BY average_rating DESC;
