<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 웹브라우저가 보여주지 않을 뿐 소스코드엔 보인다 -->
<%-- JSP주석은 서블릿으로 변환될 때 변환되지 않는다 --%>
<%-- 개발자면 이거 쓰세요!! --%>

	<%-- 
		http://localhost:8080/WebLecture/el/exam01.jsp?name=hong 입력시 hong 출력 
	--%>

	<%-- name 이 없을 때 이름 : null --%>
	이름 : <%= request.getParameter("name") %> <br> 
	<%-- name 이 없을 때 이름 : 비어있음 empty --%>
	이름 : ${ param.name }<br>
	ID : ${ param.id }<br>


</body>
</html>