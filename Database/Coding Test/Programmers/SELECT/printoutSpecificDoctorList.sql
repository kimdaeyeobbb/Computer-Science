SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD FROM DOCTOR
WHERE MCDP_CD Like 'CS' OR MCDP_CD Like'GS' -- 흉부외과(CS)이거나 일반외과(GS) 추출
ORDER BY HIRE_YMD DESC, DR_NAME ASC -- 고용일자 기준 내림차순 & 고용일자 동일-> 이름기준 오름차순



-- SELECT [칼럼명] FROM [테이블명] WHERE [칼럼명] Like [해당 부분]
-- 해당부분: 'Text' => Text와 동일한 부분에 대한 선별
-- SELECT [컬럼명] FROM [테이블명] ORDER BY [칼럼1] [정렬조건1 (오름차순/내림차순], [칼럼2] [정렬조건2], ... , [칼럼n] [정렬조건n]
-- DATE_FORMAT(DATETIME, %Y-%m-%d) : DATETIME을 2020-01-11 꼴로 변환