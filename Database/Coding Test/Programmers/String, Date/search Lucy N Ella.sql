-- command by Oracle
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE FROM ANIMAL_INS
-- WHERE 컬럼명 IN ('조건1', '조건2', ...) => (특정 컬럼에 여러 개의 값이 포함되었는지 체크)
WHERE NAME IN('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty')
ORDER BY ANIMAL_ID ASC;