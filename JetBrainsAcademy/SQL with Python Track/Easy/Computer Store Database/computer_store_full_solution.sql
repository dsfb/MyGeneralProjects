-- stage 1 completed
SELECT model,
    type,
    price
    FROM Printer
        WHERE price > 200;
        
-- stage 2 completed
SELECT p.maker, p.model, l.hd, l.speed, l.price
    FROM Product AS p
    INNER JOIN Laptop AS l
        ON p.model = l.model
        WHERE l.hd >= 1000
        ORDER BY l.hd ASC, l.speed DESC, l.price ASC;

-- stage 3 completed
SELECT COUNT(p1.maker) as number_of_unique_makers
    FROM Product AS p1
    WHERE (SELECT COUNT(p2.model) FROM Product AS p2
		WHERE p2.maker = p1.maker) = 1;

-- stage 4 completed
WITH all_prices AS (
    SELECT a.maker, a.model, b.speed, b.price
        FROM Product a INNER JOIN PC b
        ON a.model = b.model
    
    UNION

    SELECT a.maker, a.model, b.speed, b.price
        FROM Product a INNER JOIN Laptop b
        ON a.model = b.model
),
lowest_prices AS (
    SELECT r.maker AS maker, r.model AS model, r.speed AS speed, r.price AS price
        FROM all_prices r HAVING speed = ( SELECT MIN(speed) FROM all_prices )
)
SELECT * FROM lowest_prices;
