<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

    <meta charset="UTF-8">
    <title>로그인</title>
  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section id="login">
      <h2>로그인</h2>
      <form method="post" action="${ pageContext.request.contextPath }loginProcess.do" name="loginForm" onsubmit="return checkForm()">
        <div class="form-group">
          <label for="id">ID</label>
          <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요" />
        </div>
        <button type="submit" class="btn btn-primary" id="loginBtn">로그인</button>
        <a href="javascript:kakaoLogin()"><img src="${ pageContext.request.contextPath }/image/kakao_login_medium_wide.png"/></a>
      </form>
        <div>
          아직 회원이 아니신가요? |<a href="joinPage.do">회원가입하기</a>
        </div>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
    <script src="https://developer.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	window.Kakao.init("3be059b28175bae0d5c7b1b5d47bd7a8");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile_nickname, account_email, gender, birthday',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
					}
				});
			}
		})
	}
</script>
  </body>

  </html>