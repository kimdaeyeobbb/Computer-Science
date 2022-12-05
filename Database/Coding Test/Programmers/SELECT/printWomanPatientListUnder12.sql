SELECT PT_NAME, PT_NO, GEND_CD, AGE,
IFNULL(TLNO,"NONE") AS TLNO -- 전화번호가 없는 경우 'NONE'으로 출력
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'   -- 나이: 12세 이하 & 성별: 여자
ORDER BY AGE DESC, PT_NAME ASC -- 나이기준 내림차순, 같다면 환자명기준 오름차순


-- SELECT IFNULL(칼럼명, "NULL일 경우 대체 값") FROM 테이블명
-- SELECT IFNULL(NAME, "NO NAME") AS NAME FROM HUMAN_INFO

-- SELECT[칼럼명] FROM [테이블명] ORDER BY[칼럼1] [정렬조건1], [칼럼2] [정렬조건2] , ... [칼럼N] [정렬조건N]