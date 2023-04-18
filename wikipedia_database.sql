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

-- ------------------   link -- -------------------------------
DROP TABLE IF EXISTS link;

CREATE TABLE link(
    from_id         INT NOT NULL PRIMARY KEY,
    to_id           INT NOT NULL PRIMARY KEY,
    to_page_name    VARCHAR(32),
    is_external     BOOLEAN
);

INSERT INTO w_page VALUES (18978754, 11473533, 'Adam_and_Eve', FALSE);

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