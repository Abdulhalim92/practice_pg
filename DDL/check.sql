-- check (логическое ограничение)
ALTER TABLE books
ADD COLUMN price DECIMAL
    CONSTRAINT CHK_book_price CHECK (price >= 0);

INSERT INTO authors (name, biography, address)
VALUES
    ('Bahrom', 'student', 'Dushanbe');

INSERT INTO books (title, author_id, price)
VALUES
    ('title', 1, 2);