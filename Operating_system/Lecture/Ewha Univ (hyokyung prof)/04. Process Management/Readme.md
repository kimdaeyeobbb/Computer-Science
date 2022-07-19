# Process Management

## :pushpin: 프로세스 생성 (Process Creation)

- 프로세스 생성 원리: 복제 생성 (부모가 자식을 복제해서 만듦. 자식은 여러명 낳을 수 있음)
- 이로 인해 프로세스의 트리(계층 구조) 형성 (부모가 자식을 여러명 만드는 경우를 떠올릴 것)

<br>

- 자원의 필요성
  - 프로세스가 생성되기 위해서는 자원이 필요하다 
  - 자원은 OS로 부터 받는다
  - 부모와 자식이 자원을 공유한다 (경우에 따라 자원을 공유하지 않을 수도 있다)

<br>

- 자원의 공유
  - <b>[원칙적]</b> 프로세스는 생성시 독립적인 존재이므로, 자원을 공유하기 보다는 부모와 자식이 서로 자워을 많이 가지기 위해 경쟁을 한다 
  - 자원은 부모와 자식이 공유한다 
  - 경우에 따라 자원을 일부를 공유할 수도, 전혀 공유하지 않을 수도 있다

<br>

- 수행 (Execution)
  - 프로세스가 실행이 되는 경우를 뜻함
  - 부모와 자식은 공존하면서 수행되는 모델이다
  - 자식이 종료(terminate)될 때까지 부모가 기다리는(wait) 모델이다 <b>(blocked 상태)</b>

<br>

- cf) copy-on-write (cow) 기법
  - 잘게 쪼개져서 write 발생 시 copy 하겠다는 것
  - 부모와 공유하지 않는다

<br>


- 프로세스 생성 단계 (2단계를 거침. 각 단계는 독립적)
  1. 부모 프로세스를 복제
  2. 복제된 것에 새로운 프로그램을 덮어 씌우는 단계 
  
<br>  
  
- 주소 공간 (Address space)
  - 자식은 부모의 주소 공간을 복사함 (binary, OS data, PCB나 자원들도 복사)
  - 자식은 복제된 공간에 새로운 프로그램을 올림 <br> => 이로인해 서로 다른 프로그램이 컴퓨터 내에 존재할 수 있음 (그렇지 않으면 나와 같은 것들만 존재하므로 재미 없다!)
  
<br> 
  
 - 유닉스 예시
    1. fork() system call
        - fork() 시스템 콜은 복제를 통해 부모를 그대로 복사하여 새로운 프로세스를 생성
        - 그 과정에서 주소 공간을 할당한다

    2. exec() system call
        - (복제 생성 후) 다른 프로그램으로 덮어 씌우는 역할을 한다
        - fork 다음에 이어지는 exec() 시스템 콜을 통해 새로운 프로그램을 메모리에 올린다
        - 이를 통해 새로운 인생을 살 수 있다 (이때까지의 삶이 맘에 들지 않을 경우 모조리 덮어씌울 수 있다)
   
<br>

- 사용자가 직접 다른 프로세스를 생성하는 것은 아니고, OS를 통해서만 생성이 가능하다

- fork(), exec() 등은 시스템 콜이고, OS에게 자식을 낳아달라고 부탁하면 OS가 대신 낳아주는 것이다




<br><br>




## :pushpin: 프로세스 종료 (Process Termination)

- 프로세스 세계의 원칙
  - 부모 프로세스가 자식 프로세스를 낳으면 자식이 먼저 종료되어야 함 (이후의 일을 부모가 처리)

1. exit() system call
    - exit 시스템 콜을 하면 자발적으로 프로세스가 종료됨
    - 프로세스가 마지막 명령을 수행한 후 OS에게 이를 알려줌
    - 프로세스의 각종 자원들이 OS에게 반납됨

      - wait() system call
          - 프로세스 종료 시 자식이 부모에게 output data를 보냄 (wait 시스템 콜을 통해 이루어짐)

2. abort() system call
    - 비자발적 프로세스 종료
    - 부모 프로세스가 자식의 수행을 종료시킴
    
    - abort() system call을 사용하는 경우 (abort()를 사용하여 강제로 죽임)
      
        1. 자식의 할당 자원이 한계치를 넘어섬 
        2. 자식에게 할당된 task가 더 이상 필요하지 않음 (더 이상 자식에게 시킬 일이 없는 경우)
        3. 부모가 종료하는 경우 (프로세스 세계에서는 자식 프로세스가 먼저 종료된 후 부모 프로세스가 종료 되어야 함)
            - 자식이 더이상 수행되도록 두지 않기 위해 자식부터 죽이면서 위로 올라가면서 종료가 이루어져야 함 

<br><br>


## :pushpin: fork() system call

- fork()를 통해 복제 생성이 이루어짐<br> => 부모 프로세스의 문맥(context)을 자식에게 복사

- fork() system call 예시
```C
int main()
{
  int pid;
  pid = fork();   // 함수호출 => OS에게 새로운 프로세스를 만들어 달라는 요청
  if (pid == 0){   /* this is cihld */
    printf("\n Hello, I am child!\n");
  } else if (pid > 0){    /* this is parent */
    printf("\n Hello, I am parent!\n");
  }
}
```

- cf) 함수호출<br>

  우리가 보통 함수를 호출하게 되면 함수에 해당하는 기능을 수행하고 함수가 끝나면 필요한 결과값(return value) 반환<br> => 이후 등장하는 코드의 명령 수행
  
<br>  


- 부모 & 자식 프로세스를 함께 보며 fork() system call 이해하기



- 부모 프로세스
```C
/* 1) 자식을 안 낳았으므로 처음에는 이 프로세스 하나만 존재*/
int main()
{
  int pid;
  pid = fork();     // 2) fork system call을 만나서 새 프로세스 생성 (fork하는 순간 새 프로세스 생성)
  if (pid == 0){     // 4) 윗줄의 함수 실행이 끝났으면 프로세스는 아무일이 없다는 듯 fork() system call 의 다음줄부터 실행
    printf("\n Hello, I am child!\n");
  } else if (pid > 0){    /* this is parent */
    printf("\n Hello, I am parent!\n");
  }
}
```



- 자식 프로세스
```C
/* 3) 자식 프로세스 생김 (새로 생긴 프로세스) */
int main()
{
  int pid;
  pid = fork();   // 함수호출 => OS에게 새로운 프로세스를 만들어 달라는 요청
  if (pid == 0){   // 5) 부모입장에서 fork가 끝나고 나서 아래 문맥(if절)에 이르렀다 -> 이를 자식도 똑같이 copy. 자식 프로세스는 fork()가 끝난시점인 이 라인부터 수행
    printf("\n Hello, I am child!\n");
  } else if (pid > 0){    /* this is parent */
    printf("\n Hello, I am parent!\n");
  }
}
```

- 5)내용:  부모의 내용을 자식이 copy<br> => main 함수의 맨 위부터 실행하는 것이아니라 방금전에 내가 fork했다는 기억을 가지고 그 다음줄 코드 부터 실행<br> 
(실제로는 자식이 아닌 부모가 fork()를 하였고, 자식은 만들어진 것이지만 자식이 fork()를 했다고 착각하는 것) 


- fork가 무한히 반복되는 것이 아니고, fork()를 하게 되면 fork()가 이루어진 다음 시점부터 자식프로세스가 실행하게 되는데,<br>이는 부모 프로세스의 문맥을 그대로 복제하기
때문에 (정확히는 부모의 program counter를 복제해서) if절을 실행해야하는 것을 자식이 알기 때문에 main 함수의 시작부분부터 실행되는 것이 아니다<br>
(내가 어느곳에 들어가서 복제를 하게 되면 나와 똑같이 생긴 아기를 낳는것이 아니라 나와 똑같이 생긴 나이가 꽤많고 
순수하지도 않은 이런 사람이 나와 똑같은 모습을 하고 살아가는 것)


<br>

- 문제점 발생 (혼란스러운 상황 발생)
  1. 복제된 녀석이 부모와 갖은 소스를 가지고 있으면서 부모 프로세스를 복제본 취급
  2. fork()시 부모와 같은 것들이 만들어지므로 세상 속 프로그램들은 모두 똑같은 제어흐름을 따라가야할 것 같음

- 해결책
  - fork() 함수의 return value를 통해 원본과 복제본 구분
    - 부모의 결과값: 양수, 자식 프로세스의 pid(주민등록번호)
    - 자식의 결과값: 0
    - 부모와 자식의 다른 return value를 이용하여 if(pid == 0) ~ else if (pid > 0)절을 통해 다른일을 시킴


<br>

- <b>부모 프로세스와 자식 프로세스는</b> 결과값은 다르지만 <b>'하나의 프로그램'</b>이다<br>
  하나의 실행파일을 실행시켜서 똑같은 주소공간을 가진 2개의 프로세스이다<br> => 다른 프로그램으로 실행시키기 위해 exec() system call이 존재한다

<br><br>


## :pushpin: exec() system call

- 완전히 새로운 프로세스로 태어나게 만들어 준다

- 전체 프로그램을 수행하다가 새로운 프로그램으로 덮어씌움

- 한번 exec을 수행하면 되돌아 올 수 없다 (살아온 기억이 좋지 않다고 해서 exec을 하여 갓난아기로 돌아올 수 없듯이)

- exec() system call 예시
```c
int main()
{
    int pid;
    pid = fork();
    if (pid == 0){    // 자식 프로세스
      printf("\n Hello, I am child! Now I'll run date \n");
      execlp("/bin/date", "/bin/date", (char*)0);   // excelp함수 -> exec 시스템 콜을 수행
    } else if (pid > 0) {   // 부모 프로세스
      printf("\n Hello, I am parent\n");
    }
}
```

- 부모 프로세스가 자식을 만든 다음, 출력문 수행 후 date(현재 날짜와 시각 출력해주는 프로그램)라는 새로운 프로그램이 덮어 씌우는 형태이다

- date라는 새로운 프로그램으로 기존 프로그램을 덮어써서 실행하고, date 프로그램을 끝내고 나면 해당 프로그램은 수명이 다하게 된다


<br>

- 꼭 자식을 만들어서 exec을 해야하는 것은 아니다
- fork를 빼고 exec 수행한 케이스
```c
int main()
{
  printf("\n Hello, I am child! Now I'll run date \n");
  execlp("/bin/date", "/bin/date", (char*)0);   // excelp함수 -> exec 시스템 콜을 수행 -> 새로운 date 프로그램으로 덮어 씌움 (date 프로그램 처음부터 끝까지 수행) 
  printf("\n Hello, I am parent!\n");   // exec 이후의 이 코드는 영원히 실행불가 (이유: 새로운 프로그램으로 덮어 씌웠기 때문)
}
```

<br>

- fork가 빠진 exec() system call 추가 예시
- ehco(): 뒤에 나오는 인자(argument)를 그대로 출력 (printf와 유사)
```c
int main(){
  printf('1');    // 1) '1'을 출력
  execlp("echo", "echo", "3", (char*)0);    // 2) echo 프로그램으로 덮어 씌워서 '3'을 화면에 출력
  printf('2');    // '2'는 영원히 출력되지 않음
}
```


<br><br>

## :pushpin: wait() system call

- 자식 프로세스가 종료될떄까지  기다리는 system call

- 프로세스를 blocked 상태로 잠들게 만듦 (이벤트를 기다리고 있다가 이벤트가 만족이 되면 다시 CPU 획득)

- 보통 자식 프로세스를 만든 다음 wait() system call을 수행

<br>

### 상태

- 프로세스 A가 wait() 시스템 콜을 호출하면
  
    - 커널은 child가 종료될 떄까지 프로세스 A를 sleep 시킴 (block 상태 -> 자식 프로세스가 종료되기를 기다리는 상태)
    - child process가 종료되면 커널은 프로세스 A를 꺠운다 (ready 상태 -> 자식 프로세스가 종료되면 부모 프로세스가 block 상태에서 ready 상태로 바뀌어서 CPU를 얻을 수 있게 됨)

- 예시
```C
#include <stdio.h>
#include <unistd.h>

int main(){
    int childPID;
    s1;
    
    childPID = fork();
    
    if (childPID == 0){   // fork의 결과값이 0이면
        // code for child process   // 자식 프로세스를 위한 코드 실행
    } else {    // fork의 결과값이 0이 아니면 (부모 프로세스가 실행하는 부분)
        wait();   // wait 시스템 콜 => 부모 프로세스는 CPU를 얻지 못하고 잠듦
    }
    
    s2;   // 다음코드
}
```

- if문 (자식 프로세스를 위한 코드)을 모두 실행하고 종료하면 그 때 부모 프로세스가 wait 시스템콜을 빠져나가서 다음코드인 s2를 실행시킴



<br><br>



## :pushpin: exit system call

- 프로세스를 종료시킬 때 호출하는 시스템 콜

- 프로그램이 자발적으로 종료될 때 실행됨

- 모든 자원을 반납하고 종료 & 부모에게 죽음을 

<br>

- 프로세스의 종료

  - 자발적 종료
    
      - 마지막 statement (exit이전 statement)수행 후 exit() system call을 통해 프로그램에 명시적으로 적어주지 않아도 main 함수가 return 되는 위치에<br> 컴파일러가 스스로 exit()시스템 콜을
        넣어줌

  - 비자발적 종료

      - 부모 프로세스가 자식 프로세스를 강제종료 시킴
          - 자식 프로세스가 한계치를 넘는 자원 요청 or 자식에게 더 이상 시킬일이 없는 경우
      - 키보드로 kill, break 등을 입력
      - 부모 프로세스 본인이 죽는 경우

- exit() system call 예시
```c
#include <stdio.h>
#include <unistd.h>

int main(){
    int pid;
    printf("\n Hello, I am child!\n");
    exit();    // 명시적으로 exit이 존재
    pid = fork();   // exit 아래의 줄인 여기부터 끝까지는 실행불가
    if (pid == 0){
        printf("\n Hello, I am child!\n");
    } else if (pid > 0){
        printf("\n Hello, I am parent!\n");
    }
}
```



<br><br>


## :pushpin: 프로세스간 협력

- (원칙적으로) 프로세스는 독립적 (한 프로세스가 다른 프로세스에 영향을 미치지 않음)
- 따라서 자식을 낳으면 스스로 먹을 것을 찾고, 서로 경쟁을 한다
- 하지만 경우에 따라서는 (독립적인) 프로세스가 협력을 해야 효율적이다

|독립적 프로세스|협력 프로세스|
|:--:|:--:|
|프로세스는 각자의 주소공간을 가지고 수행되므로 원칙적으로 하나의 프로세스는 다른 프로세스의 수행에 영향을 미치지 못함|프로세스 협력 메커니즘을 통해 하나의 프로세스가 다른 프로세스의 수행에 영향을 미칠 수 있음|

<br>

- 프로세스 간 협력 메커니즘 (IPC: InterProcess Communication) => 프로세스간 정보를 주고 받을 수 있는 방법

|메시지 전달 방법|주소 공간 공유 방법|
|:--:|:--:|
|message passing<br> 커널을 통해 메시지 전달|shared memory<br>서로다른 프로세스 간에도 일부 주소 공간 공유<br><br>thread<br>동일 프로세스를 구성하는 thread간에는 주소공간을 공유하므로 협력가능<br>(단, 스레드간 협력이지 프로세스간 협력이 아니다)|


- 스레드: 하나의 프로세스 내에 존재하는 CPU 수행단위
- 스레드들끼리는 공유하기가 쉽고 스레드들끼리 완전한 협력이 가능하다<br>(주소공간 자체를 스레드들끼리 완전히 공유하므로 프로세스 하나에 여러 스레드들이 활동한다)


<br><br>


## :pushpin: Message Passing

- Message system

  - 프로세스간 공유변수를 사용하지 않고 다른 프로세스와 통신하기 위해 메시지를 이용하여 통신하는 시스템이다
  - 원칙적으로 프로세스 간에 공유 변수(shared variable)을 일체 사용하지 않고 각자 자기 주소 공간의 본인 코드만 실행하면서 각자 데이터값만 바꾼다.


<br>

- Message Passing 방법

  1. Direct Communication

      - 통신하려는 프로세스이름 (메시지를 받는 프로세스)을 명시적으로 표시

    ![image](https://user-images.githubusercontent.com/68424403/179843478-5ad32214-8c92-4014-9829-7d4ab035dce1.png)


  <br>



  2. Indirect Communication

    - mailbox (또는 port)를 통해 메시지를 간접 전달
    - 메시지를 받는 프로세스 이름을 명시적으로 표시하지 않음
    - 경우에 따라 문어발식으로 아무나 메시지를 꺼내가게 할 수 있다
    
    ![image](https://user-images.githubusercontent.com/68424403/179843563-9356addf-7e74-4c65-9e38-cad9e84cd657.png)



<br>

 
 
- Message Passing 방법 비교

|-|Direct Communication|Indirect Communication|
|:--:|:--:|:--:|
|공통점|OS의 커널을 통해 메시지 전달<br> 사용자 프로세스끼리 무엇인가를 전달하는 것은 불가능|OS의 커널을 통해 메시지 전달<br> 사용자 프로세스끼리 무엇인가를 전달하는 것은 불가능|
|차이점|메시지를 받은 프로세스 이름 명시|메일박스에 메시지 삽입|

<br><br>



## :pushpin: Interprocess Communication

![image](https://user-images.githubusercontent.com/68424403/179844872-e143dce3-6108-4bde-978e-0301b42eeaf1.png)



- Message Passing
  
  - 메시지를 전달할 때 직접 전달하는 것이 아니라 커널을 통해 전달한다

<br>


- Shared Memory

  - 원칙적으로 프로세스는 독립적인 주소공간(code, data, stack)을 가지므로 자기 주소공간만 볼 수 있다
  - shared memory : 프로세스 A,B가 공유하는 메모리 공간<br>(독자적인 메모리 공간을 물리적 메모리 공간에 매핑할때 공유되도록 매핑한 것)
  - ex) 프로세스 A가 공유 공간에 내용을 적을 경우, 프로세스 B의 주소공간에도 그 내용일 포함되어 있으므로 해당 내용을 바로 전달받아서 볼 수 있다

  - 처음 메모리 공유를 할 때 커널의 도움을 받는다<br>
    (커널이 한 번 처리해주면 그 이후에는 사용자 프로세스 둘이서 작업을 하게된다. 이 때 원하지 않는 작업 결과가 나올 수 있으므로 신중해야 한다)
