--query 1: Return all the pages that the page "Apple" links to
SHOW TABLES;

DROP TABLE IF EXISTS q1;
CREATE TABLE q1 AS
SELECT DISTINCT to_id
FROM
    link A
    JOIN
    (SELECT * 
    FROM w_page
    WHERE page_name = 'Apple') B
    ON A.from_id = B.page_id;
ALTER TABLE q1 ADD PRIMARY KEY(page_id);
SELECT * FROM q1 LIMIT 5;

--query 2: Return the page that has been revised the most

DROP TABLE IF EXISTS revision_count_by_page;
DROP TABLE IF EXISTS q2;

CREATE TABLE revision_count_by_page AS
SELECT page_id, COUNT(revision_id) AS revision_count
FROM revision
GROUP BY page_id;

CREATE TABLE max_revision_count_with_page AS
SELECT page_id, MAX(revision_count) AS max_revisions
FROM revision_count_by_page
GROUP BY page_id;


SELECT * FROM q2;

--query 3: Return all the editors of a particular page

DROP TABLE IF EXISTS q3;

CREATE TABLE q3 AS
SELECT user_id FROM revision WHERE page_id = 123;

DROP TABLE IF EXISTS q3;