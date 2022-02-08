<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>
	<% String searching="true";
	session.setAttribute("searching", searching); %>
	<jsp:include page="main_jsp.jsp"/>
</body>
</html>