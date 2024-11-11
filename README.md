<h1>Team Project : Trip Scheduler</h1>
<h2>편리화된 커스터마이징 여행 커뮤니티</h2>

<h1>주제 선정 배경</h1>
<ul>
  <li>여행 계획 및 일정 관리의 효율성 증대</li>
  <li>여행 참가자들이 일정을 쉽게 확인하고 조정</li>
  <li>여행 정보 공유 제공</li>
  <li>여행 스타일 및 취향에 맞는 맞춤형 일정 제시</li>
</ul>

<h1>팀원 소개</h1>
<img src="https://github.com/user-attachments/assets/48174082-ffab-4b52-83b4-e93de01e361d">




<h1>전체 기술 스택</h1>
<p>HTML5, CSS3, JavaScript, Spring Boot, Java, MySQL, MyBatis, JSP</p>

<h1>DB 모델링</h1>
<img src="https://github.com/user-attachments/assets/7b14ea66-ee52-42bb-a6ff-bc6159b216e3">


<h1>코드 리뷰</h1>
  <h2>1.index 페이지</h2>
  <h3>#My work:페이지 총 디자인 및 구현</h3>
  <h3>#Team work:회원가입 디자인 및 기능 구현, 로그인 기능 구현, 카카오로그인 API 사용</h3>

  <p>접속 시 가장 먼저 보이는 사이트 소개 페이지입니다. 로그인 창이 모달로 구현되어있으며 회원가입, 개발자 탭 클릭 시 
      해당하는 페이지로 이동합니다. 
  </p>
  
<img src="https://github.com/user-attachments/assets/d5811e3b-d39e-4c3d-930a-054ac946a2df">


<h4>자바스크립트를 이용한 캐러셀 형식 사용 코드</h4>

<p> 가장 첫 페이지인 인덱스페이지이자 Trip Scheduler를 소개하는 페이지입니다. 

로그인과 회원가입을 하게 되는 페이지이며

한 눈에 들어올 수 있도록 화면을 꽉 채운 뒤 자바스크립트 캐러셀 형식으로 구성하였습니다.

4개의 섹션으로 구성되어있으며, 각 섹션에 width값 100%를 줘 4개의 섹션 중 1개의 섹션만 보이게 한 후,

섹션의 인덱스를 0으로 저장하는 변수를 사용하여 

버튼을 클릭했을 때 총 섹션 수를 나눈 나머지 값에 인덱스 변수를 더하거나 빼는 기능을 만들어 화면이 이동하도록 하였으며

translateX를 사용해 한 번 이동 시 인덱스 값 곱하기 100% 만큼 이동시켜 수평으로 움직이게 만들었습니다.

추가로 setInterval을 사용해 주기적으로 자동 화면 전환이 되게 하였습니다.
</p>

<img src="https://github.com/user-attachments/assets/4f294b58-241e-46e5-9729-2eb1d1c650ba">


<h4>aos 라이브러리를 이용한 fade-in, fade-out 경험</h4>

<p>한 눈에 들어오는 디자인을 위해 fade-in, fade-out을 구현해보고 싶었으나, 당시 부족했던 기술과 jQuery의 존재를 몰라

aos라는 이름의 라이브러리를 사용하여 fade-in, fade-out을 구현하였습니다. 

간편하게 각기 다른 방향에서 fade-in,out이 가능하였으며 deley와 duration 또한 쉽게 사용 가능했습니다.

</p>

<img src="https://github.com/user-attachments/assets/bd12dfbd-9d63-4271-bb2f-5d6393bc2f19">

  <h2>developer 페이지</h2>
  <h3>#My work:페이지 총 디자인 및 구현</h3>
  <h3>#Team work:index페이지와 기능 연동</h3>

  <p>팀원들을 소개하는 페이지입니다. 개발자 페이지에서도 로그인, 회원가입이 가능하도록 같은 기능이 추가되어있습니다.</p>

  <h2>calendar 페이지</h2>
  <h3>#My work:</h3>
  <h3>#Tema work:</h3>

  <p></p>

  <h2>detail 페이지</h2>
  <h3>#My work:</h3>
  <h3>#Tema work:</h3>

  <p></p>


  <h2>kakaomap 페이지</h2>
  <h3>#My work: 검색 창 디자인 및 자바스크립트 구현</h3>
  <h3>#Tema work: 카카오맵 API연동, 챗GPT API 연동, 이미지 크롤링</h3>

  <p>세부일정 추가 시 카카오맵과 연동하여 원하는 장소를 검색하고 추가할 수 있게 하였으며, 계획이 없는 사용자들을 위해 

  장소를 추천받을 수 있도록 챗GPT와 연동했습니다. 장소를 선택 시 이미지 크롤링되어 구글에서 임의의 이미지가 선택 후 세부일정에 함께 출력되도록 했습니다.
  </p>
