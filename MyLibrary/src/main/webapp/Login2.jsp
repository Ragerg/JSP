<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
</head>
<body>
<%
//현재 로그인상태인지?
boolean isLogin = session.getAttribute("id") != null;

if(isLogin) {
	//로그인이 되어있으면 메인서비스 페이지로 이동
	response.sendRedirect("Main.jsp");
} else {
//로그인 안 되어있으면 id, pw 입력받아서 로그인서블릿로 id,pw 넘김
%>
<h1>Login</h1>
<form action="/example1/LoginServlet2" method="post" onsubmit="return check()">
<label> ID : <input type="text" id="id" name="id" placeholder="아이디" ></label><br>
<label> PW : <input type="password" id="pw" name="pw" placeholder="비밀번호" ></label><br>
<input type="submit" value="로그인">
</form>

<script>
  function check() {
    let id = document.getElementById("id").value;
    let pw = document.getElementById("pw").value;

    if (id === "" || pw === "") {
      alert("아이디와 비밀번호를 모두 입력해주세요.");
      return false;
    }

    return true;
  }
</script>

<%
}
%>


</body>
</html>