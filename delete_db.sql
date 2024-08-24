-- Подключитесь к базе данных postgres
\c postgres

-- Завершите все активные сессии базы данных testdb
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'testdb';

-- Удалите базу данных testdb
DROP DATABASE testdb;
