-- command by Oracle
SELECT DATETIME AS "시간"
-- 서브쿼리 (Inlin view)
    FROM(
        SELECT DATETIME
        FROM ANIMAL_INS
        -- 들어온 순서대로 정렬
        ORDER BY DATETIME ASC
    )
-- 제일 먼저 들어온 데이터의 행 조회
WHERE ROWNUM = 1;