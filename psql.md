# Команды для работы с базами данных:
- \c [database_name]: Подключиться к базе данных.
- \l или \list: Показать список баз данных.
- \dn или \list-namespaces: Показать список схем в текущей базе данных.
- \dt [schema_name.][table_name] или \list-tables [schema_name.][table_name]: Показать список таблиц.
- \d [table_name]: Показать описание структуры таблицы.
- \di [index_name] или \list-indexes [index_name]: Показать список индексов.
- \dv [view_name] или \list-views [view_name]: Показать список представлений.
# Команды для работы с данными:
- SELECT * FROM table_name;: Выполнить запрос на выборку данных из таблицы.
- INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);: Вставить данные в таблицу.
- UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;: Обновить данные в таблице.
- DELETE FROM table_name WHERE condition;: Удалить данные из таблицы.
# Команды для работы с транзакциями:
- BEGIN;: Начать транзакцию.
- COMMIT;: Зафиксировать транзакцию.
- ROLLBACK;: Откатить транзакцию.
# Команды для работы с пользователями и ролями:
- \du или \list-roles: Показать список пользователей и ролей.
- CREATE USER username WITH PASSWORD 'password';: Создать нового пользователя.
- GRANT ALL PRIVILEGES ON database_name TO username;: Предоставить все привилегии пользователю на базе данных.
# Системные команды:
- \q: Выйти из psql.
- \! command: Выполнить системную команду.
# Команды для настройки вывода:
- \pset [format]: Изменить формат вывода (например, \pset format aligned для табличного вывода).
- \timing: Включить или выключить отображение времени выполнения команд.
# Полезные команды:
- \?: Показать справку по всем командам psql.
- \x [on|off]: Включить или выключить расширенный формат вывода.