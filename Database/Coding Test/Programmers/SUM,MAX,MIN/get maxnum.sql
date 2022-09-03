-- command by Oracle
-- AS ~ : 별칭(Alias) 설정
SELECT DATETIME AS 시간 
-- 서브쿼리 (Inline view)
    FROM (
        SELECT DATETIME
        FROM ANIMAL_INS
        -- 가장 최근에 들어온 동물부터 내림차순 정렬
        ORDER BY DATETIME DESC
    )
-- 제일 최근에 들어온 동물
WHERE ROWNUM = 1