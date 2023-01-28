DROP TABLE IF EXISTS mst_users;  -- 테이블이 존재하면 삭제
CREATE TABLE mst_users(   -- 테이블 생성
user_id varchar(255)
, register_date varchar(255)
, register_device integer
);

INSERT INTO mst_users
VALUES
('U001', '2016-08-26', 1)
, ('U002', '2016-08-26', 2)
, ('U003', '2016-08-27', 3)
;

SELECT * FROM mst_users;