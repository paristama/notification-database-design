CREATE TABLE user(
	id VARCHAR(100) NOT NULL,
	name VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE user
RENAME users;

INSERT INTO users(id, name) VALUES("jennie", "Jennie Kim"),
									("lisa", "Lalisa Manobal");

SELECT * FROM users;

SHOW TABLES;