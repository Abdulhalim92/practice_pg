CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employee (employee_id)
);

INSERT INTO employee (
                      first_name,
                      last_name,
                      manager_id
)
VALUES
    ('Windy', 'Hays', NULL),
    ('Ava', 'Christensen', 1),
    ('Hassan', 'Corner', 1),
    ('Anna', 'Reeves', 2),
    ('Sau', 'Norman',2),
    ('Kelsie', 'Hays', 3),
    ('Tory', 'Golf', 3),
    ('Salle', 'Lester', 3);

SELECT e.first_name || ' ' || e.last_name AS employee,
       m.first_name || ' ' || m.last_name AS manager
FROM employee e
LEFT JOIN employee m
ON m.employee_id = e.manager_id
ORDER BY manager;