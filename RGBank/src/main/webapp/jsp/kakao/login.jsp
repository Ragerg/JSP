<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
    <h1>로그인</h1>
    <a href="javascript:kakaoLogin()"><img src="${ pageContext.request.contextPath }/image/kakao_login_large_narrow.png"/></a>
    <a href="javascript:kakaoLogin()"><img src="${ pageContext.request.contextPath }/image/kakao_login_large_wide.png"/></a>
    <a href="javascript:kakaoLogin()"><img src="${ pageContext.request.contextPath }/image/kakao_login_medium_narrow.png"/></a>
	<!--     이게 제일 나아보임 -->
    <a href="javascript:kakaoLogin()"><img src="${ pageContext.request.contextPath }/image/kakao_login_medium_wide.png"/></a>
</div>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
    Kakao.init('');
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        alert(JSON.stringify(response))
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
    }
</script>
</body>
</html>