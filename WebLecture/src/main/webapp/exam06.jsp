<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookVO[] book1 = new BookVO[2];
	for (int i = 0; i < book1.length; i++) {
		book1[i] = new BookVO();		
	}
	book1[0].setTitle("성공");
	book1[1].setTitle("실패");
	pageContext.setAttribute("books1", book1);


	Map[] book2 = new Map[2];
	for (int i = 0; i < book2.length; i++) {
		book2[i] = new HashMap<>();		
	}
	book2[0].put("title", "성공");
	book2[1].put("title", "실패");
	pageContext.setAttribute("books2", book2);
	
	
	ArrayList<String> nameList = new ArrayList<>();
	nameList.add("홍길동");
	nameList.add("강길동");
	nameList.add("고길동");
	
	ArrayList<BookVO> book3 = new ArrayList<>();
	for (int i = 0; i < 2; i++) {
		book3.add(new BookVO());		
	}
	book3.get(0).setTitle("성공");
	book3.get(1).setTitle("실패");
	pageContext.setAttribute("books3", book3);

	
	ArrayList<Map<String, String>> book4 = new ArrayList<>();
	for (int i = 0; i < 2; i++) {
		book4.add(new HashMap<>());
	}
	book4.get(0).put("title", "성공");
	book4.get(1).put("title", "실패");
	pageContext.setAttribute("books4", book4);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 성공 출력 --%>
	성공/실패?? <br>
	1 : ${ books1[0].title }<br>
	2 : ${ books2[0].title }<br>
	3 : ${ books3[0].title }<br>
	4 : ${ books4[0].title }<br>
</body>
</html>