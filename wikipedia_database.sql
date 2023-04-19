SET FOREIGN_KEY_CHECKS=0;

-- ------------------   page -- -------------------------------

DROP TABLE IF EXISTS w_page;

CREATE TABLE w_page (
    page_id                  INT         NOT NULL PRIMARY KEY,
    page_name                VARCHAR(128),
    edit_restriction_level   VARCHAR(32),
    page_length              INT
);

INSERT INTO w_page VALUES (18978754, 'Apple', 'autoconfirmed', 82179);
INSERT INTO w_page VALUES (48739272, 'An_apple_a_day_keeps_the_doctor_away', 'unregistered', 5307);
INSERT INTO w_page VALUES (9823, 'Eris (mythology)', 'unregistered', 16801);
INSERT INTO w_page VALUES (19614253, 'Cider', 'unregistered', 101000);
INSERT INTO w_page VALUES (30108, 'Tajikistan', 'unregistered', 157930);
INSERT INTO w_page VALUES (32512, 'Vitamin', 'autoconfirmed', 67847);
INSERT INTO w_page VALUES (25532, 'Renaissance', 'autoconfirmed', 119968);
INSERT INTO w_page VALUES (233609, 'Pollination', 'unregistered', 71206);
INSERT INTO w_page VALUES (289445, 'Malus', 'unregistered', 22809);
INSERT INTO w_page VALUES (1291988, 'Latin_language', 'autoconfirmed', 108);
INSERT INTO w_page VALUES (25414, 'Religion', 'autoconfirmed', 164416);
INSERT INTO w_page VALUES (25955086, 'Jews', 'extendedconfirmed', 179503);
INSERT INTO w_page VALUES (25734, 'Taiwan', 'extendedconfirmed', 341923);
INSERT INTO w_page VALUES (10553, 'Flute', 'unregistered', 46676);
INSERT INTO w_page VALUES (50020, 'Hope', 'unregistered', 33745);
INSERT INTO w_page VALUES (23953699, 'Androgeny', 'unregistered', 132);
INSERT INTO w_page VALUES (21265839, 'Bachata', 'unregistered', 768);

-- ------------------   link -- -------------------------------
DROP TABLE IF EXISTS link;

CREATE TABLE link(
    link_id         INT NOT NULL PRIMARY KEY,
    from_id         INT,
    to_id           INT,
    to_page_name    VARCHAR(128),
    is_external     BOOLEAN,
    FOREIGN KEY (from_id) REFERENCES w_page (page_id)

);

-- link from apple page to other pages -- 
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

-- maybe restructure according to his feedback on the last assignment?
CREATE TABLE user(
    user_id         INT             NOT NULL PRIMARY KEY,
    user_name       VARCHAR(32),
    user_password   VARCHAR(32),
    user_email      VARCHAR(32)
);
---fake data since we don't have access to users' personal info----
INSERT INTO user VALUES (0, 'kbreen', 'password', 'kbreen@macalester.edu');
INSERT INTO user VALUES (1, 'AxelBoldt', '12345', 'aboldt@macalester.edu');
INSERT INTO user VALUES (2, 'Magnus Manske', 'OVERTHEGARDENWALL', 'mmanske@macalester.edu');
INSERT INTO user VALUES (3, 'JvaGoddess', 'pemnv93na', 'jgoddess@macalester.edu');
INSERT INTO user VALUES (4, 'Eloquence', '@^Fsskjj$', 'eloquence@macalester.edu');
INSERT INTO user VALUES (5, 'Tuxisuau', 'jjjjjjjjjdkfds', 'tuxisuau@macalester.edu');


-- ------------------   user group -- -------------------------------
DROP TABLE IF EXISTS user_group;

-- maybe restructure according to his feedback on the last assignment?
CREATE TABLE user_group(
    user_id         INT     NOT NULL    REFERENCES user(user_id),
    user_group      VARCHAR(128),
    PRIMARY KEY(user_id)
);

INSERT INTO user_group VALUES (0, "reviewer");
INSERT INTO user_group VALUES (1, "sysop");
INSERT INTO user_group VALUES (2, "extendedconfirmed");
INSERT INTO user_group VALUES (3, "extendedconfirmed");
INSERT INTO user_group VALUES (4, "autoreviewer");
INSERT INTO user_group VALUES (5, "reviewer");

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

-- INSERT INTO revision VALUES (10, 18978754, 25414, 'Religion', FALSE);

-- CREATE TABLE revision_comment(
--     revision_id INT,
--     comment_hash INT,
--     comment_test VARCHAR(32),
--     FOREIGN KEY (revision_id) REFERENCES revision(revision_id),
--     PRIMARY KEY (revision_id)
-- )

SET FOREIGN_KEY_CHECKS=1;