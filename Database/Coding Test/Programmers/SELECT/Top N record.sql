-- command by Oracle
SELECT NAME
-- 서브쿼리(Inline view)
FROM (
    SELECT NAME
    FROM ANIMAL_INS
    -- 보호소에 들어온 시기별로 오름차순 정렬
    ORDER BY DATETIME ASC
)
-- 보호소에 가장 먼저 들어온 동물
WHERE ROWNUM = 1