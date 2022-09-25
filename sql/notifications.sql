CREATE TABLE notifications(
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    detail TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    user_id VARCHAR(100),
    PRIMARY KEY(id)
);


ALTER TABLE notifications
	ADD CONSTRAINT fk_notification_user
		FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE notifications
	ADD COLUMN category_id VARCHAR(100);
ALTER TABLE notifications
    ADD CONSTRAINT fk_notification_category
    FOREIGN KEY(category_id) REFERENCES categories(id);


INSERT INTO notifications (title, detail, created_at, user_id)
			VALUES ("Contoh Pesanan", "Detail Pesananan", CURRENT_TIMESTAMP(), "jennie");
INSERT INTO notifications (title, detail, created_at, user_id)
			VALUES ("Contoh Promo", "Detail Promo", CURRENT_TIMESTAMP(), NULL);
INSERT INTO notifications (title, detail, created_at, user_id)
			VALUES ("Contoh Pembayaran", "Detail Pembayaran", CURRENT_TIMESTAMP(), "lisa");


UPDATE notifications SET category_id = "promo"
		WHERE id = 2;
UPDATE notifications SET category_id = "info"
		WHERE id != 2;


SELECT * FROM notifications
	WHERE (user_id = "jennie" OR user_id IS NULL)
	ORDER BY created_at DESC;
SELECT * FROM notifications
	WHERE (user_id = "lisa" OR user_id IS NULL)
	ORDER BY created_at DESC;


SELECT *
	FROM notifications
	AS n JOIN categories AS c ON (n.category_id = c.id)
	WHERE (user_id = "jennie" OR user_id IS NULL)
    ORDER BY created_at DESC;

SELECT *
	FROM notifications
	AS n JOIN categories AS c ON (n.category_id = c.id)
	WHERE (user_id = "lisa" OR user_id IS NULL)
    ORDER BY created_at DESC;
    
SELECT *
	FROM notifications
	AS n JOIN categories AS c ON (n.category_id = c.id)
	WHERE (user_id = "lisa" OR user_id IS NULL) AND c.id = "promo"
    ORDER BY created_at DESC;
    

SELECT n.id AS n_id,
	   n.title AS n_title,
       n.detail AS n_detail,
       n.user_id AS n_user_id,
       c.id AS c_id,
       c.name AS c_name,
       nr.id AS nr_id,
       nr.is_read AS nor_read,
	   nr.notification_id AS nr_id,
       nr.user_id AS nr_user_id
FROM notifications
	AS n Join categories AS c ON (n.category_id = c.id)
         Join notification_reads AS nr ON (n.id = nr.notification_id)
    WHERE (n.user_id = "jennie" OR n.user_id IS NULL) AND c.id = "promo"
    ORDER BY created_at DESC;


SELECT * FROM notifications
	AS n JOIN categories AS c ON (n.category_id = c.id)
         LEFT JOIN notification_reads AS nr ON (nr.notification_id = n.id)
    WHERE (n.user_id = "jennie" OR n.user_id IS NULL)
    AND (nr.user_id = "jennie" OR nr.user_id IS NULL)
    ORDER BY created_at DESC;
    

INSERT INTO notifications (title, detail, created_at, user_id, category_id)
			VALUES ("Contoh Pesanan Lagi", "Detail Pesananan Lagi", CURRENT_TIMESTAMP(), "jennie", "info");

INSERT INTO notifications (title, detail, created_at, user_id, category_id)
			VALUES ("Contoh Promo Lagi", "Detail Pesananan Lagi", CURRENT_TIMESTAMP(), null, "promo");
UPDATE notifications SET detail = "Detail Promo Lagi" WHERE id = 5;            


# Counter
SELECT COUNT(*) FROM notifications
	AS n JOIN categories AS c ON (n.category_id = c.id)
         LEFT JOIN notification_reads AS nr ON (nr.notification_id = n.id)
    WHERE (n.user_id = "jennie" OR n.user_id IS NULL)
    AND (nr.user_id IS NULL)
    ORDER BY created_at DESC;
    
SELECT * FROM notifications;        
        
DESCRIBE notifications;        

USE pzn_notification;

SHOW TABLES;