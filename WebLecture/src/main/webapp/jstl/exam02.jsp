<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		http://localhost:8080/WebLecture/jstl/exam02.jsp?type=S 요청시
		관리자님 환영합니다. 메세지 출력
		http://localhost:8080/WebLecture/jstl/exam02.jsp?type=U 요청시
		일반사용자님 환영합니다. 메세지 출력
	 --%>
	 
	<c:if test="${ param.type == 'S' }">
		<h2>관리자님 환영합니다</h2>
	</c:if>
	<c:if test="${ param.type eq 'U' }">
		<h2>일반사용자님 환영합니다</h2>
	</c:if>
	</body>
</html>