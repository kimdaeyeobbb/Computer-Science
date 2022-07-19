# :page_with_curl: CPU Scheduling

## :pushpin: CPU and I/O Bursts in Program Execution

<p align="center">
  <img src="https://user-images.githubusercontent.com/68424403/179850406-8543372f-5224-450e-b486-ef594042e60e.png" width="600" height="500" title="CPU and I/O bursts alt="CPU and I/O bursts"/>
</p>

- 진행 순서

  1. CPU에서 Instruction 실행하는 기계어 (load, add, read ..)
  2. wait for I/O
  3. I/O 작업이 끝나면 다시 ready 상태로 돌아와서 CPU를 얻은 다음 CPU에서 수행하는 Instruction을 실행시킴
  4. 그러다가 또 I/O 작업시 I/O 수행
  5. CPU를 쓰고 (load, add, read ...)
  6. 이런 식으로 진행

<br>

- 프로그램이 실행되면 어떤 프로그램이건 간에 program path (CPU를 연속적으로 쓰는 단계와 I/O하는 단계가 번갈아 가면서 실행)를 실행하면서 진행

- 어떤 프로그램이건 실행시 CPU burst와 I/O burst를 반복하면서 진행이 된다<br>(단, 프로그램의 종류에 따라 CPU burst와 I/O burst가 매우 빈번하게 있는 프로그램이 있고,<br>
  CPU burst만 진득하게 나오다가 I/O burst가 한 번 나오는 프로그램이 있을 수 있다)
  
- CPU burst와 I/O burst가 매우 빈번하게 나오는 프로그램<br> => 보통은 사람이 Interaction하는 프로그램<br> 이유: CPU에서 작업하고 -> 화면에 출력해주고 -> 사람이 키보드에 입력하면
CPU가 뭔가를 실행하고 -> execution 됐으면 결과를 보여주고 -> 또 사람이 반응하는 Inteactive한 일들이 CPU burst와 I/O burst가 자주 나오게 됨<br>
(즉, I/O가 중간에 자주 끼어들어서 CPU burst가 짧아지고 개수가 많아지기 때문이다)


<br>

- CPU Burst 
  - CPU만 연속적으로 쓰면서 Instruction 실행하는 단계
  
  
<br>

- 프로그램은 CPU burst와 I/O burst의 연속이지만 프로그램의 종류에 따라 이들의 빈도나 길이가 달라진다

<br><br>





## :pushpin: CPU burst Time 분포


![image](https://user-images.githubusercontent.com/68424403/179852442-b27e37e9-7d6d-4604-a1e3-fa6646971e9f.png)


- 대부분의 CPU 시간을 I/O bound job이 다 쓰는것은 아니다<br>
  => I/O bound job은 단지 I/O가 중간에 너무 많이 끼어들어서 cpu 시간이 짧게 조각나서 등장 빈도가 높았던 것이다
  
- 반면 CPU bound job은 CPU를 굉장히 오랫동안 쓰기 때문에 등장 빈도가 적을 수 밖에 없다

<br>

- 컴퓨터 내에는 똑같은 종류의 프로그램만 존재하는 것이 아니다<br> => CPU bound job도 있고, I/O bound job도 있다 <br> => CPU 스케줄링이 필요하다


- CPU 스케줄링이 필요한 이유

  - CPU bound job 이 CPU를 한 번 잡으면 I/O bound job은 오랫동안 CPU를 못잡고 기다리게 되는데, I/O bound job은 interactive (사람과 상호작용) 하므로 사람이 답답함을 느낀다
  - 따라서 사람과 Interactive한 I/O bound job같은 친구에게 CPU를 우선적으로 주기 위해 CPU 스케줄링이 필요한 것이다<br>
  (<b>공평한 분배보다 효율성이 중요하다 !</b>)
  
  
 <br><br>
 
 
## :pushpin: 프로세스의 특성 분류
 
|I/O bound process|CPU bound process|
|:--:|:--:|
|사람과 Interactive하는 job<br> (중간에 I/O가 많이 끼어들기 때문에 CPU burst가 짧고 빈번하게 나타남)|계산 위주의 job<br> CPU burst가 길지만 빈번하지 않다|
|CPU를 잡고 계산하는 시간보다 I/O에 많은 시간이 필요한 job|중간에 I/O가 없으므로 자연스럽게 CPU를 쓰는 시간이 길어진다|



<br><br>


## :pushpin: CPU Scheduler & Dispatcher

- CPU Scheduler
  - Ready 상태의 프로세스 중에서 누구에게 CPU를 줄지 결정하는 OS 내 코드 <br>(별도의 H/W나 S/W가 아니다!!)
  
 <br>
 
 - Dispatcher
  - (CPU를 누구에게 줄지 결정한 다음) 그 친구에게 CPU를 넘겨주는 역할을 하는 OS 내 커널 코드
  - CPU 제어권을 선택된 프로세스에게 넘기는 역할 (context switch 과정)
  
<br>  
  
 - CPU 스케줄링이 필요한 케이스

    - nonpreemptive (강제로 빼앗지 않고 자진 반납)
      - Running -> Blocked (ex: I/O 요청하는 시스템 콜) <br> => CPU를 어떤 프로세스가 잡고 있는데 해당 프로세스가 I/O 작업과 같이 시간이 오래 걸리는 작업을 하는 경우 
      CPU 자진 반납
      - Terminate <br> => 프로세스가 종료되어 더 이상 할 일이 없으므로 새로운 프로세스에게 CPU를 넘김


    - preemptive
      - Running -> Ready (ex: 할당시간 만료로 인해 timer interrupt) <br> => 나는 CPU를 계속 쓰고 싶으나 나 혼자 무한정 CPU를 받을 수 없으므로 강제로 CPU를 원하는 프로세스
      에게 빼앗기는 경우 <br>(이때 timer interrupt 발생)
      - Blocked -> Ready (ex: I/O 완료 후 interrupt) <br> => 프로세스에게 CPU를 넘겨주고 싶지 않은데 내가 우선순위가 떨어져서 CPU를 넘겨주는 경우

 
 <br>
 
 
 마저 작성 예정
