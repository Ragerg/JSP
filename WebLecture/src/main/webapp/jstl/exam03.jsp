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
		당신은 슈퍼관리자. 메세지 출력
		http://localhost:8080/WebLecture/jstl/exam02.jsp?type=U 요청시
		당신은 일반 사용자. 메세지 출력
	 --%>
	<c:choose> 
		<c:when test="${ param.type == 'S' }">
			<h2>당신은 슈퍼관리자</h2>
		</c:when>
		<c:when test="${ param.type eq 'U' }">
			<h2>당신은 일반 사용자</h2>
		</c:when>
		<c:otherwise>
			<h2>잘못된 경로로 접근했습니다</h2>
		</c:otherwise>
	</c:choose>
	</body>
</html>