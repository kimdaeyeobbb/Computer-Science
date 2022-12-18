|문제번호|난이도|제목|풀이|
|:---:|:---:|:---:|:---:|
|01|![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png)|[상품 별 오프라인 매출 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131533)|[✅](./findTheSaleRaitoOfProducts.sql)|
|02|![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png)|[조건에 맞는 도서와 저자 리스트 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/144854)|[✅](./bookNauthorThatFitTheBill.sql)|
|03|![image](https://user-images.githubusercontent.com/68424403/188287638-ad5798f6-8ba8-455f-936b-c1e6bebab15a.png)|[없어진 기록 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/59042)|X|
|04|![image](https://user-images.githubusercontent.com/68424403/188287644-85b3bd9d-0383-4f4e-929a-c90953835976.png)|[있었는데요 없었습니다](https://school.programmers.co.kr/learn/courses/30/lessons/59043)|X|
|05|![image](https://user-images.githubusercontent.com/68424403/188287646-25e25233-ae57-46aa-8e64-b4f2c21deafc.png)|[오랜 기간 보호한 동물(1)](https://school.programmers.co.kr/learn/courses/30/lessons/59044)|X|
|06|![image](https://user-images.githubusercontent.com/68424403/188277977-db31ab54-7423-4d7f-b7af-eaecb85091be.png)|[보호소에서 중성화한 동물](https://school.programmers.co.kr/learn/courses/30/lessons/59045)|X|


<br><br>

## :ballot_box_with_check: 알아두면 좋은 아이디어

### :bookmark: [문제 - 강원도에 위치한 생산공장 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131112)

#### MySql 특정 조건에 맞는 값 검색하기

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

#### MySQL NULL 처리 - IFNULL

- 기본 꼴

```sql
SELECT IFNULL(칼럼명, "NULL일 경우 대체값") FROM 테이블명;
```

- 예시

```sql
SELECT IFNULL(NAME, "NO NAME") AS NAME FROM HUMAN_INFO
```

<br>

#### MySQL NULL 처리 - CASE

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

#### MySQL NULL 처리 - COALESCE

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

#### MySQL > 기본키와 외래키

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

#### MySQL > JOIN

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



### :bookmark: [문제 - 상품 별 오프라인 매출 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131533)

#### MySQL > SUM & GROUP BY

- [참고자료](https://www.w3resource.com/sql/aggregate-functions/sum-with-group-by.php)
- [참고자료2](https://ciksiti.com/ko/chapters/9730-how-to-use-sum-function-with-group-by-in-mysql)




<br>
<hr>
<br>


### :bookmark: [문제 - 3월에 태어난 여성 회원 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131120)

#### MySQL> NULL을 제외한 값 얻어내

- 기본 꼴

```sql
SELECT [칼럼1] FROM [테이블A] WHERE NOT [컬럼1] IS NULL
```

- 예시

```sql
SELECT 
  MEMBER_ID
FROM 
  MEMBER_PROFILE
WHERE 
  NOT TLNO IS NULL 
```

<br>


#### MySQL> 특정문자 관련 항목 추출

- 기본꼴

```sql
SELECT
  [칼럼]
FROM
  [테이블]
WHERE
  [조건칼럼]
  LIKE [문자관련 조건]
```

- 문자관련 조건
  - `TEXT`: TEXT와 동일한 부분에 대한 선별
  - `%TEXT`: TEXT로 끝나는 항목 선별
  - `TEXT%`: TEXT로 시작하는 항목 선별
  - `%TEXT%`: TEXT를 포함하는 항목 선별
  - `TEXT__`: TEXT로 시작하고 뒤에 두글자가 더 있는 항목 선별
  - `TEXT___`: TEXT로 시작하고 뒤에 세글자가 더 있는 항목 선별
  - `__TEXT`: TEXT로 끝나고 앞에 두글자가 더 있는 항목 선별
  - `___TEXT`: TEXT로 끝나고 앞에 세글자가 더 있는 항목 선별

<br>


#### MySQL> 날짜와 관련된 데이터 추출

##### 1. 연도 추출(YEAR)

```sql
SELECT * FROM [테이블] WHERE YEAR(컬렴명) = "2022"
```

- 예시
```sql
SELECT * FROM MEMBER_INFO WHERE YEAR(DATE_OF_BIRTH) = "2022"
-- MEMBER_INFO 테이블의 DATE_OF_BIRTH의 연도가 2022인 애들만 추출할 것
```


##### 2. 월 추출(MONTH)

```sql
SELECT * FROM [테이블] WHERE MONTH(컬렴명) = "12"
```

- 예시
```sql
SELECT * FROM MEMBER_INFO WHERE YEAR(DATE_OF_BIRTH) = "12"
-- MEMBER_INFO 테이블의 DATE_OF_BIRTH의 월이 12인 애들만 추출할 것
```


##### 3. 일 추출(DAYOFMONTH)

```sql
SELECT * FROM [테이블] WHERE DAYOFMONTH(컬렴명) = "17"
```

- 예시
```sql
SELECT * FROM MEMBER_INFO WHERE YEAR(DATE_OF_BIRTH) = "2022"
-- MEMBER_INFO 테이블의 DATE_OF_BIRTH의 일이 17인 애들만 추출할 것
```

<br>


#### MySQL> 비교 연산자

- 비교 연산자는 피연산자 사이의 상대적인 크기를 판단하여 참이면 1을, 거짓이면 0을 반환함

|비교 연산자|설명|
|:--:|:--|
|=|왼쪽 피연산자와 오른쪽 피연산자가 같으면 참을 반환함|
|!=, <>|왼쪽 피연산자와 오른쪽 피연산자가 같지 않으면 참을 반환함|
|<=>|양쪽의 피연산자가 모두 NULL이면 참을 반환하고, 하나의 피연산자만 NULL이면 거짓을 반환함|
|IS|왼쪽 피연산자와 오른쪽 피연산자가 같으면 참을 반환함. (오른쪽 피연산자가 불리언 값인 TRUE, FALSE, UNKNOWN 값일 때 사용함|
|IS NOT|왼쪽 피연산자와 오른쪽 피연산자가 같지 않으면 참을 반환함. (오른쪽 피연산자가 불리언 값인 TRUE, FALSE, UNKNOWN 값일 때 사용함)|
|IS NULL|피연산자의 값이 NULL이면 참을 반환함|
|IS NOT NULL|피연산자의 값이 NULL이 아니면 참을 반환함|
|BETWEEN min AND max|피연산자의 값이 min 값보다 크거나 같고, max 값보다 작거나 같으면 참을 반환함|
|NOT BETWEEN min AND max|피연산자의 값이 min 값보다 작거나 max보다 크면 참을 반환함|
|IN()|피연산자의 값이 인수로 전달받은 리스트에 존재하면 참을 반환함|
|NOT IN()|피연산자의 값이 인수로 전달받은 리스트에 존재하지 않으면 참을 반환함|



<br>
<hr>
<br>





### :bookmark: [문제 - 조건에 맞는 도서와 저자 리스트 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/144854)

#### MySQL> JOIN

- JOIN을 이용하면 DB내 여러 테이블에서 가져온 레코드를 조합하여 하나의 테이블이나 결과 집합으로 표현할 수 있다.

- JOIN은 보통 SELECT문과 사용되며, 레코드를 조합하는 방식에 따라 구분할 수 있다.

<br>

##### :one: INNER JOIN

![image](https://user-images.githubusercontent.com/68424403/208283876-a949ce9d-3416-446e-a698-fa8ed329ae04.png)



- 기본꼴 (INNER JOIN 대신 JOIN이라고 써도 동일함)
  - INNER JOIN은 ON절의 조건을 만족하는 데이터만 가져옴
  - ON절에서는 WHERE 절에서 사용할 수 있는 모든 조건을 사용할 수 있음
  - MySQL에서는 JOIN, INNER JOIN, CROSS JOIN 모두가 같은 의미로 사용된다
  
```sql
SELECT * 
FROM [첫번째 테이블]
  INNER JOIN [두번째 테이블]
  ON [조건]
```


- 예시
  - 다음예제는 BOOK 테이블의 AUTHOR_ID 필드와 AUTHOR 테이블의 AUTHOR_ID 필드가 서로 일치하는 레코드만을 INNER JOIN으로 가져오는 예시임
  
```sql
SELECT 
  BOOK_ID,
  AUTHOR_NAME,
  DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK
  JOIN AUTHOR
  ON BOOK.AUTHOR_ID = AUTHOR.AUTHOR_ID
WHERE CATEGORY = '경제'
```

<br>



##### :two: LEFT JOIN

![image](https://user-images.githubusercontent.com/68424403/208283871-0d8385e1-9d3a-4e44-86e6-2e3c67da113b.png)




- 기본꼴
  - LEFT JOIN은 첫 번째 테이블을 기준으로, 두 번째 테이블을 조합하는 JOIN임
  - ON 절의 조건을 만족하지 않는 경우에는 첫 번째 테이블의 필드값은 그대로 가져옴
  - 하지만 해당 레코드의 두 번째 테이블의 필드 값은 모두 NULL로됨표시됨
  
```sql
SELECT * 
FROM [첫번째 테이블]
  LEFT JOIN [두번째 테이블]
  ON [조건]
```


- 예시
  - 다음예제는 RESERVATION 테이블의 NAME 필드를 기준으로 CUSTOMER 테이블의 NAME 필드와 일치하는 레코드만을 LEFT JOIN으로 가져온 후, 그 중에서 RESERVEDATE 필드의 값이 2022년 05월 04일 이후인 레코드만을 선택하는 예시임
  - 두 개의 NAME값이 일치한다면 INNER JOIN과 같이 두 테이블의 모든 필드를 가져오지만, 일치하지 않는 경우에는 CUSTOMER 테이블의 모든 필드를 NULL로 표시함
  
```sql
SELECT *
FROM RESERVATION
  LEFT JOIN CUSTOMER
  ON RESERVATION.NAME = CUSTOMER.NAME
WHERE RESERVEDATE > '2022-05-04';
```

<br>




##### :three: RIGHT JOIN

![image](https://user-images.githubusercontent.com/68424403/208283864-9bbac954-b95a-474d-8df4-074c5bf66212.png)




- 기본꼴
  - 두 번째 테이블을 기준으로, 첫 번째 테이블을 조합하는 JOIN임
  - ON 절의 조건을 만족하지 않는 경우에는 두 번째 테이블의 필드 값은 그대로 가져옴
  - 하지만 해당 레코드의 첫 번째 테이블의 필드 값은 모두 NULL로 표시됨
  
```sql
SELECT * 
FROM [첫번째 테이블]
  RIGHT JOIN [두번째 테이블]
  ON [조건]
```


- 예시
  - 다음예제는 CUSTOMER 테이블의 NAME 필드를 기준으로 RESERVATION 테이블의 NAME 필드와 일치하는 레코드만을 RIGHT JOIN으로 가져오는 예시임
  - 두 개의 NAME 값이 일치한다면, INNER JOIN과 같이 두 테이블의 모든 필드를 그대로 가져온다.
  - 하지만 두 개의 NAME 값이 일치하지 않는 경우에는 RESERVATION 테이블의 모든 필드를 NULL로 표시함
  
  
```sql
SELECT *
FROM RESERVATION
  RIGHT JOIN CUSTOMER
  ON RESERVATION.NAME = CUSTOMER.NAME
```

<br>





