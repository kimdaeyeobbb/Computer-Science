-- command by Oracle
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS count
FROM ANIMAL_INS
-- 같은 동물 타입끼리 묶음
GROUP BY ANIMAL_TYPE
-- Cat이 Dog보다 사전순으로 빠르기 때문에 사전순 정렬
ORDER BY ANIMAL_TYPE;