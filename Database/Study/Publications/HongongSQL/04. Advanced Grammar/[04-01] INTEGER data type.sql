USE market_db;
-- USE: DB 선택 지정 (SELECT 문을 실행하기 위해 DB를 지정해야 함) -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 

CREATE TABLE integerEx1(
	mem_id CHAR(8) NOT NULL PRIMARY KEY,   -- 회원 아이디(PK)
    mem_name VARCHAR(10) NOT NULL,   -- 이름
    mem_number INT NOT NULL,   -- 인원수  (INT 바이트 수: 4 & 범위: -21억 ~ +21억)
    addr CHAR(2) NOT NULL,   -- 주소(경기, 서울, 경남 식으로 2글자만 입력)
    phone1 CHAR(3),   -- 연락처의 국번(02, 031, 055 등)
    phone2 CHAR(8),   -- 연락처의 나머지 전화번호(하이픈 제외)
    height SMALLINT,   -- 평균 키 (SMALLINT 바이트 수: 2 & 범위: -32768 ~ +32768)
    debut_date DATE   -- 데뷔 일자
);

-- 상위의 회원테이블보다 더 효율적인 테이블 구성
CREATE TABLE integerEx2(
	mem_id CHAR(8) NOT NULL PRIMARY KEY,   -- 회원 아이디(PK)
    mem_name VARCHAR(10) NOT NULL,   -- 이름
    mem_number TINYINT NOT NULL,   -- 인원수 (범위: -128 ~ +128)
	addr CHAR(2) NOT NULL,   -- 주소(서울, 경기, 경남 식으로 2글자만 입력)
    phone1 CHAR(3),   -- 연락처의 국번 (02, 031, 055 등)
    phone2 CHAR(8),   -- 연락처의 나머지 전화번호 (하이픈 제외)
    height TINYINT UNSIGNED,   -- 평균 키 (UNSIGNED를 붙여서 범위를  -128 ~ +128에서 0 ~ +255로 변경)
	debut_date DATE   -- 데뷔 일자
);

SELECT * FROM integerEx1;
SELECT * FROM integerEx2;