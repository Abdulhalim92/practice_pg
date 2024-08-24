SELECT * FROM reviews;

UPDATE reviews
SET rating = 2.9
WHERE rating = 5.0;

DELETE FROM reviews
WHERE rating < 3;

-- DELETE работает медленнее TRUNCATE, потому
-- что оставляет логи

UPDATE reviews
SET rating = 3.9
WHERE rating = 2.9
RETURNING book_id, rating;