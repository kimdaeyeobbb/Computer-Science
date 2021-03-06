# 정보처리기사 기출문제 풀이

## 2022.03.05 시험

<br>

1-1. User Interface 설계시 오류 메시지나 경고에 관한 지침으로 거리가 먼것
- 소리나 색의 사용을 줄이고 텍스트로만 전달하도록 한다.

<br>

1-2. User Interface 설계시 오류 메시지나 경고에 관한 지침
|UI 설계 지침|설명|
|:---:|:---:|
|사용자 중심|사용자가 이해하기 쉽고 편하게 사용할 수 있는 환경을 제공하여 실사용자에 대한 이해가 바탕이 되어야 함|
|일관성|버튼이나 조작 방법을 사용자가 기억하기 빠르고 쉽게 습득할 수 있도록 설계해야 함|
|단순성|조작 방법은 가장 간단하게 작동되도록 하여 인지적 부담 최소화|
|결과 예측 가능|작동시킬 기능만 보고도 결과 예측이 가능해야 함|
|가시성|주요 기능을 메인 화면에 노출하여 쉬운 조작이 가능해야 함|
|표준화|디자인을 표준화하여 기능 구조의 선행 학습 이후 쉽게 사용 가능해야 함|
|접근성|사용자의 직무, 연봉, 성별 등이 고려된 다양한 계층을 수용해야 함|
|명확성|사용자가 개념적으로 쉽게 인지해야 함|
|오류 발생 해결|사용자가 오류에 대한 상황을 정확하게 인지할 수 있어야 함|

<br>

2-1. 다음 중 에자일(Agile) S/W 개발에 대한 설명으로 틀린 것은?

- 동작하는 S/W 보다는 포괄적인 문서를 가치 있게 여긴다

<br>

2-2. 에자일 S/W 

- 에자일 방법론의 특징
  * 공정과 도구보다 개인과의 상호작용을 더 가치 있게 여긴다
  * 계약 협상보다는 고객과의 협력을 가치 있게 여긴다
  * 계획을 따르기보다 변화에 대응하기를 가치 있게 여긴다
  * 프로젝트의 요구사항은 기능 중심으로 정의한다
  * 절차와 도구보다 개인과의 소통을 중요하게 생각한다
  * 작업 계획을 짧게 세워 요구 변화에 유연하고 신속하게 대응할 수 있다
  * S/W가 잘 실행되는데 가치를 둔다
  * 고객과의 피드백을 중요하게 생각한다
  
<br>

3-1. S/W 설계에서 요구사항 분석에 대한 설명으로 틀린 것?

- S/W 시스템이 사용되는 동안 발견되는 오류를 정리하는 단계이다

<br>

3-2. S/W 설계에서 요구사항 분석에 대한 설명으로 옳은 것

- S/W가 무엇을 해야하는가를 추적하여 요구사항 명세(물품이나 금액 따위의 분명하고 자세한 내용)를 작성하는 작업

- 사용자의 요구를 추출하여 목표를 정하고 어떤 방식으로 해결할 것인지 결정하는 단계

- S/W 개발의 출발점이면서 실질적인 첫 번째 단계


<br>



4-1. 객체지향 기법에서 상위 클래스의 메서드와 속성을 하위 클래스가 물려받는 것을 의미하는 것은?

- Inheritance

- 객체지향 구성요소

|구성요소|설명|
|:--:|:--|
|클래스<br>(Class)|객체지향 프로그램에서 데이터를 추상화하는 단위<br>하나 이상의 유사한 객체들을 묶어서 하나의 공통된 특성을 표현<br>속성은 변수의 형태로, 행위는 메서드 형태로 선언|
|객체<br>(Object)|객체의 행위는 클래스에 정의된 행위에 대한 정의를 공유함으로써 메모리를 경제적으로 사용<br>객체마다 각각의 상태와 식별성을 가짐|
|메서드(Method)|클래스로부터 생성된 객체를 사용하는 방법<br>객체가 메시지를 받아 실행해야 할 객체의 구체적인 연산<br>전통적 시스템의 함수(Function) 또는 프로시저 (Procedure)에 해당하는 연산 가능|
|메시지<br>(Message)|객체간의 상호작용을 하기 위한 수단<br>객체 간의 상호작용은 메시지를 통해 이루어짐<br>메시지는 객체에서 객체로 전달됨|
|인스턴스<br>(Instance)|객체지향 기법에서 클래스에 속한 각각의 객체<br>실제로 메모리상에 할당|
|속성<br>(Property)|한 클래스 내에 속한 객체들이 가지고 있는 데이터 값들을 단위별로 정의<br>성질, 분류, 식별, 수량, 현재 상태 등에 대한 표현 값|

<br>

- 객체지향 기법

|기법|설명|
|:--:|:--|
|캡슐화<br>(Encapsulation)|서로 관련성이 많은 데이터와 이와 관련된 함수들을 한 묶음으로 처리하는 기법<br>결합도가 낮아지고 재사용이 용이<br>인터페이스가 단순화 됨<br>정보은닉과 관계가 깊음<br>변경 발생 시 오류의 파급 효과가 적음|
|상속성<br>(Inheritance)|상위 클래스의 속성과 메서드를 하위 클래스에서 재정의 없이 물려받아 사용하는 기법|
|다형성<br>(Polymorphism)|하나의 메시지에 대해 각 객체가 가지고 있는 고유한 방법으로 응답할 수 있는 능력<br>오버로딩, 오버라이딩이 대표적|
|추상화<br>(Abstraction)|공통 성질을 추출하여 추상 클래스를 설정하는 기법<br>기능 추상화, 자료 추상화, 제어 추상화|
|정보은닉<br>(Information Hiding)|코드 내부 데이터와 메서드를 숨기고 공개 인터페이스를 통해서만 접근이 가능하도록 하는 코드 보안 기술<br>고려되지 않은 영향(Side-Effect)들을 최소화하기 위하여 사용|
|관계성<br>(Relationship)|두개 이상의 엔터티 형에서 데이터를 참조하는 관계를 나타내는 기법<br>|




<br><br><br><br>

 
