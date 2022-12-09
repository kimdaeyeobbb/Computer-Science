| 문제번호 |                                                     난이도                                                      |                                                제목                                                 |                                                                   풀이                                                                   |
| :------: | :-------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------------: |
|    01    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |    [이름이 없는 동물의 아이디](https://school.programmers.co.kr/learn/courses/30/lessons/59039)     | [✅](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/IS%20NULL/unnamed%20animals%20id.sql) |
|    02    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |    [이름이 있는 동물의 아이디](https://school.programmers.co.kr/learn/courses/30/lessons/59407)     |  [✅](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/IS%20NULL/named%20animals%20id.sql)  |
|    03    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) | [나이 정보가 없는 회원 수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131528) |                                                  [O](./findMemberWhoHaveNoAgeInfo.sql)                                                   |
|    04    | ![image](https://user-images.githubusercontent.com/68424403/188271247-115b904d-2f51-4791-8f3e-af4bfe5a872c.png) |          [NULL 처리하기](https://school.programmers.co.kr/learn/courses/30/lessons/59410)           |    [✅](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/IS%20NULL/handling%20null.sql)     |

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

### :bookmark: [문제 - 나이 정보가 없는 회원 수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131528)

#### MySQL> NULL 개수 구하기

- 기본 꼴

```sql
(COUNT(*)-COUNT(칼럼명))  -- COUNT(*): NULL 포함, COUNT(컬럼명): NULL 미포함
```

- 예시

```sql
SELECT (COUNT(*)-COUNT(AGE)) AS USERS FROM USER_INFO

```

<br>
