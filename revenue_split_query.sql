-- Create a view to track monthly amounts owed to publishers
CREATE VIEW monthly_publisher_owed AS
SELECT
    p.name AS publisher_name,
    p.address AS publisher_address,
    CAST(SUM((g.retail_price * p.revenue_split / 100)) AS money) AS amount_owed
FROM
    game_purchases gp
JOIN
    games g ON gp.game_id = g.game_id
JOIN
    publishers p ON g.publisher_id = p.publisher_id
WHERE
    DATE_PART('month', gp.purchase_datetime) = DATE_PART('month', CURRENT_DATE)
    AND DATE_PART('year', gp.purchase_datetime) = DATE_PART('year', CURRENT_DATE)
GROUP BY
    p.name, p.address;

SELECT * FROM monthly_publisher_owed;
