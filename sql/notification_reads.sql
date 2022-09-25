CREATE TABLE notification_reads(
	id INT NOT NULL AUTO_INCREMENT,
    is_read BOOLEAN NOT NULL,
    notification_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id)
);


ALTER TABLE notification_reads
	MODIFY user_id VARCHAR(100) NOT NULL;
    
ALTER TABLE notification_reads
	ADD CONSTRAINT fk_notification_reads_notification
    FOREIGN KEY (notification_id) REFERENCES notifications(id),
    ADD CONSTRAINT fk_notification_reads_user
    FOREIGN KEY (user_id) REFERENCES users(id);


INSERT INTO notification_reads (is_read, notification_id, user_id)
	VALUES(true, 2, "jennie");
INSERT INTO notification_reads (is_read, notification_id, user_id)
	VALUES(true, 2, "lisa");

INSERT INTO notification_reads (is_read, notification_id, user_id)
	VALUES(true, 5, "jennie");
INSERT INTO notification_reads (is_read, notification_id, user_id)
	VALUES(true, 4, "jennie");
INSERT INTO notification_reads (is_read, notification_id, user_id)
	VALUES(true, 1, "jennie");

SELECT * FROM notification_reads;

DESC notification_reads;    
    
SHOW TABLES;
