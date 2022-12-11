|문제번호|난이도|제목|풀이|
|:---:|:---:|:---:|:---:|
|01|![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png)|[진료과별 총 예약 횟수 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/132202)|[✅](./PatientsClassifiedByMedicalDepartment.sql)|
|02|![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png)|[고양이와 개는 몇 마리 있을까](https://school.programmers.co.kr/learn/courses/30/lessons/59040)|[✅](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/GROUP%20BY/how%20many%20cats%20N%20dogs.sql)|
|03|![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png)|[동명 동물 수 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59041)|[✅](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/GROUP%20BY/find%20samename.sql)|
|04|![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png)|[입양 시각 구하기(1)](https://school.programmers.co.kr/learn/courses/30/lessons/59412)|[✅](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/GROUP%20BY/time%20at%20adoption.sql)|
|05|![image](https://user-images.githubusercontent.com/68424403/188277977-db31ab54-7423-4d7f-b7af-eaecb85091be.png)|[입양 시각 구하기(2)](https://school.programmers.co.kr/learn/courses/30/lessons/59413)|X|




<br><br>

## :ballot_box_with_check: 알아두면 좋은 아이디어

### :bookmark: [문제 - 강원도에 위치한 생산공장 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131112)

#### MySql> 특정 조건에 맞는 값 검색하기

- 기본 꼴

```sql
SELECT [컬럼명]
FROM [테이블명]
WHERE [조건 적용시킬 컬럼명]
Like [해당 조건]

-- [해당 조건] 에 삽입할 수 있는 것
-- 'Text': Text와 동일한 부분에 대한 선별
-- '%Text': Text로 끝나는 항목 선별
-- 'Text%': Text로 시작하는 항목 선별
-- '%Text%': Text를 포함하는 항목 선별

-- 'Text__': Text로 시작하며 뒤에 두 글자가 더 있는 항목 선별
-- 'Text___': Text로 시작하며 뒤에 세 글자가 더 있는 항목 선별
-- '__Text': Text로 끝나고 앞에 두 글자가 더 있는 항목 선별
-- '___Text': Text로 끝나고 앞에 세 글자가 더 있는 항목 선별
```

- 예시

```sql
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS Like"%강원도%"   -- ADDRESS 칼럼에서 '강원도'를 포함하는 항목 선별
ORDER BY FACTORY_ID ASC;
```

<br>
<hr>
<br>

### :bookmark: [문제 - 인기있는 아이스크림](https://school.programmers.co.kr/learn/courses/30/lessons/133024)

#### 다중정렬

- 기본 꼴

```sql
SELECT [컬럼명]
FROM [테이블명]
ORDER BY [칼럼1] [정렬조건1 (오름차순/내림차순], [칼럼2] [정렬조건2], ... , [칼럼n] [정렬조건n]
```

- 예시

```sql
SELECT FLAVOR FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC   -- TOTAL_ORDER 기준 내림차순 정렬, TOTAL_ORDER가 같다면 SHIPMENT_ID 기준 오름차순 정렬
```

<br>
<hr>
<br>

### :bookmark: [문제 - 12세 이하인 여자 환자 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/132201)

#### MySQL> NULL 처리 - IFNULL

- 기본 꼴

```sql
SELECT IFNULL(칼럼명, "NULL일 경우 대체값") FROM 테이블명;
```

- 예시

```sql
SELECT IFNULL(NAME, "NO NAME") AS NAME FROM HUMAN_INFO
```

<br>

#### MySQL> NULL 처리 - CASE

- 기본 꼴

```sql
SELECT
  CASE
    WHEN 조건식1 THEN 식1
    WHEN 조건식2 THEN 식2
    ...
    ELSE 조건에 맞는 것이 없는 경우 실행할 식
  END AS [별칭]
FROM [테이블명]
```

- 예시

```sql
SELECT PT_NAME, PT_NO, GEND_CD, AGE,
    CASE
        WHEN TLNO IS NULL THEN "NONE"   -- 전화번호가 없는 경우 'NONE'으로 출력
        ELSE TLNO
    END AS TLNO
FROM PATIENT
```

<br>

#### MySQL> NULL 처리 - COALESCE

- 기본 꼴

```sql
SELECT COALESCE(칼럼1, 칼럼1이 NULL일 경우 대체할 값) FROM [테이블명]
```

- 예시

```sql
SELECT PT_NAME, PT_NO, GEND_CD, AGE, COALESCE(TLNO, "NONE") -- NULL 값인 것은 NONE으로 반환
FROM PATIENT
```

<br>
<hr>
<br>

### :bookmark: [문제 - 과일로 만든 아이스크림 고르기](https://school.programmers.co.kr/learn/courses/30/lessons/133025)

#### MySQL> 기본키와 외래키

##### 기본키

- 데이터를 구분할 수 있는 식별자
- 기본키에 입력되는 값은 중복될 수 없음 (회원 아이디는 중복되지 않음)
- 기본키에는 NULL값이 입력될 수 없음 (회원 이이디 없이 회원가입을 할 수 없음)
- 테이블은 기본 키를 1개만 가질 수 있음

- EX) 회원 테이블의 아이디, 학생 테이블의 학번, 직원 테이블의 사번

##### 외래키

- 외래 키의 제약조건
  - 두 테이블 사이의 관계를 연결해주고, 그 결과 데이터의 무결성을 보장해줌
  - 외래키가 설정된 열은 반드시 다른 테이블의 기본 키와 연결됨
  - 기본 키가 있는 테이블은 `기준 테이블`, 외래 키가 있는 테이블은 `참조 테이블`이라 함
  - 참조 테이블이 참조하는 기준 테이블의 열은 반드시 `기본 키` 혹은 `고유 키`로 설정되어 있어야 함

<br>

#### MySQL> JOIN

- 두개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것

##### INNER JOIN

- 두 테이블을 연결할 때, 두 테이블 모두에서 지정한 열의 데이터가 존재해야 함
- 두 테이블을 연결할 때 가장 많이 사용되는 것이며, 보통 `조인`이라 하면 내부 조인을 의미하는 것으로 봐도 좋다. (따라서 `INNER JOIN`을 `JOIN`이라고만 써도 `INNER JOIN`으로 인식함)

- 기본 꼴

```sql
SELECT [열 목록]
FROM [첫 번째 테이블]
  INNER JOIN [두 번째 테이블]
  ON [조인될 조건]
[WHERE 검색 조건]
```

<br>
<hr>
<br>


### :bookmark: [문제 - 진료과별 총 예약 횟수 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/132202)

#### MySql> 일자 조건별 검색

##### 날짜 완전 일치

- `=`연산자는 조건과 완전히 일치하는 결과를 추출함
- 하단의 예시는 `2022-12-11 17:15:00` 데이터와 동일한 데이터를 추출하는 쿼리임

###### 예시

```sql
SELECT * 
FROM APPOINT 
WHERE DATE = '2022-12-11 17:15:00'; 
```

##### 날짜만 지정해서 검색하기

- 날짜만 지정해서 검색을 하고 싶은 경우에는 `DATE_FORMAT`을 사용해서 데이터 값 형태를 동일하게 변환해서 검색을 할 것

```sql
SELECT * 
FROM APPOINT
WHERE DATE_FORMAT(DATE, '%Y-%m-%d') = DATE_FORMAT('2022-12-11', '%Y-%m-%d')  -- YYYY/mm/dd 포맷
```


##### 과거 일자 검색

- 지정한 일자보다 과거의 날짜 데이터를 검색하고 싶은 경우에는 `<`를 이용한다.

```sql
SELECT *
FROM APPOINT
WHERE DATE < '2022-12-11 17:15:00'
```

##### 미래 일자 검색

- 지정한 일자보다 미래의 날짜 데이터를 검색하고 싶은 경우 `>`를 이용한다.

```sql
SELECT * 
FROM APPOINT
WHERE DATE > '2022-12-11 17:15:00'
```

##### 날짜 범위 지정

- `BETWEEN`을 사용해서 날짜 범위를 지정한 다음 검색할 수 있다
  - 지정한 범위에 포함되는 데이터는 모두 출력된다.

```sql
SELECT * 
FROM APPOINT
WHERE DATE '2022-12-01 00:00:00' AND 2022-12-31 23:59:59'
```


##### 날짜 범위에 해당하지 않는 데이터 검색

- `NOT BETWEEN`을 사용해서 날짜 범위에 해당하지 않는 데이터를 검색할 수 있다

```sql
SELECT * 
FROM APPOINT
WHERE DATE NOT BETWEEN '2022-11-01 00:00:00' AND '2022-12-05 23:59:59'
```



<br>
<hr>
<br>


