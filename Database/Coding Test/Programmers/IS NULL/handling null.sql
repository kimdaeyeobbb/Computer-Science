/*
CASE문 사용법 1)
CASE WHEN[조건식1] THEN[조건1 만족시 리턴 값]
     WHEN[조건식2] THEN[조건2 만족시 리턴 값]
     ELSE[조건 만족하지 않았을 시 리턴 값] 
     END AS [컬럼명]
     
CASE문 사용법 2)
- 대상 값과 값을 비교하여 각각 다른 결과 값을 출력하고 싶은 경우
CASE[대상값] WHEN [값1] THEN [리턴 값1]
            WHEN [값2] THEN [리턴 값2] END
*/

-- command by Oracle

SELECT ANIMAL_TYPE
    ,CASE WHEN NAME IS NULL THEN 'No name'  -- NULL 값일때 No name
    ELSE NAME  -- 조건을 만족하지 않았을 때 (NULL 값이 아닐 때) NAME 그대로 출력
    END AS NAME  -- 별칭
    , SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;