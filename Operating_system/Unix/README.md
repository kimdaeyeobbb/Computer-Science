# Unix & Command line (명령행)


## Unix
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
```
  
