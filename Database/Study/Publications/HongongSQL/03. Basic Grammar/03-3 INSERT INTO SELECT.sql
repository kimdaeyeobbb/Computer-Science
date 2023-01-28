USE market_db;   -- USE: DB 선택 지정 (SELECT 문을 실해하기 위해 DB를 지정해야 함) -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 
DROP TABLE hongong3;   -- DROP TABLE: 테이블에 저장된 데이터를 포함해서 테이블 전체를 삭제
CREATE TABLE hongong3 (    -- CREATE TABLE: DB에 새로운 테이블 생성 
   toy_id  INT AUTO_INCREMENT PRIMARY KEY,   -- AUTO_INCREMENT로 지정하는 열은 PRIMARY KEY로 지정해줘야 함 
   toy_name CHAR(4), 
   age INT);

ALTER TABLE hongong3 AUTO_INCREMENT=1000;   
-- ALTER TABLE: 기존 테이블의 열을 추가/삭제/수정시 사용 & 기존 테이블에 다양한 제약 조건 추가 및 삭제시 사용 
-- AUTO_INCREMENT: 시작값설정

SET @@auto_increment_increment=3;  -- 증가값은 3으로 지정

INSERT INTO hongong3 VALUES (NULL, '토마스', 20);   -- INSERT INTO문을 사용하여 레코드 추가
INSERT INTO hongong3 VALUES (NULL, '제임스', 23);
INSERT INTO hongong3 VALUES (NULL, '고든', 25);
SELECT * FROM hongong3;

SELECT COUNT(*) FROM world.city;   -- Result 6

DESC world.city;   -- DESC(DESCRIBE): 테이블 구조 출력. (CREATE TABLE을 어떻게 했는지 예상할 수 있음)

SELECT * FROM world.city LIMIT 5;    -- city 8 출력. LIMIT 5: 살펴볼 데이터를 5건으로 제한

DROP TABLE city_popul;    -- DROP TABLE: 테이블에 저장된 데이터를 포함해서 테이블 전체를 삭제
CREATE TABLE city_popul (city_name CHAR(35), population INT);   -- CREATE TABLE: 테이블 생성
INSERT INTO city_popul SELECT Name, Population FROM world.city;    -- INSERT INTO ~ SELECT: 다른 테이블의 데이터를 한 번에 입력