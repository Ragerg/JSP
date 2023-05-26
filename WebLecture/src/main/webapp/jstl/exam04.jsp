<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%
	String[] names = {"강길동", "홍길동", "윤길동", "박길동", "김길동"};
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("length", names.length);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	5 : 1.5버전의 for문 // 
	<c:forEach items="${ names }" var="name">
	${ name }&nbsp;&nbsp;
	</c:forEach>
	<br>
	4 : 함수 사용 // 
	<c:forEach begin="0" end="${ fn:length(names) }" var="i">
	${ names[i] }&nbsp;&nbsp;
	</c:forEach>
	<br>
	3 : 공유영역에 length 변수 추가 // 
	<c:forEach begin="0" end="${ length }" var="i">
	${ names[i] }&nbsp;&nbsp;
	</c:forEach>
	<br>
	2 : 길이만큼 반복// 
	<c:forEach begin="0" end="4" var="i">
	${ names[i] }&nbsp;&nbsp;
	</c:forEach>
	<br>
	1 : 
	${ names[0] }&nbsp;&nbsp;
	${ names[1] }&nbsp;&nbsp;
	${ names[2] }&nbsp;&nbsp;
	${ names[3] }&nbsp;&nbsp;
	${ names[4] }&nbsp;&nbsp;
	<br>
	년도선택 : 
	<select>
		<c:forEach begin="1960" end="2023" var="year">
		<option>${ year }</option>
		</c:forEach>
	</select>
	<br>
	<c:forEach begin="1" end="10" var="i">
		${ i }&nbsp;&nbsp;
	</c:forEach>
	<br>
</body>
</html>