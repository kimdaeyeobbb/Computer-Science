SELECT PT_NAME, PT_NO, GEND_CD, AGE, COALESCE(TLNO, "NONE") -- NULL 값인 것은 NONE으로 반환
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'   -- 나이: 12세 이하 & 성별: 여자
ORDER BY AGE DESC, PT_NAME ASC -- 나이기준 내림차순, 같다면 환자명기준 오름차순