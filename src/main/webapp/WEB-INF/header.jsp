<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/reset.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}css/calander.css"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}js/index.global.min.js"></script>
  </head>
  <body>
    <header>
      <div class="addgroup">
        <button id="addgroup3">
          <i class="fa-solid fa-plus"></i>
        </button>
      </div>

      <div class="modalgroup">
        <button id="groupmake" class="addgroup2">
          <i class="fa-solid fa-plus"></i>
          <p>그룹 생성</p>
        </button>

        <button id="grouppart" class="addgroup2">
          <i class="fa-solid fa-plus"></i>
          <p>그룹 참가</p>
        </button>
      </div>

      <div class="group" id="group1"></div>

      <div class="user" id="header2">
        <i class="fa-solid fa-user" id="myUser"></i>
      </div>
    </header>

    <div class="mymodal">
      <header id="myHeader"></header>
      <i class="fa-solid fa-earth-americas" id="myImg"></i>
      <div id="nameSection">
        <h1 id="myName"></h1>
        <p id="myId">test1234</p>
      </div>
      <c:if test="${empty token}">
        <button type="button" id="logout">로그아웃</button>
      </c:if>
      <c:if test="${not empty token}">
        <button type="button" id="logout2">로그아웃</button>
      </c:if>
    </div>

    <div id="modal1" class="modal">
      <div class="modalcontent">
        <p class="close">&times</p>
        <h2>그룹 추가</h2>
        <hr />
        <br />
        <p>
          새로운 그룹에 이름을 부여해 <br />
          동료들과 함께해 보세요
        </p>
        <section class="mid">
          <h3>새 그룹 명</h3>
          <br />
          <input type="text" id="textbox" />
          <div class="add">
            <button id="addGroup" class="add2">만들기</button>
            <div id="successText"></div>
          </div>
        </section>
      </div>
    </div>
    <div id="modal2" class="modal">
      <div class="modalcontent">
        <p class="close">&times</p>
        <h2>그룹 참가</h2>
        <hr />
        <br />
        <p>
          아래에 전달받은 그룹명을 입력해<br />
          그룹에 참여해보세요
        </p>
        <section class="mid">
          <h3>그룹 코드</h3>
          <br />
          <input type="text" placeholder="ex) Forever404" id="inputatt" />
          <div class="add">
            <button id="attend" class="add2">그룹 참가하기</button>
          </div>
        </section>
      </div>
    </div>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
      // 그룹 생성
      $(".add2").click(() => {
        const title = $("#textbox").val().trim();
        const miniTitle = title.substring(0, 2);
        $.ajax({
          type: "post",
          url: "/addGroup",
          data: { groupName: title },
          success: function (response) {
            if (response) {
              $(".group").append(
                "<button type='button' data-code='" +
                  title +
                  "' class='groupButton' id='" +
                  miniTitle +
                  "'>" +
                  miniTitle +
                  "</button><span>" +
                  title +
                  "</span>"
              );
              window.location.reload();
            } else {
              $("#successText").text("사용할 수 없는 그룹명입니다.");
            }
          },
        });
      });

      // 그룹 참가
      $("#attend").click(() => {
        const title = $("#inputatt").val();
        $.ajax({
          type: "post",
          url: "/attendGroup",
          data: "groupName=" + title,
          success: function (check) {
            if (check === true) {
              alert("그룹 참여 성공");
            } else {
              alert("그룹 참여 실패");
            }
            location.reload();
          },
          error: function () {
            alert("그룹 참여 실패");
          },
        });
      });
    </script>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
      // 로그아웃 후, 남은 세션 및 로컬 스트로지 정리
      $("#logout").click(function () {
        $.ajax({
          type: "post",
          url: "/logout",
          success: function () {
            alert("로그아웃 처리 되었습니다!");
            localStorage.clear();
            sessionStorage.clear();
            window.location.href = "/";
          },
        });
      });
      ///카카오 로그아웃
      Kakao.init("416439531d0e4d8f33eb240c9b791ffb");

      $("#logout2").click(function () {
        $.ajax({
          type: "post",
          url: "/logout",
          success: function () {
            Kakao.Auth.logout();
            alert("로그아웃 처리 되었습니다!");
            localStorage.clear();
            sessionStorage.clear();
            window.location.href = "/";
          },
        });
      });
    </script>
    <script>
      // 페이지 시작 시 특정 유저가 가진 그룹을 가져오는 로직

      $(document).ready(function () {
        $.ajax({
          type: "post",
          url: "/userGroup",
          success: function (list) {
            const groupList = list.map((item) => item.bigGroup);
            const nameList = groupList.map((value) => value.groupName);
            nameList.forEach((value) => {
              const miniTitle = value.substring(0, 2);
              $(".group").append(
                "<button type='button' data-code='" +
                  value +
                  "' class='groupButton' id='" +
                  miniTitle +
                  "'>" +
                  miniTitle +
                  "</button><span>" +
                  value +
                  "</span>"
              );
            });
            // 그룹 별 페이지 구분을 위한 그룹네임 데이터를 로컬 스트로지에 담음

            const button = document.querySelectorAll(".groupButton");
            button.forEach((e) => {
              e.addEventListener("click", () => {
                const code = e.getAttribute("data-code");
                localStorage.setItem("groupName", code);
                let groupName = localStorage.getItem("groupName");
                window.location.href = "/" + code;
              });
            });
          },
        });
      });
    </script>

    <script>
      // 로그아웃 기능을 위한 아이디 구현
      $(".user").click(function () {
        $.ajax({
          type: "post",
          url: "/myPage",
          success: function (result) {
            $("#myName").text(result.id);
            $("#myId").text(result.name);
          },
        });
      });
    </script>
  </body>
</html>
