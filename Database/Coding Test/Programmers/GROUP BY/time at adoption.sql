-- command by Oracle


/*
 ORACLE TO_CHAR 함수: 날짜,숫자 등의 값을 문자열로 변환하는 함수
 1) 날짜 포맷 변경
 SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')              20200723
    , TO_CHAR(SYSDATE, 'YYYY/MM/DD')            2020/07/23
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD')            2020-07-23
    , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') 2020-07-23 11:10:52
  FROM dual

2) 날짜의 0 없애기
SELECT TO_CHAR(SYSDATE, 'MM/DD')   07/03
  , TO_CHAR(SYSDATE, 'FMMM/DD') 7/3
FROM dual

3) 임의의 구분자로 날짜 형식 만들기
SELECT TO_CHAR(SYSDATE, '""YYYY"년 "MM"월 "DD"일"') --2020년 07월 23일
     , TO_CHAR(SYSDATE, '""HH24"시 "MI"분 "SS"초"') --11시 12분 20초
  FROM dual
  
4) 기타
TO_CHAR(SYSDATE,'HH')  -- 11 (시간을 0~12 형태로 표시)
TO_CHAR(SYSDATE, 'HH24') -- 21 (시간을 0~24 형태로 표시)
*/
SELECT to_char(DATETIME, 'HH24') AS HOUR, 
COUNT(to_char(DATETIME, 'HH24')) AS COUNT FROM ANIMAL_OUTS
-- 9시~19시 
WHERE to_char(DATETIME, 'HH24') BETWEEN 9 AND 19
-- 그룹화
GROUP BY to_char(DATETIME, 'HH24')
-- 오름차순 정렬
ORDER BY to_char(DATETIME, 'HH24');

