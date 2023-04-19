--query 1: Return all the pages that the page "Apple" links to
SHOW TABLES;

DROP TABLE IF EXISTS q1;
CREATE TABLE q1 AS
SELECT DISTINCT to_id
FROM
    (SELECT * 
    FROM w_page
    WHERE page_name = 'Apple') A
    JOIN
    link B
    ON A.page_id = B.from_id;
ALTER TABLE q1 ADD PRIMARY KEY(page_id);
SELECT * FROM q1 LIMIT 5;

--query 2: Return the page that has been revised the most

DROP TABLE IF EXISTS q2;

CREATE TABLE q2 AS

DROP TABLE IF EXISTS q2;

--query 3: Return all the editors of a particular page

DROP TABLE IF EXISTS q3;

CREATE TABLE q3 AS
SELECT user_id FROM revision WHERE page_id = 123;

DROP TABLE IF EXISTS q3;