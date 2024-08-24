-- 1. Создать таблицу exam с полями:

-- идентификатора экзамена - автоинкрементируемый, уникальный, запрещает NULL;
-- наименования экзамена
-- даты экзамена

CREATE TABLE exam
(
    exam_id SERIAL UNIQUE NOT NULL,
    name VARCHAR,
    date DATE
);

DROP TABLE exam;

-- 2. Удалить ограничение уникальности с поля идентификатора

ALTER TABLE exam
DROP CONSTRAINT IF EXISTS exam_exam_id_key;

-- 3. Добавить ограничение первичного ключа на поле идентификатора

ALTER TABLE exam
ADD CONSTRAINT  PK_exam_exam_id PRIMARY KEY (exam_id);

-- 4. Создать таблицу person с полями

-- идентификатора личности (простой int, первичный ключ)
-- имя
-- фамилия

CREATE TABLE person
(
    person_id INT PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);

ALTER TABLE person
ALTER COLUMN first_name SET DATA TYPE VARCHAR (20);

ALTER TABLE person
ALTER COLUMN last_name SET DATA TYPE VARCHAR (20);

-- 5. Создать таблицу паспорта с полями:

-- идентификатора паспорта (простой int, первичный ключ)
-- серийный номер (простой int, запрещает NULL)
-- регистрация
-- ссылка на идентификатор личности (внешний ключ)

CREATE TABLE passport
(
    passport_id INT PRIMARY KEY,
    serial_num INT NOT NULL,
    registry VARCHAR (100),
    person_id INT,

    CONSTRAINT FK_passport_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);

-- 6. Добавить колонку веса в таблицу book (создавали ранее) с ограничением,
-- проверяющим вес (больше 0 но меньше 100)
ALTER TABLE  books
ADD COLUMN height float
    CONSTRAINT CHK_book_height CHECK ( height > 0 AND height < 100);

ALTER TABLE books
    DROP COLUMN height;

ALTER TABLE books
DROP CONSTRAINT CHK_book_height;

-- 7. Убедиться в том, что ограничение на вес работает (попробуйте вставить
-- невалидное значение)

-- 8. Создать таблицу student с полями:

-- идентификатора (автоинкремент)
-- полное имя
-- курс (по умолчанию 1)

-- 9. Вставить запись в таблицу студентов и убедиться, что ограничение на вставку
-- значения по умолчанию работает

-- 10. Удалить ограничение "по умолчанию" из таблицы студентов

-- 11. Подключиться к БД northwind и добавить ограничение на поле unit_price т
-- аблицы products (цена должна быть больше 0)

-- 12. "Навесить" автоинкрементируемый счётчик на поле product_id таблицы products
-- (БД northwind). Счётчик должен начинаться с числа следующего за максимальным
-- значением по этому столбцу.

-- 13. Произвести вставку в products (не вставляя идентификатор явно) и убедиться,
-- что автоинкремент работает. Вставку сделать так, чтобы в результате команды
-- вернулось значение, сгенерированное в качестве идентификатора.