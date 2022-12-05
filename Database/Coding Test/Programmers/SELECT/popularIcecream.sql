SELECT FLAVOR FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC
-- 다중정렬
-- SELECT * FROM TABLE ORDER BY 필드1 [정렬조건-내림/오름], 필드2 [정렬조건], ... , 필드 n [정렬조건]
-- TOTAL_ORDER 기준 내림차순 정렬 & TOTAL_ORDER가 같다면 SHIPMENT_ID 기준 오름차순 정렬