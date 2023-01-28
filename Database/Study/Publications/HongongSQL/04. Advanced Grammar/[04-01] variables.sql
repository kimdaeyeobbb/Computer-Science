USE market_db;   
-- USE: (SELECT문을 실행하기 위해) DB 선택 지정 -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 

-- 변수: MySQL Workbench를 재시작할때까지만 유지되고 종료하면 사라짐. (변수는 임시로 사용하는 것이다!)
SET @Var1 = 5;   -- 변수 선언 & 정수 값 대입
SET @Var2 = 3.14;   -- 변수 선언 & 실수 값 대입alter

SELECT @Var1;   -- 변수의 내용 출력
SELECT @Var1+@Var2;   -- 변수끼리 연산한 다음 출력

SET @txt = '가수 이름 ==> ';   -- 변수 선언 & 문자열 대입
SET @height = 166;   -- 변수 선언 & 정수 대입

SELECT @txt, mem_name FROM member WHERE height > @height;  -- 변수를 활용하여 테이블 조회


SET @count = 3;   -- 변수 선언 및 초기화
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';   
-- PREPARE 는 'SELECT ~ LIMIT ?'문을 실행하지 않고 mySQL이라는 이름으로 준비만 해놓음
-- LIMIT ? : 현재는 모르지만 나중에 채워진다는 의미이다
-- LIMIT은 변수에 사용할 수 없으나 PREPARE과 EXECUTE를 LIMIT과 함께 사용하면 정상적으로 사용이 가능하다
EXECUTE mySQL USING @count;   
-- mySQL에 저장된 SELECT 문을 실행할 때, USING이 물음표(?)에 변수 @count의 값을 대입하는 것이다

-- 상위의 SQL문은 SELECT mem_name, height FROM member ORDER BY height LIMIT 3; 과 동일한 SQL문이 실행되는것이다