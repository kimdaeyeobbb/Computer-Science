USE market_db;
-- USE: DB 선택 지정 (SELECT 문을 실해하기 위해 DB를 지정해야 함) -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 

-- DELET FROM ~ WHERE ~
DELETE FROM city_popul
	WHERE city_name LIKE 'New%'   -- New%: New로 시작하는 특정한 값을 찾음
    LIMIT 5;   -- 상위 5건만 삭제
    
SELECT * FROM city_popul WHERE city_name LIKE 'New%';   -- 데이터 조회