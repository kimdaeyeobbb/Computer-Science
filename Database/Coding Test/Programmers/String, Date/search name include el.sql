-- command by Oracle
SELECT ANIMAL_ID, NAME FROM ANIMAL_INS
-- 대소문자 모두 찾기 위해 애초에 모든 문자를 소문자로 바꾸어서 탐색
WHERE LOWER(NAME) LIKE '%el%' AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME ASC;