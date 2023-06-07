<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/RgLibrary/css/layout.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
      crossorigin="anonymous"></script>
    <script>
      function checkForm(e) {
        let f = document.loginForm

        if (f.id.value === '') {
          alert('ID를 입력하세요');
          id.focus();
          return false;
        }

        if (f.password.value === '') {
          alert('비밀번호를 입력하세요');
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

      /* 로그인 폼 스타일 */
      #login {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }

      button[type="submit"] {
        padding: 8px 20px;
        background-color: black;
        color: #fff;
        border: none;
        cursor: pointer;
      }

      #loginBtn {
        width: 300px;
      }

      #login a {
        margin-left: 0.4em;
      }

      #login a.hover {
        color: #FFD966;
      }
    </style>
  </head>

  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section id="login">
      <h2>로그인</h2>
      <form method="post" action="loginProcess.do" name="loginForm" onsubmit="return checkForm()">
        <div class="form-group">
          <label for="id">ID</label>
          <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요" />
        </div>
        <button type="submit" class="btn btn-primary" id="loginBtn">로그인</button>
      </form>
      <%-- 아이디 찾기, 비밀번호 찾기, 회원가입 링크 --%>
        <div>
          <!-- <a href="findId.do">아이디 찾기</a> |
                          <a href="findPassword.do">비밀번호 찾기</a> | -->
          아직 회원이 아니신가요? |<a href="joinPage.do">회원가입하기</a>
        </div>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>