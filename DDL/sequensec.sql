CREATE SEQUENCE seq1;

SELECT nextval('seq1');
SELECT currval('seq1');
SELECT lastval();

SELECT setval('seq1', 16, true);
select currval('seq1');
SELECT nextval('seq1');

SELECT setval('seq1', 16, false);
select currval('seq1');
SELECT nextval('seq1');

CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 16;
SELECT nextval('seq2');

CREATE SEQUENCE IF NOT EXISTS seq3 INCREMENT 16
    MINVALUE 0
    MAXVALUE 128
    START WITH 0;
SELECT nextval('seq3');

ALTER SEQUENCE seq3 RENAME TO seq4;
ALTER SEQUENCE seq4 RESTART WITH 16;
SELECT nextval('seq4');

DROP SEQUENCE seq4;