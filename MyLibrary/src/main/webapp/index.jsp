<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="/MyLibrary/css/layout.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
      crossorigin="anonymous"
    ></script>
    <script>
      function checkForm(e) {
        let f = document.loginForm;

        if (f.id.value === "") {
          alert("ID를 입력하세요");
          id.focus();
          return false;
        }

        if (f.password.value === "") {
          alert("비밀번호를 입력하세요");
          password.focus();
          return false;
        }

        return true;
      }
    </script>
    <style>
      /* 폼 스타일 */
      form {
        margin-bottom: 20px;
      }

      input[type="text"],
      input[type="password"] {
        padding: 8px;
        width: 300px;
      }

      /* 검색 폼 스타일 */
      #search {
        display: inline-block;
      }

      /* 로그인 폼 스타일 */
      #login {
        float: right;
        margin-right: 5em;
      }

      button[type="submit"] {
        padding: 8px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <header><%@ include file="/jsp/include/top.jsp" %></header>
    <section>
      <section id="login">
        <h2>로그인</h2>
        <form
          method="post"
          action="./jsp/login/loginProcess.jsp"
          name="loginForm"
          onsubmit="return checkForm()"
        >
          <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" />
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input
              type="password"
              class="form-control"
              id="password"
              name="password"
            />
          </div>
          <button type="submit" class="btn btn-primary">로그인</button>
        </form>
      </section>

      <section id="home">
        <!-- 도서관 소개 -->
        <h2>도서관 소개</h2>
        <p>도서관에 대한 소개 내용이 여기에 들어갑니다.</p>
      </section>

      <section id="search">
        <!-- 도서 검색 -->
        <h2>도서 검색</h2>
        <form>
          <div id="search">
            <input type="text" class="form-control" placeholder="도서 검색" />
          </div>
          <div id="search">
            <button type="submit" class="btn btn-primary">검색</button>
          </div>
        </form>
        <!-- 검색 결과 표시 -->
        <div id="search-results">
          <!-- 검색 결과를 동적으로 표시할 부분 -->
        </div>
      </section>

      <section id="services">
        <!-- 이용 안내 -->
        <h2>이용 안내</h2>
        <p>
          도서 대출 및 반납 절차, 회원 가입 방법, 이용 요금 등에 대한 안내
          내용이 여기에 들어갑니다.
        </p>
      </section>

      <section id="join">
        <!-- 회원가입 -->
        <h2>회원가입</h2>
        <p>회원가입 페이지 만들기</p>
      </section>
    </section>
    <footer><%@ include file="/jsp/include/bottom.jsp" %></footer>
  </body>
</html>
