USE market_db;
-- USE: DB 선택 지정 (SELECT 문을 실행하기 위해 DB를 지정해야 함) -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 

CREATE TABLE charEx1   -- 문자형 비교용 회원 테이블
(
mem_id CHAR(8) NOT NULL PRIMARY KEY,   -- 회원 아이디(PK) & CHAR: 불변 길이
mem_name VARCHAR(10) NOT NULL,   -- 이름 & VARCHAR: 가변 길이
mem_number TINYINT NOT NULL,   -- 인원수
addr CHAR(2) NOT NULL,   -- 주소(서울, 경기, 경남 식으로 2글자만 입력) 
phone1 CHAR(3),   -- 연락처의 국번(02,031,051 등) & 데이터 타입을 정수형으로 지정시 0으로 시작하면 0이 사라지므로 CHAR로 설정
phone2 CHAR(8),   -- 연락처의 나머지 전화 번호 (하이픈 제외)
height TINYINT UNSIGNED,   -- 평균 키
debut_date DATE    -- 데뷔 일자
);

CREATE DATABASE netflix_db;   -- CREATE DATABASE: 새로운 SQL DB 생성
USE netflix_db;-- USE: DB 선택 지정 (SELECT 문을 실행하기 위해 DB를 지정해야 함) -> 지금부터 이 DB를 사용할것이므로 모든 쿼리는 이 DB에서 실행하라는 뜻 

CREATE TABLE movie
(
	movie_id INT,
    moive_title VARCHAR(30),
    movie_director VARCHAR(20),
    movie_star VARCHAR(20),
    movie_script LONGTEXT,   -- LONGTEXT: 대량의 텍스트 (최대 4GB까지 입력가능)
    movie_film LONGBLOB   -- LONGBLOB: 대량의 이진 데이터 (최대 4GB까지 입력가능)
);