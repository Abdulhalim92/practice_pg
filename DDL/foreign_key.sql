DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS books CASCADE;

CREATE TABLE authors (
    author_id SERIAL,
    name VARCHAR(100),
    biography TEXT,
    address TEXT,

    CONSTRAINT PK_authors_author_id PRIMARY KEY (author_id)
);

CREATE TABLE books
(
    book_id SERIAL,
    title TEXT NOT NULL,
    author_id INT,

    CONSTRAINT PK_book_book_id PRIMARY KEY (book_id),
    CONSTRAINT FK_books_authors FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

ALTER TABLE  books
ADD CONSTRAINT FK_books_authors FOREIGN KEY (author_id) REFERENCES authors(author_id);