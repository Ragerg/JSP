<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
	<title>로그인</title>


<body>
      <%@ include file="/jsp/include/header.jsp" %>
    <c:if test="${not empty user}">
      <script>alert("이미 로그인 되었습니다."); location.href = "index.do";</script>
    </c:if>
    <script src="https://developer.kakao.com/sdk/js/kakao.js"></script>
    <script src="${pageContext.request.contextPath }/assets/loginAPI.js"></script>
    <section class="section">
      <form action="${ pageContext.request.contextPath }/loginProcess.do" method="post">
<div class="container">
        <h1 class="my-3 text-primary">로그인</h1>
        <div class="form-floating">
          <label for="floatingInput">ID</label>
          <input type="text" class="form-control" id="floatingInput" name="id" value="${cookie.id.value }"
            placeholder="name@example.com">
          </div>
          <br>
            <label for="floatingPassword">비밀번호</label>
          <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
          </div>

        <div class="checkbox mb-3">
          <label> <input type="checkbox" name="saveID" value="check"> Remember me
          </label>
          </div>
          <button class="btn btn-primary" type="submit">로그인</button>
        <a href="javascript:kakaoLogin();"><img src="${ pageContext.request.contextPath }/images/kakao_login_medium_narrow.png" class="kakaoLogin"></a>
       <div>
       <hr>
          아직 회원이 아니신가요? |<a href="joinPage.do"> 회원가입하기</a>
        </div>
</div>
      </form>
    </section>
	
	<%@ include file="/jsp/include/footer.jsp" %>
</body>

</html>