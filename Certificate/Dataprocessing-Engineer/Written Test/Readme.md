# 정보처리기사 내용정리


- UI (User Interface, 사용자 인터페이스) <br>
  
  [넓은 의미] 사용자와 시스템 사이에서 의사소통할 수 있도록 고안된 물리적, 가상의 매개체<br>
  [좁은 의미] 정보 기기나 S/W 화면 등에서 사람이 접하게 되는 화면<br>
  
  <br>
  
- UX (User eXperience, 사용자 경험)<br>

  제품과 시스템, 서비스 등을 사용자가 직/간접적으로 경험하면서 느끼고 생각하는 총체적 경험<br>
  
<br>  
  
- UI 유형<br>

  |유형|특징|설명|
  |:---:|:---:|:---:|
  |CLI<br> (Command Line Interface)|정적인 텍스트 기반 인터페이스|명령어를 텍스트로 입력하여 조작하는 사용자 인터페이스|
  |GUI<br> (Graphical User Interface)|그래픽 반응 기반 인터페이스|그래픽 환경을 기반으로 한 마우스나 전자펜을 이용하는 사용자 인터페이스|
  |NUI<br> (Natural User Interface)|직관적 사용자 반응 기반 인터페이스|사용자가 가진 경험을 기반으로 키보드나 마우스 없이 신체 부위를 이용하는 사용자 인터페이스(터치,음성포함)|
  |OUI<br> (Organic User Interface)|유기적 상호작용 기반 인터페이스|입력장치가 곧 출력장치가 되고, 현실에 존재하는 모든 사물이 입출력장치로 변화할 수 있는 사용자 인터페이스|
  
  <br>
  
  
  
- UI 분야<br>
  
  |분야|설명|
  |:---:|:---:|
  |물리적 제어 분야|정보 제공과 기능 전달을 위한 하드웨어 기반|
  |디자인적 분야|콘텐츠의 정확하고 상세한 표현과 전체적 구성|
  |기능적 분야|사용자의 편의성에 맞춰 쉽고 간편하게 사용 가능|
  
  <br>
  
- UI 설계 원칙<br>

  |설계 원칙|설명|부특성|
  |:---:|:---:|:---:|
  |직관성<br> (Intuitiveness)|누구나 쉽게 이해하고, 쉽게 사용할 수 있어야 함|쉬운 검색<br> 쉬운 사용성<br> 일관성|
  |유효성<br> (Efficiency)|정확하고 완벽하게 사용자의 목표가 달성될 수 있도록 제작|쉬운 오류처리 및 복구| 
  |학습성<br> (Learnability)|초보와 숙련자 모두가 쉽게 배우고 사용할 수 있게 제작|쉽게 학습<br>쉬운 접근<br>쉽게 기억|
  |유연성<br> (Flexibility)|사용자의 인터랙션을 최대한 포용하고, 실수를 방지할 수 있도록 제작|오류 예방<br>실수 포용<br>오류 감지|
  
 <br>
 
 
- <b>요구분석 기법</b><br>

  + 요구분석(Recuirements Analysis)의 개념<br>

    * 요구분석은 도출된 요구사항 간 상충을 해결하고 S/W 범위를 파악하여 외부 환경과의 상호작용을 분석하는 과정이다.<br>
    * 요구분석은 개발 대상에 대한 사용자의 요구사항 중 명확하지 않거나 모호하여 이해되지 않는 부분을 발견하고 이를 걸러내기 위한 과정이다.<br>

  + 요구분석의 특징<br>

    * 분석 결과의 문서화를 통해 향후 유지보수에 유용하게 활용할 수 있다<br>
    * 보다 구체적인 명세를 위해 소단위 명세서가 활용될 수 있다<br>
    * 개발 비용이 가장 많이 소요되는 단계이다<br>

  + 요구분석 기법<br>
    * 요구사항 분석을 통해 요구사항을 기술할 때에는 요구사항의 확인(Validation), 요구사항 구현의 검증(Verification), 비용 추정이 가능하도록 충분하고 정확하게 기술해야 함<br>
    * 요구사항 분석 단계 절차 <BR>
    
    |순서|절차|설명|
    |:--:|:--:|:--|
    |1|요구사항 분류|요구사항이 기능인지 비 기능인지 확인<br>요구사항이 S/W에 미치는 영향의 범위를 파악<br>요구사항이 S/W 생명주기 동안 변경이 발생하는지를 확인<br>하나 이상의 상위 요구사항에서 유도된 것인지 또는 이해관계자나 다른 원천으로부터 직접 발생한 것인지 분류|
    |2|개념 모델링 생성 및 분석|요구사항을 더 쉽게 이해할 수 있도록 현실 세계의 상황을 단순화, 개념적으로 표현한 것을 모델이라고 하며, 모델링은 이러한 모델을 만드는 과정<br> 객체 모델(Object Model), 데이터 모델(Data Model), 유스케이스 다이어그램(Use Case Diagram), 데이터 흐름 모델(Data Flow Model), 상태 모델(State Model), 목표기반 모델(Goal-Based Model), 사용자 인터렉션(User Interactions) 등 다양한 개념 모델 작성 가능<br> 모델링 표기는 주로 UML을 사용|
    |3|요구사항 할당|요구사항을 만족시키기 위한 아키텍처 구성요소를 식별하는 활동<br> 다른 구성요소와 어떻게 상호작용하는지 분석을 통해 추가적인 요구사항을 발견 가능|
    |4|요구사항 협상|두 명의 이해관계자가 서로 상충되는 내용을 요구하는 경우, 어느 한 쪽을 지지하기보다는 적절한 시점에서 합의하기 위한 기법<br>요구사항이 서로 충돌되는 경우 각각 우선순위를 부여하면 무엇이 더 중요한지를 인식할 수 있으므로 문제 해결에 도움이 됨|
    |5|정형 분석|형식적으로 정의된 의미를 지닌 언어로 요구사항을 표현<br>구문(Syntax)와 의미(Semantics)를 갖는 정형화된 언어를 사용하여 수학적 기호로 표현<br>요구사항 분석의 마지막 단계에서 이루어짐|
    
       <br>
    
     * 요구사항 분석 기술
 
    |분석 기술|설명|
    |:--:|:--|
    |청취 기술|이해관계자로부터 의견을 듣는 기술|
    |인터뷰와 질문 기술|이해관계자를 만나 정보를 수집하고 이야기를 나누는 기술|
    |분석 기술|추출된 요구사항에 대해 충돌, 중복, 누락 등의 분석을 통해 완전성과 일관성을 확보하는 기술|
    |중재 기술|이해관계자들의 상반된 요구에 대한 중재기술|
    |관찰 기술|사용자가 작업하는 것을 관찰하면서 사용자가 언급하지 않은 미묘한 의미를 탐지할 수 있는 기술|
    |작성 기술|문서 작성기술|
    |조직 기술|수집된 방대한 정보를 일관성 있는 정보로 구조화하는 능력
    |모델 작성 기술|수집한 자료를 바탕으로 제어의 흐름, 기능 처리, 동작 행위, 정보 내용 등을 이해하기 쉽도록 모델로 작성하는 기술|
    
    <br>
 
    * 요구사항 분석에 사용하는 기능 모델링 기법
 
      - 데이터 흐름도(Data Flow Diagram: DFD)

       - 데이터 흐름도 개념

         - 데이터가 각 프로세스를 따라 흐르면서 변환되는 모습을 나타낸 흐름

         - 시스템 분석과 설계에서 매우 유용하게 사용되는 다이어그램

         - 시스템의 모델링 도구로서 가장 보편적으로 사용되는 것 중 하나임

         - 자료 흐름 그래프 또는 버블(Bubble) 차트라고 함


        - 데이터 흐름도 특징

         - 구조적 분석 기법에 이용됨
 
         - 데이터의 흐름에 중심을 두는 분석용 도구임
 
         - 제어(Control)의 흐름은 중요하지 않음
 
         - 시간 흐름을 명확하게 표현할 수 있음
 
 
        - 데이터 흐름도 구성요소<br>
 
 
          |구성요소|설명|
          |:--:|:--|
          |처리기<br>(Process)|입력된 데이터를 원하는 형태로 변환하여 출력하기 위한 과정으로, DFD에서는 원으로 표시|
          |데이터 흐름<br>(Data Flow)|DFD의 구성요소(프로세스, 데이터 저장소, 외부 엔터티)들 간의 주고받는 데이터 흐름을 나타내며, DFD에서는 화살표(->)로 표시|
          |데이터 저장소<br>(Data Store)|데이터가 저장된 장소이고, 평생선(=)으로 표시하며, 평행선 안에는 데이터 저장소의 이름을 넣음|
          |단말<br>(Terminator)|프로세스 처리 과정에서 데이터가 발생하는 시작과 종료를 나타내고, 사각형으로 표시하며 사각형 안에는 외부 엔터티의 이름을 넣음|
 
 
 
<br>
 
- 외부환경<br>
 광의적인 측면에서 H/W, S/W, 네트워크 등의 환경
 
 <BR>
 
- 개발 비용이 가장 많이 소요되는 단계는 유지보수 단계이다<BR>

- 소단위 명세서(Mini-Spec)<br>
 데이터 흐름도에 나타나있는 처리 항목을 1-2 페이지 정도의 소규모 분량으로 요약하여 작성하는 논리적 명세서이다<BR>
 
 
 
 
 <br> <br>

 
 
- 자료 사전
 
  * 자료 요소, 자료 요소들의 집합, 자료의 흐름, 자료 저장소의 의미와 그들 간의 관계, 관계 값, 범위, 단위들을 구체적으로 명시하는 사전이다

  * 자료 사전은 파일 혹은 DB에 있는 자료에 대한 자료 또는 각 자료 항목에 주어진 이름과 길이 그리고 서술과 같은 데이터를 포함하는 참조를 위한 작업이다
 
 <br>
 
- 자료 사전의 작성 목적
 
  * 조직에 속해 있는 다른 사람들에게 특정한 자료 용어가 무엇인지를 의미하는지를 알려주기 위하여, 용어의 정의를 조정하고 취합하고 문서로 명확히 하는 목적이 있다
 
  * 자료 흐름도에 나타나는 어떤 자료의 흐름도 자료 사전에 정의되어 있어야 함

<br>
 
- 자료 사전 기호
 
|기호|의미|
|:--:|:--|
|=|자료의 정의로서 '~으로 구성되어(is Composed of) 있다'는 것을 나타냄<br>정의는 주석을 사용하여 의미를 기술하며, 자료 흐름과 자료저장소에 대한 구성 내역을 설명하고, 자료 원소에 대하여 값이나 단위를 나타냄|
|+|자료의 연결(and, along with)를 나타냄|
|()|자료 생략 가능함을 나타냄|
|{}|자료의 반복을 나타냄<br>반복 횟수를 기록하는 데{}에서 좌측에는 최소 반복 횟수를 기록하고, 우측에는 최대 반복 횟수를 기록<br>반복 횟수를 기록하지 않을 때는 Default로 최소는 0, 최대는 무한대를 나타냄|
|[]|자료의 선택을 나타냄<br> 택일 기호 [ | ]는 '|'로 분리된 항목 중 하나가 선택된다는 것을 표시|
|**|자료의 설명을 나타냄<br>주석(Comment)|
 
 
<BR>
     
- 자료 사전의 작성 원칙

|작성 원칙|설명|
|:--:|:--|
|자료의 의미 기술|자료의 의미는 주석을 통해서 기술<br>자료의 의미를 기술할 때는 그 자료가 대상 시스템에서 사용되는 적합한 뜻을 표현해야 함<br>중복되는 기술을 회피하는 것은 간결하고 이해하기 쉬운 자료 사전을 작성하는 데 중요함|
|자료 구성항목의 기술|구성항목들을 그룹으로 묶음<br>각 그룹에 대하여 의미 있는 이름을 부여<br>이름이 붙여진 각 그룹을 다시 정의|
|동의어 규정 준수|사용자마다 동일한 문서나 자료에 대해 서로 다른 이름들을 갖고 있을 수 있으며, 사용자들의 용어를 통일시키는 것보다는 사용하는 용어를 이용하여 자료를 정의하는 것이 간단함<br>분석가가 자료를 하향식으로 분할하는 과정에서 부주의하게 동의어를 사용할 수 있음|
|자료 정의의 중복 제거|동일한 자료에 대해 여러 명의 분석가가 독립적으로 분석을 시행한다면, 서로 다른 이름을 사용할 수 있기 때문에 자료 정의의 중복 제거 필요|
 
 
<br>
 
 
- UML (Unified Modeling Language)의 개념
 
 * 객체지향 S/W 개발 과정에서 산출물을 명세화, 시각화, 문서화할 때 사용되는 모델링 기술과 방법론을 통합해서 만든 표준화된 모델링 언어<br>
 
<br> 
 
- UML의 특징
 
 UML은 방법론을 통일한 것으로, 표준화된 모델링 기법을 제공한다<br>
 
|특징|설명|
|:--:|:--|
|가시화 언어|개념 모델 작성 시 오류가 적고 의사소통이 용이|
|구축 언어|다양한 프로그래밍 언어로 실행 시스템의 예측 가능<br>UML을 소스 코드로 변환하여 구축 가능, 역 변환하여 역공학 가능|
|명세화 언어|정확한 모델 제시, 완전한 모델 작성 가능|
|문서화 언어|시스템에 대한 평가 및 의사소통의 문서|
 
<br>
 
- UML 구성요소

|구성요소|내용|
|:--:|:--|
|사물(Things)|추상적인 개념으로, 주제를 나타내는 요소<br>단어 관점에서 '명사'또는 '동사'를 의미|
|관계(Relationships)|사물의 의미를 확장하고 명확히 하는 요소<br>사물과 사물을 연결하여 관계를 표현하는 요소<br>단어 관점에서 '형용사'또는 '부사'를 의미|
|다이어그램(Diagrams)|사물과 관계를 모아 그림으로 표현한 형태<br>형식과 목적에 따라 9가지로 정의|
 
 
<br>
 
- UML 다이어그램
 
 * UML 다이어그램은 구분에 따라 구조적(정적) 다이어그램, 행위적(동적) 다이어그램으로 구분됨<br>
 
 * 컴포넌트, 배치 다이어그램은 구현 단계에서 사용되는 다이어그램임<br>
 
   + 구조적 다이어그램(Structural Diagram) / 정적 다이어 그램 (Static Diagram)

    |다이어그램|설명|
    |:--:|:--|
    |클래스(Class)|시스템 내 클래스의 정적 구조를 표현<br>속성(Attribute)과 동작(Behavior)으로 구성<br>시스템의 구조를 파악하고 구조상의 문제점 도출 가능|
    |객체(Object)|클래스에 속한 사물(객체)들, 즉 인스턴스(Instance)를 특정 시점의 객체와 객체 사이의 관계로 표현<br>객체 인스턴스를 나타내는 대신 실제 클래스를 사용<br>연관된 모든 인스턴스를 표현|
    |컴포넌트(Component)|코드 컴포넌트 기반의 물리적 구조 표현<br>실질적 프로그래밍 작업에 사용|
    |배치(Deployment)|컴포넌트 사이의 종속성을 표현<br>결과물, 프로세스, 컴포넌트 등 물리적 요소들의 위치를 표현|
    |복합체 구조(Composite Structure)|클래스나 컴포넌트가 복합 구조를 갖는 경우 그 내부 구조를 표현|
    |패키지(Package)|유스케이스나 클래스 등의 모델 요소들을 그룹화한 패키지들의 관계를 표현|
 
<br>
 
  + 행위적 다이어그램(Behavioral Diagram) / 동적 다이어 그램 (Dynamic Diagram)

    |다이어그램|설명|
    |:--:|:--|
    |유스케이스(Usecase)|사용자 관점에서 시스템의 활동을 표현<br>유스케이스는 시스템의 기능적 요구 정의에 활용|
    |시퀀스 (Sequence)|객체 간 상호작용을 메시지 흐름으로 표현<br> 객체 사이 메시지를 보내는 시간을 표현|
    |커뮤니케이션 (Communication)|시퀀스 다이어그램과 같이 동작에 참여하는 객체들이 주고받는 메시지를 표현하는데, 메시지뿐만 아니라 객체 간의 연관까지 표현|
    |상태 (State)|하나의 객체가 자신이 속한 클래스의 상태 변화 혹은 다른 객체와의 상호작용에 따라 상태가 어떻게 변화하는지 표현<br>모든 가능한 상태와 전이를 표현<br>진입 조건, 탈출 조건, 상태 전이 등 기술|
    |활동(Activity)|시스템이 어떤 기능을 수행하는지를 객체의 처리 로직이나 조건에 따른 처리의 흐름으로 순서대로 표현|
    |타이밍 (Timing)|객체 상태 변화와 시간 제약을 명시적으로 표현|
 
<br>
 

- UML 상세
 
  * 클래스 다이어그램

    + 객체지향 모델링시 클래스의 구속성 및 연산과 클래스 간 정적인 관계를 표현한 다이어그램

  * 클래스 다이어그램 구성요소
 
|구성요소|설명|
|:--:|:--|
|클래스 이름 (Class Name)|클래스의 이름|
|속성 (Attribute)|클래스의 특징에 이름을 부여|
|연산 (Operation)|객체에 요청하여 행동에 영향을 줄 수 있는 서비스|
|접근 제어자 (Access Modifier)|클래스에 접근할 수 있는 정도를 표현<br>[-] 클래스 내부접근만 허용(private)<br>[+] 클래스 외부접근을 허용(public)<br>[#] 동일 패키지, 파생 클래스에서 접근 가능(protected)<br> [~] 동일 패키지 클래스에서 접근 가능(default)|
 
<br>
 
- 유스케이스 다이어그램

 유스케이스 다이어그램은 시스템이 제공하고 있는 기능 및 그와 관련된 외부 요소를 사용자의 관점에서 표현하는 다이어그램이다
 
<br>
 
- 유스케이스 다이어그램 구성요소
 
|구성요소|설명|표기법|
|:--:|:--:|:--:|
|유스케이스<br>(Usecase)|시스템이 제공해야 하는 서비스<br>액터가 시스템을 통해 수행하는 일련의 행위}|![image](https://user-images.githubusercontent.com/68424403/177484784-fd947089-0a34-460b-a406-2feb69ac0d31.png)|
|액터<br>(Actor)|사용자가 시스템에 대해 수행하는 역할<br>시스템과 상호작용하는 사람 또는 사물|![image](https://user-images.githubusercontent.com/68424403/177485739-27b3881b-596e-4724-b72a-586bcaa1f2af.png)|
|시스템<br>(System)|전체 시스템의 영역을 표현|![image](https://user-images.githubusercontent.com/68424403/177486836-e61a4799-0e35-4a5d-9d78-7acc62cc2f15.png)|

 
<br>
 
- 시퀀스 다이어그램
 
  시퀀스 다이어그램은 객체 간 상호작용을 메시지 흐름으로 표현한 다이어그램이다
 
 <br>
 
- 시퀀스 다이어그램의 구성요소
 
|구성요소|설명|
|:--:|:--:|
|객체<br>(Object)|객체는 위쪽에 표시되며 아래로 생명선을 가짐<br>객체는 사각형 안에 밑줄 친 이름으로 명시|
|생명선<br>(Lifeline)|객체로부터 뻗어 나가는 점선<br>실제 시간이 흐름에 따라 객체의 생명주기 동안 발생하는 이벤트를 명시|
|실행<br>(Activation)|직사각형은 오퍼레이션(함수)이 실행되는 시간을 의미<br>직사각형이 길어질수록 오퍼레이션 수행시간이 긺|
|메시지<br>(Message)|객체 간의 상호작용은 메시지 교환으로 이루어짐<br>한 객체에서 다른 객체로의 메시지를 전달하여 전달받은 객체의 오퍼레이션(함수)을 수행|
 
<br>
 
