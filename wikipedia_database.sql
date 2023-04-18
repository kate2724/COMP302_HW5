SET FOREIGN_KEY_CHECKS=0;

-- ------------------   page -- -------------------------------

DROP TABLE IF EXISTS w_page;

CREATE TABLE w_page (
    page_id                  INT         NOT NULL PRIMARY KEY,
    page_name                VARCHAR(32),
    edit_restriction_level   VARCHAR(32),
    page_length              INT
);

INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
-- INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);

-- ------------------   link -- -------------------------------
DROP TABLE IF EXISTS link;

CREATE TABLE link(
    link_id         INT NOT NULL PRIMARY KEY,
    from_id         INT,
    to_id           INT,
    to_page_name    VARCHAR(128),
    is_external     BOOLEAN
);

INSERT INTO link VALUES (0, 18978754, 11473533, 'Adam_and_Eve', FALSE);
INSERT INTO link VALUES (1, 18978754, 48739272, 'An_apple_a_day_keeps_the_doctor_away', FALSE);
INSERT INTO link VALUES (2, 18978754, 9823, 'Eris_(mythology)', FALSE);
INSERT INTO link VALUES (3, 18978754, 19614253, 'Cider', FALSE);
INSERT INTO link VALUES (4, 18978754, 30108, 'Tajikistan', FALSE);
INSERT INTO link VALUES (5, 18978754, 32512, 'Vitamin', FALSE);
INSERT INTO link VALUES (6, 18978754, 25532, 'Renaissance', FALSE);
INSERT INTO link VALUES (7, 18978754, 233609, 'Pollination', FALSE);
INSERT INTO link VALUES (8, 18978754, 289445, 'Malus', FALSE);
INSERT INTO link VALUES (9, 18978754, 1291988, 'Latin_language', FALSE);
INSERT INTO link VALUES (10, 18978754, 25414, 'Religion', FALSE);

-- ------------------   user -- -------------------------------
DROP TABLE IF EXISTS user;

CREATE TABLE user(
    user_id         INT             NOT NULL PRIMARY KEY,
    user_name       VARCHAR(32),
    user_password   VARCHAR(32),
    user_email      VARCHAR(32),
    user_group      VARCHAR(32),
    last_login      DATE,
    ip_address      INT,
    registration_date DATE
);

-- ------------------   revision -- -------------------------------
DROP TABLE IF EXISTS revision;

CREATE TABLE revision(
    revision_id INT NOT NULL PRIMARY KEY,
    date_time DATE,
    rev_length INT,
    page_id INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (page_id) REFERENCES page(page_id)
);

-- CREATE TABLE revision_comment(
--     revision_id INT,
--     comment_hash INT,
--     comment_test VARCHAR(32),
--     FOREIGN KEY (revision_id) REFERENCES revision(revision_id),
--     PRIMARY KEY (revision_id)
-- )

SET FOREIGN_KEY_CHECKS=1;