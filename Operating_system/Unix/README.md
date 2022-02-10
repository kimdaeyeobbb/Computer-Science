# Unix & Command line (명령행)


## 1. Unix
* OS와 UNIX의 관계<BR>
Linux, ubuntu, RedHat, android, iOS, macOS, chrome OS등 수많은 운영체제들은 UNIX에서부터 시작<br>

  
  
* 유닉스의 장점<BR>
사람들이 이해하기 쉬운 고급언어인 C언어로 작성하였으므로 다른 컴퓨터에 비해 수정이 용이
유닉스를 수정해서 다른 컴퓨터에 적용할 수 있게 되었으므로 다양한 버전의 유닉스가 만들어졌고, 너무 많은 유닉스가 생성되어서 혼란을 방지하기 위해 기준이 되는 UNIX로서 POSIX(Unix의 규격 및 기능)이 등장함


  
* 용어정리<BR>
1) <strong>커널</strong><BR>
  OS의 핵심부. 리누스 토발즈가 커널 하나를 생성 (리눅스)<BR>
  GNU + Linux Kernel = GNU/Linux <br>
2) <strong>리눅스 (GNU/Linux)</strong><BR>
  UNIX를 자유롭게 변형하고 배포할 수 있음. 리눅스 또한 POSIX(UNIX 표준)에 부합<BR>

  
  
* Command<BR>
  커멘드와 인자/옵션을 함께 사용함으로서 원하는 결과를 출력해낼 수 있다
```linux
  date
  현재 날짜 나타냄
  
  cal 
  현재 날짜를 달력으로나타냄
  
  cal 2029
  cal 뒤에 인자를 주어 나타내고 싶은 년도의 달력을 나타냄
  인자는 command가 작동할 대상을 지정한다.

  cal -y
  현재 년도에 해당하는 달력 출력
  -y는 '옵션'으로서 command의 구체적인 동작 방식을 지정한다.
  
  man command
  man : 공식 커멘드를 찾아 보는 방법. man 뒤에 찾고자 하는 커멘드를 입력시 해당 커멘드에 대한 설명을 알아낼 수 있음
  여기서 스페이스를 누르면 아래로 한 페이지 단위로 이동. b키를 누르면 위로 한 페이지 이동
```
  
  
## 2. 디렉토리
  
  * 디렉토리<br>
  폴더와 동일<br>
  
  * ~ (Tilde)<br>
  현재 사용자(지금 컴퓨터를 사용하고 있는 사용자)의 홈 디렉토리(사용자가 자신과 관련된 것을 모아놓은 디렉토리)<br>
  홈 디렉토리로 이동하기 위해서는 <strong>cd ~</strong>을 입력하면 된다.<br>
  
  * pwd<br>
  <strong>p</strong>rint the name of <strong>w</strong>orking <strong>d</strong>irectory. 현재 작업중인 디렉토리경로를 알려줌
  
  * / (root directory)<br>
  최상위 디렉토리를 나타냄. 부모 디렉토리이며 자식 디렉토리를 가짐.<br> 
  루트 디렉토리로 이동하기 위해서는 <strong>cd /</strong>을 입력하면 된다.<br>
  
  * cd 경로<br>
  <strong>c</strong>hange <strong>d</strong>irectory. 경로 변경. cd 뒤에 이동하고자 하는 경로를 인자로 입력<br>
  이때 경로는 절대 경로와 상대 경로 모두를 입력할 수 있다<br>
  
  * 절대 경로<br>
  root directory를 기준으로 하여 특정 디렉토리가 가지고 있는 고유 경로를 뜻함<br>
  경로가 root directory에서 부터 시작할 떄에는 절대경로에 해당 됨<br>
  ex) /Users/danny/Document<br>
  ex2) /<br>
  ex3) /Desktop<br>
  
  * 상대 경로<br>
  사용자의 현재 위치를 기준으로 나타낸 경로<br>
  경로가 복잡할 경우 절대 경로로 모든 경로를 일일이 입력하는 것보다 상대 경로를 이용하는 것이 유용하다<br>
  프로그램의 소스 코드 내에서 경로를 표시할 때 상대 경로로 써주어야 환경이 변하더라도 오류가 없다<br>
  예시) 경로가 /Users/danny/Documents/video, /Users/danny/Documents/Pictures인 경우<br><br>
  [1] <strong>.</strong><br>
  현재 위치한 디렉토리 <br>
  현재 위치가 /Users/danny/Documents일 경우 ./video는 /Users/danny/Document/video 와 동일 <br>
  video 디렉토리로 이동하기 위해서 /Users/danny/Documents/video를 입력할 수도 있고, ./video로 입력할 수도 있다<br>
  즉, .은 /Users/danny/Documents를 의미한다.<br><br>
  [2] <strong>..</strong><br>
  현재 디렉토리를 포함하는 부모 디렉토리<br>
  현재 위치가 /Users/danny/Docuemnts/Pictures인데, video로 이동하고 싶은 경우 ../video를 입력해야한다.<br>
  [3] <strong>직전 경로로 이동</strong><br>
  <strong>cd -</strong> 을 입력하면 직전에 위치했던 경로로 이동한다.<br>
  
  * ls (list the information about the files)<br>
  현재 디렉토리 내부의자식 디렉토리 리스트를 보여줌<br>
  ls -l : 디렉토리, 파일 크기, 최종 수정 날짜 등 상세정보까지 나타냄<br>
         (-l : long listing format. 세부정보를 긴 리스트로 나타내는 옵션)<br>
  ls -a : 디렉토리 내 숨겨진 자식 디렉토리 확인 가능 .이 찍혀져 있는 디렉토리 확인 (-a : all의 줄임말)<br>
  ls -d : 디렉토리 자체 정보를 나타냄<br>
  <strong>ls command의 인자</strong> : 특정 디렉토리의 정보를 알고 싶을 때 이용<br>
  <strong>-d 옵션</strong> : 디렉토리 자체의 정보를 알고 싶을 때 이용<br>
  
  * mkdir<br>
  make directory. 디렉토리 생성. mkdir + 만들고 싶은 디렉토리명 꼴로 사용한다.<br>
  
  * touch<br>
  파일 생성. <strong>touch + 만들고 싶은 파일 명</strong> 꼴로 사용<br>
  
  * mv<br>
  move. 디렉토리나 파일을 옮김. 혹은 디렉토리나 파일의 이름을 변경할 수 있다. (mv+바꿀 대상+바뀔이름)<br>
  
  * cp<br>
  copy & paste. 복사 및 붙여넣기. 복사할 파일에 내용이존재시 복사될 파일의 내용으로 덮어쓰는것에 유의<br>
  ex) cp file1 file2 -> 복사될 파일(file1)을 앞에 써주고 복사할 파일(file2)을 뒤에 써준다<br>
  
  * cp -i<br>
  interactive. 덮어 쓸 것인지 물어보는 i옵션을 사용해서 덮어쓰기에 유의하며 작업을 하도록 하자<br>
  
  * cp -r<br>
  recursive. 디렉토리를 복사&붙여넣기시 자식 디렉토리가 존재한다면 자식 디렉토리 내부의 것도 복사&붙여넣기 함<br>
  
