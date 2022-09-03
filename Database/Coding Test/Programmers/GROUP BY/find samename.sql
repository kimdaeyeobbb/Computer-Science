-- command by Oracle
SELECT NAME AS NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS
-- 이름별 개수를 구하기 위해 이름을 그룹 별로 묶음
GROUP BY NAME
-- HAVING: 필터 역할. 그룹별 집계된 결과 중 원하는는 조건의 결과만 필터링
-- HAVING은 GROUP BY절과 함께 사용해야하며, 집계함수를 사용하여 조건절을 작성
-- 이름이 2번 이상 등장한 것만 체킹
HAVING COUNT(NAME) >= 2
-- 이름순으로 정렬
ORDER BY NAME;