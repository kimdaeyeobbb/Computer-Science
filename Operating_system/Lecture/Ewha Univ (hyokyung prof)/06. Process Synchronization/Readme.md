# :page_with_curl: Process Synchronization

## :pushpin: 데이터의 접근 (실제 흐름과 항상 일치하는 것은 아니므로 참고만 할것)
 
<br>

<p align="center">
  <img src="https://user-images.githubusercontent.com/68424403/180428403-5394c067-3e10-4f93-b67e-6fc4286ce36b.png" width="400" hegiht="400"/>
</p>

- 진행과정<br>
  :one: 데이터가 storage box(데이터가 저장된 곳)에 저장되어 있음<br>
  :two: Execution box(연산 실행 주체)에서 Storage box에 저장된 데이터를 읽어와서<br>
  :three: 연산을 하고<br>
  :four: 연산을 한 결과를 다시 원래 데이터가 저장된 위치에 가져다 놓음<br>


<br><br>

## :pushpin: Race Condition 

<br>

<p align="center">
  <img src="https://user-images.githubusercontent.com/68424403/180430165-279ccce4-ede6-438a-9ef3-239a63d2d26e.png" width="600" hegiht="600"/>
</p>


- 한 주체가 데이터를 읽어갔는데, 또 다른 주체가 데이터를 또 한번 읽어서 원하지 않는 결과를 얻는 '경쟁 상태'<br>
  (storage box를 execution box 하나가 사용하면 문제가 없지만 execution box 여러개가 storage box를 공유하는 경우 문제가 발생한다)<br>
  (ex. 
  

<br><br>


## :pushpin: Race Condition 발생하는 케이스

### :one: Kernel 수행 중 interrupt 발생시

![image](https://user-images.githubusercontent.com/68424403/180442933-1e238d8d-079b-44c8-ab83-12f101accc81.png)


#### 진행순서
  1. <b>count++</b> : 커널이 CPU에서 실행하고 있으면서 count 변수를 1씩 증가시키고 있는 상황 (CPU 내부에서는 여러개의 instruction을 통해 해당 명령 수행)
  
  2. count변수를 1만큼 증가시킨다고 했을떄 이 변수의 값을 메모리 내 CPU의 레지스터로 불러들인다. 
  
        1. 1->3으로 넘어가는 상황(count+1한 것을 메모리내 CPU 레지스터로 불러들일 때) interrupt가 들어올 경우
        2. count++ 작업을 멈추고
        3. interrupt 처리루틴으로 넘어가서 interrupt hanlder(커널에 있는 코드)가 실행됨
        4. <b>count--</b> : interrupt handler가 커널에 있는 코드이므로 커널에 있는 데이터인 count 변수를 1빼고 나서
        5. interrupt 처리를 다 끝내고 나서
        6. 원래대로 돌아온다 (count++가 있는 위치)
  
  3. 레지스터 값을 1만큼 증가시키고
  
  4. 해당 레지스터의 값을 메모리의 변수로 다시 가져다 쓴다 (count++있는 라인의 그림 부분)

<br>

- 결과적으로 1만큼 감소시킨 것은 반영하지 않고, 1만큼 증가시킨 것만 반영한다 (1만큼 감소시키기 전의 값을 읽어놨다가 증가시켜서 저장) 

<br>

#### ❓문제점

- 커널코드가 수행도중 interrupt가 발생해서 interrupt 처리를 하게 되면, 커널에 있는 데이터를 건드리는 도중에 CPU를 건드리게 된다

<br>

#### ❗해결책

- **먼저 하던일이 끝나기 전까지는 interrupt 받지 않게 만듦**

- 중요한 변수를 건드리는 동안은 instruction 처리 직후에 interrupt가 들어오더라도 interrupt 처리루틴으로 넘기는 것(추가적으로 중요한 변수를 건드리는)이 아니라
  작업이 끝날 때 까지는 interrupt 처리하지 않고 (interrupt disabled) 중요한 변수를 건드리는 작업이 끝난 후 interrupt 처리루틴으로 넘겨서 
  race condition 발생하지 않게 할 수 있다


<br><br>


### :two: Process가 system call을 하여 kerenrl mode로 수행 중인데 context switch가 발생한 경우


![image](https://user-images.githubusercontent.com/68424403/180445743-c4798f62-a1b2-472b-a0b2-fe8ea9d4031d.png)


- 어떤 프로세스가 실행된다<br>
  => 본인의 코드만 실행하는 것이 아니라, system call을 통해 OS에게 서비스를 대신 해달라고 하는 경우가 많다.<br>
  그러므로 user mode와 kernel mode를 번갈아가며 수행하게 된다
  
<br>  
  
#### 커널모드에서 CPU preempt가 발생한 경우

![image](https://user-images.githubusercontent.com/68424403/180445914-577c7f98-0512-43a9-a14e-fd4ff7ee692a.png)


- ❓문제점 진행과정

  1. Pa의 user mode: 본인의 코드를 실행하다가 
  2. Pa의 kernel mode: 커널에게 요청을 해서 system call을 함 
  3. Co ~ : 커널의 코드가 실행되면서 count라는 값을 1만큼 증가시키는 도중에 Pa에게 할당된 시간이 끝남 (Pb에게 CPU가 넘어감)
  4. Pb의 user mode: CPU가 B에게 넘어와서 Pb 본인이 할 수 없는 system call을 하여 커널에게 작업을 대신해달라고 요청을 하였는데
  5. Pb의 kernel mode: count라는 변수를 건드렸다
  6. Pa의 kernel mode: Pb의 할당시간이 끝났으므로 Pa로 CPU가 넘어왔다
  7. ~ unt : Pa는 변수값을 1만큼 증가시키기 위해 CPU안으로 읽어들인 다음시점의 Instrutcion을 실행시킨다
  8. Pa의 user mode: instruction을 쭉 실행시키면 count 변수는 Pa에서도 1만큼 증가하고 Pb에서도 1증가되므로 2가 증가해야하나 Pb에서 증가시킨 것은 반영되지 않는다
    (이유: Pb가 증가되기 전에 Pa에서 count를 읽어들였고, 이 시점의 context를 가지고 1만큼 증가시킨 후 저장하였으므로 synchronization 문제가 발생)

<br>

- ❗해결책

  - 어떤 프로세스가 커널 모드에서 수행 중일 경우 할당시간이 끝나도 CPU를 preempt하지 않고(CPU를 뺏기지 않고), 커널 모드에서 사용자 모드로 돌아갈 때 CPU를 preempt


<br><br>


### :three: Multiprocessor에서 shared memory 내부의 kernel data (CPU가 여러개 등장하는 케이스)


![image](https://user-images.githubusercontent.com/68424403/180447391-1c9fb087-1a35-4fee-bf53-c071f62b574d.png)

<br>

#### ❓ 이 문제가 생기는 이유

- 사용자 프로그램이 아니고 OS의 커널에 여러 CPU가 동시에 접근하므로 문제가 발생한다

<br>

#### ❗ 해결책

- CPU가 하나씩만 접근하게 만든다

- 해결과정

  1. CPU가 데이터를 들고가기전에 lock을 건다
  2. 어느 누구도 이 데이터에 접근하지 못하게 만든 다음 데이터를 변경하고 저장이 끝나면 lock을 풀어준다
  3. lock이 풀렸으므로 다른 CPU가 비로소 이 데이터에 접근할 수 있게 된다



<br><br>



## :pushpin: Initial Attempts to Solve Critical section Problem

![image](https://user-images.githubusercontent.com/68424403/180448482-4dc23ff8-3529-4816-b34f-ae0f0d8a0719.png)


```c
do{
    entey section
    critical section   // 공유 데이터에 접근하는 영역
    exit section
    remainder section   // 공유 데이터에 접근하지 않는 영역
} while(1);
```

- entry section
  - 공유데이터에 접근시 동시에 접근하는 문제를 방지하기 위해 공유데이터에 접근하지 전에 entry section에 접근해서 lock을 검
    (여러 프로세스가 동시에 critical section에 들어가는 것을 막음)

- exit section
  - critical section이 끝나면 lock을 풀어서 다른 프로세스가 critical section에 들어갈 수 있게 해줌 



<br><br>


## :pushpin: Critical section 문제를 해결하기 위해 충족시켜야 하는 조건

![image](https://user-images.githubusercontent.com/68424403/180449354-060888a2-446d-4a0f-b691-39c9d7dcf9b6.png)


<br><br>

### :one: Mutual Exclusion 만족시키는 알고리즘

![image](https://user-images.githubusercontent.com/68424403/180449665-8535760a-5784-4f54-890c-40d89118f397.png)

- turn을 이용하여 자기차례에만 critical section에 접근하므로 mutual exclusion을 만족시킨다

<br>

#### ❓문제점

- critical section에 들어갔다 나오는 빈도가 일정하지 않다
- 아무도 critical section에 없는 경우에도 critical section에 들어갈 수 없는 문제가 발생 (Progress 조건 미충족)
