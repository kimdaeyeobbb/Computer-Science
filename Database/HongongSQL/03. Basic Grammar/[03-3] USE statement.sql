USE market_db;   
-- USE: DB 선택 지정 (SELECT 문을 실해하기 위해 DB를 지정해야 함) -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 

-- UPDATE statement
UPDATE city_popul   -- UPDATE: 기존에 입력되어 있는 값을 수정하는 명령
	SET city_name = '서울'
    WHERE city_name = 'Seoul';

SELECT * FROM city_popul WHERE city_name = '서울';


UPDATE city_popul
	SET city_name='뉴욕', population = 0
    WHERE city_name = 'New York';
SELECT * FROM city_popul WHERE city_name = '뉴욕';   -- WHERE절 생략시 테이블내 모든 행이 변경되므로 주의


-- SELECT FROM WHERE에서 WHERE을 생략한 케이스 (WHERE 생략시 테이블 내 모든 행이 변경)
UPDATE city_popul   -- UPDATE: 데이터 수정
	SET population = population/10000;   -- UPDATE SET WHERE에서 WHERE을 생략함으로써 모든 행의 내용을 변경
SELECT * FROM city_popul LIMIT 5;