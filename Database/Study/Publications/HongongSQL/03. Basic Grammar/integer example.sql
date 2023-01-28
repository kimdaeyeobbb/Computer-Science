DROP TABLE hongong4;
USE market_db;
CREATE TABLE hongong4(   -- 정수형 비교 확인용 테이블
	tinyint_col TINYINT,
    smallint_col SMALLINT,
    int_col INT,
    bigint_col BIGINT
);

INSERT INTO hongong4 VALUES(128, 32768, 2147483648, 9000000000000);