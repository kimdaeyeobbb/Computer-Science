-- DELETE & DROP & TRUNCATE 비교
-- 아래 3개의 statement는 대량의 테이블을 만드는 statement (내용에 의미는 없음)
USE market_db;
DROP TABLE big_table1;
DROP TABLE big_table2;
DROP TABLE big_table3;
CREATE TABLE big_table1 (SELECT * FROM world.city, sakila.country);
CREATE TABLE big_table2 (SELECT * FROM world.city, sakila.country);
CREATE TABLE big_table3 (SELECT * FROM world.city, sakila.country);

DELETE FROM big_table1;   -- DELETE: 삭제시 빈 테이블을 남김. 삭제가 오래걸림
DROP TABLE big_table2;   -- DROP: 삭제시 테이블이 아예 사라짐. 테이블 자체를 순식간에 삭제. 대용량 테이블의 전체 내용을 삭제할 때 테이블 자체가 필요없을 경우 사용 
TRUNCATE TABLE big_table3;    -- TRUNCATE: 삭제시 빈 테이블을 남김. DELETE와 동일한 효과를 내지만 속도가 매우 빠름. 대용량 테이블 전체 내용을 삭제할 때 테이블 구조를 남기고 싶을 경우 사용