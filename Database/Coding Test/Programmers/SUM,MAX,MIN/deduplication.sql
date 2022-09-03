-- command by Oracle
-- COUNT(*): 조회된 전체행의 건수를 반환
-- COUNT(컬럼명): 컬럼의 값이 NULL인 행은 카운팅하지 않음
-- COUNT(DISTINCT 컬럼명): 칼럼의 중복 값제거, 칼럼의 건수 반환
SELECT COUNT(DISTINCT NAME) AS count FROM ANIMAL_INS;