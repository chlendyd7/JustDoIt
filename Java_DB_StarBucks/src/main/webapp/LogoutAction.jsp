<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!-- 로그아웃 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
	session.removeAttribute("input_id");
	response.sendRedirect("./Home.jsp");
	%>
</body>
</html>