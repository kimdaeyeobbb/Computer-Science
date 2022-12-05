| 문제번호 |                                                     난이도                                                      |                                                    제목                                                    |                                                                      풀이                                                                       |
| :------: | :-------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------: |
|    01    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |              [모든 레코드 조회하기](https://programmers.co.kr/learn/courses/30/lessons/59034)              |   [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/inquire%20all%20the%20records.sql)   |
|    02    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |                 [역순 정렬하기](https://programmers.co.kr/learn/courses/30/lessons/59035)                  |         [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/reverse%20sorting.sql)         |
|    03    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |                 [아픈 동물찾기](https://programmers.co.kr/learn/courses/30/lessons/59036)                  |       [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/find%20sick%20animal.sql)        |
|    04    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |                 [어린 동물찾기](https://programmers.co.kr/learn/courses/30/lessons/59037)                  |       [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/find%20young%20animal.sql)       |
|    05    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |              [동물의 아이디와 이름](https://programmers.co.kr/learn/courses/30/lessons/59403)              |         [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/animal%20idNname.sql)          |
|    06    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |             [여러 기준으로 정렬하기](https://programmers.co.kr/learn/courses/30/lessons/59404)             | [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/sorting%20by%20various%20criteria.sql) |
|    07    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |                [상위 n개 레코드](https://programmers.co.kr/learn/courses/30/lessons/59405)                 |         [O](https://github.com/kimdaeyeobbb/Computer-Science/blob/main/Database/Coding%20Test/Programmers/SELECT/Top%20N%20record.sql)          |
|    08    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) | [강원도에 위치한 생산공장 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131112) |                                                    [O](./manufacturingFactoryInGangwon.sql)                                                     |
|    09    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |       [조건에 맞는 회원수 구하기](https://school.programmers.co.kr/learn/courses/30/lessons/131535)        |                                                       [O](./conditionSatisfiedMember.sql)                                                       |
|    10    | ![image](https://user-images.githubusercontent.com/68424403/176992717-e1a57e02-8e8e-4f82-9ec8-27fff35dc4f7.png) |       [인기있는 아이스크림](https://school.programmers.co.kr/learn/courses/30/lessons/133024)        |                                                       [O](./popularIcecream.sql)|

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

```
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS Like"%강원도%"   -- ADDRESS 칼럼에서 '강원도'를 포함하는 항목 선별
ORDER BY FACTORY_ID ASC;
```

<hr>
<br>

##
