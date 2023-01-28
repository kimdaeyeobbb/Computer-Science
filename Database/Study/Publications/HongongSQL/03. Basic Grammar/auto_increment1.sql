USE market_db;
CREATE TABLE hongong2(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,   -- AUTO_INCREMENT 지정열은 PRIMARY KEY로 지정해줘야 함
    toy_name CHAR(4),
    age INT);
    
-- 자동 증가하는 부분은 NULL로 채워넣음
INSERT INTO hongong2 VALUES(NULL, '보핍',25);
INSERT INTO hongong2 VALUES(NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES(NULL, '렉스',21);
SELECT * FROM hongong2;

SELECT LAST_INSERT_ID();