CREATE TABLE categories(
	id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
);


INSERT INTO categories (id, name)
	VALUES ('info', "INFO"),
			("promo", "PROMO");


SELECT * FROM categories;


ALTER TABLE categories
	ADD PRIMARY KEY(id);

SHOW TABLES;

DESC categories;