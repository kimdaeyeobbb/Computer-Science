DROP TABLE hongong3;

CREATE TABLE hongong3(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT
);
ALTER TABLE hongong3 AUTO_INCREMENT = 1000;   -- 1000부터 AUTO_INCREMENT 시작
SET @@auto_increment_increment = 3;  -- 3씩 증가 (시스템 변수 앞에 @@를 붙임)

INSERT INTO hongong3 VALUES(NULL, '에디',20);
INSERT INTO hongong3 VALUES(NULL, '폴', 23);
INSERT INTO hongong3 VALUES(NULL, '필', 26);
SELECT * FROM hongong3;