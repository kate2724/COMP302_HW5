--query 1: Return all the pages that the page "Apple" links to



-- DROP TABLE IF EXISTS q1;
-- CREATE TABLE q1 AS
-- SELECT DISTINCT to_id
-- FROM
--     link A
--     JOIN
--     (SELECT * 
--     FROM w_page
--     WHERE page_name = 'Apple') B
--     ON A.from_id = B.page_id;
-- ALTER TABLE q1 ADD PRIMARY KEY(page_id);
-- SELECT * FROM q1 LIMIT 5;

--query 2: Return the page that has been revised the most

-- DROP TABLE IF EXISTS revision_count_by_page;
-- DROP TABLE IF EXISTS max_revision_count_with_page;

-- CREATE TABLE revision_count_by_page AS
-- SELECT page_id, COUNT(r_date) AS revision_count
-- FROM revision
-- GROUP BY page_id;

-- CREATE TABLE max_revision_count_with_page AS
-- SELECT page_id
-- FROM revision_count_by_page
-- WHERE max_revisions = ( SELECT MAX(revision_count) FROM revision_count_by_page) ;
-- -- GROUP BY page_id;


-- SELECT * FROM max_revision_count_with_page;

--query 3: Return all the editors of a particular page

DROP TABLE IF EXISTS q3;

CREATE TABLE q3 AS
SELECT DISTINCT user_id 
FROM revision 
WHERE page_id = 18978754;

SELECT * FROM q3;

DROP TABLE IF EXISTS q3;