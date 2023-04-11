CREATE TABLE page(
    page_id INT NOT NULL PRIMARY KEY,
    page_name VARCHAR(32),
    restriction_level VARCHAR(32),
    page_length INT,
)engine=innodb;

CREATE TABLE Link(
    link_id INT NOT NULL PRIMARY KEY,
    from_url VARCHAR(32),
    to_url VARCHAR(32),
    is_external BOOLEAN,
    links_from INT,
    links_to INT,
    FOREIGN KEY (links_from) REFERENCES page(page_id),
    FOREIGN KEY (links_to) REFERENCES page(page_id)
)engine=innodb;

CREATE TABLE User(
    user_id INT NOT NULL PRIMARY KEY,
    user_name VARCHAR(32),
    user_password VARCHAR(32),
    user_email VARCHAR(32),
    user_group VARCHAR(32),
    last_login DATE,
    ip_address INT,
    registration_date DATE
)engine=innodb;

CREATE TABLE revision(
    revision_id INT NOT NULL PRIMARY KEY,
    date_time DATE,
    rev_length INT,
    page_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (page_id) REFERENCES page(page_id)
)engine=innodb;

CREATE TABLE revision_comment(
    revision_id INT,
    comment_hash INT,
    comment_test VARCHAR(32),
    FOREIGN KEY (revision_id) REFERENCES revision(revision_id),
    PRIMARY KEY (revision_id)
)