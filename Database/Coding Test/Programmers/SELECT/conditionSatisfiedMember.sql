SELECT COUNT(USER_ID) AS USERS FROM USER_INFO 
WHERE JOINED Like "2021%" 
AND (AGE >= 20 AND AGE <= 29)

-- COUNT(컬렴명) : 컬렴명에 해당하는 컬럼의 개수 조회
-- [대상] AS [별칭] : [대상]을 [별칭]으로 지칭
-- WHERE [컬럼명] Like [조건] : [조건]이라는 특정 문자로 시작/종료 되거나 특정 문자를 포함하는 컬럼 선별
-- WHERE [조건1] AND [조건2] : 조건 1과 조건 2 모두를 충족시키는지 확인
-- Like "2021%" : 2021로 시작하는 항목 선별