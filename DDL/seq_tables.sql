DROP TABLE IF EXISTS books;

CREATE TABLE books
(
--     book_id INT NOT NULL,
--     book_id SERIAL,
    book_id INT GENERATED ALWAYS AS IDENTITY (START WITH 10 INCREMENT BY 2) NOT NULL, -- BY DEFAULT
    title TEXT NOT NULL,
    author_id INT,

    CONSTRAINT PK_book_book_id PRIMARY KEY (book_id),
    CONSTRAINT FK_books_authors FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

SELECT * FROM books;

CREATE SEQUENCE IF NOT EXISTS books_book_id_seq
START WITH 1 OWNED BY books.book_id;

INSERT INTO books (title, author_id)
VALUES
    ('War and Peace', 1),
    ('Anna Karenina', 1);

INSERT INTO books (book_id, title, author_id)
VALUES
    (3, 'War and Peace', 1),
    (4, 'Anna Karenina', 1);

INSERT INTO books (book_id, title, author_id)
OVERRIDING SYSTEM VALUE
VALUES
    (3, 'War and Peace', 1),
    (4, 'Anna Karenina', 1);

ALTER TABLE books
ALTER COLUMN book_id SET DEFAULT nextval('books_book_id_seq');