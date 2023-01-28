# MySQL Basic Grammar

## 0. SELECT 문

- 역할: 구축이 완료된 테이블에서 데이터를 추출 (DB의 테이블을 조회한 결과를 보여줌) 
- 기본 형식: SELECT ~ FROM ~ WHERE


## 1. 데이터 조작 

### 데이터 입력

#### INSERT<br>
테이블에 데이터를 삽입하는 명령<bR>
ex) 새로 가입한 회원을 테이블에 기입<BR>
  
* 기본 꼴
```mysql
INSERT INTO 테이블 [(열1, 열2, ...)] VALUES (값1, 값2, ...)
```
  
* 예시1
```MYSQL
INSERT INTO ex1 (doll_id, doll_name) VALUES (2, '체리');
```
  
* 예시2
```mysql
USE market_db;
CREATE TABLE ex2 (doll_id INT, doll_name CHAR(4), age INT));
INSERT INTO ex2 VALUES(1, '네티', 16);
```
  
* 예시3
```MYSQL
INSERT INTO ex3 (doll_name, age, doll_id) VALUES ('제리', 11, 3);  
```  
 
  
#### INSERT INTO ~ SELECT
데이터가 입력되어있는 다른 테이블의 데이터를 한 번에 입력하는 구문이다.<BR>
이를 이용해서 워하는 테이블내 데이터를 가져와서 한 번에 입력할 수 있다.
  
* 기본 꼴 
```MYSQL
INSERT INTO 테이블_이름 (열_이름1, 열_이름2, ...)
  SELECT 문;
```
<STRONG>주의) SELECT문의 열 개수 = INSERT할 테이블의 열 개수</STRONG>여야 함<BR>

* 예시1
```SQL
INSERT INTO city_population
  SELECT Name, Population FROM world.city;
  ```
  
  
  
  
<br>
  
### 데이터 수정   
#### UPDATE<br>
테이블 내 데이터를 수정<br>
ex) 회원 주소/연락처 등이 변경되어 정보를 수정<br>
  * 기본 꼴
```mysql
UPDATE 테이블_이름
  SET 열1=값1, 열2=값2 ...
  WHERE 조건;
```
* 예시1
```MYSQL
 USE market_db;
 UPDATE city_population
   SET city_name = '서울'
   WHERE city_name = 'Seoul';
 SELECT * FROM city_population WHERE city_name = '서울';
```
  
  
  
  
  
  
<br>  
  
  
  
### 데이터 삭제  
#### DELETE<br>
테이블의 행 데이터를 삭제할 경우에 사용<br>
ex) 회원탈퇴로 인해 회원을 삭제<br>
  
* 기본 꼴
```mysql
DELETE FROM 테이블이름 WHERE 조건;
```
  
* 예시1
```MYSQL
DELETE FROM city_population
  WHERE city_name LIKE 'New%';   -- 도시이름에 New가 들어가는 도시 삭제
  LIMIT 5;   -- 도시이름에 New가 들어가는 도시 중 상위 5건만 삭제
```

