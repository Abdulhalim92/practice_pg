ALTER TABLE chair
ADD CONSTRAINT cathedra_pkey PRIMARY KEY (chair_id);

ALTER TABLE chair
DROP CONSTRAINT cathedra_pkey;

-- Основные характеристики первичного ключа:

-- Уникальность: Значения в колонке или наборе колонок, определенных как Primary Key,
-- должны быть уникальными для каждой строки. Это гарантирует, что каждая запись в
-- таблице может быть однозначно идентифицирована.

-- Not Null: Все значения в колонке или колонках, которые составляют первичный ключ,
-- не могут быть NULL. Это означает, что в любой строке таблицы должно быть задано
-- значение для этой колонки.

-- Одна таблица — один первичный ключ: В каждой таблице может быть только одно
-- ограничение Primary Key, но оно может включать несколько колонок (так называемый
-- составной ключ).

-- Индексация: Обычно система управления базами данных (СУБД) автоматически создает
-- уникальный индекс для Primary Key, что ускоряет поиск и другие операции с
-- использованием этого ключа.

ALTER TABLE chair
ADD CONSTRAINT ch_name_unique UNIQUE (chair_name);

ALTER TABLE chair
DROP CONSTRAINT ch_name_unique;

-- Основные характеристики ограничения UNIQUE:

-- Уникальные значения: В колонке или комбинации колонок, на которые наложено
-- ограничение UNIQUE, значения не могут повторяться.

-- Null значения: В отличие от PRIMARY KEY, который не допускает NULL значений,
-- ограничение UNIQUE позволяет наличие NULL значений, но если несколько строк
-- содержат NULL, они не будут считаться дублирующимися.

-- Ограничение на несколько колонок: UNIQUE можно применить к одной колонке или
-- к комбинации нескольких колонок. В последнем случае уникальность будет
-- обеспечена для сочетания значений этих колонок.

SELECT constraint_name
FROM information_schema.key_column_usage
WHERE table_name = 'chiar'
    AND table_schema = 'public'
    AND column_name = 'chair_id';

SELECT current_database();
SHOW search_path;
SET search_path TO public, information_schema;

SELECT constraint_name, table_name, column_name
FROM information_schema.constraint_column_usage
WHERE table_name = 'chair'
  AND table_schema = 'public';

DROP TABLE IF EXISTS public.chair;

CREATE TABLE public.chair
(
    chair_id SERIAL,
    chair_name VARCHAR,
    dean VARCHAR,

    CONSTRAINT pk_chair_chair_id PRIMARY KEY (chair_id)
);

ALTER TABLE chair
DROP CONSTRAINT pk_chair_chair_id;

ALTER TABLE chair
ADD PRIMARY KEY (chair_id);