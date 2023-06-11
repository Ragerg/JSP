<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String msg = "";
		String locUrl = "";
			msg = "회원정보수정이 완료되었습니다.\n마이페이지로 돌아갑니다.";
			locUrl = "myPage.do";
		pageContext.setAttribute("msg", msg);
		pageContext.setAttribute("url", locUrl);
%>   

<script>
	alert('<%=msg.replace("\n", "\\n")%>')
	location.href = '${ url }'
</script>


