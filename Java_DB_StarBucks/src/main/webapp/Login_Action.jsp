<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="DAO.memberDAO" %>
<!-- 로그인 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


</head>
<body>
<%
String input_id = request.getParameter("input_id");
String input_pw = request.getParameter("input_pw");

	memberDAO DAO= new memberDAO();
	boolean result=DAO.memberSelect(input_id, input_pw);
	
	if(result==true){
		System.out.println("로그인 성공!: 세션에 값 저장!");
		session.setAttribute("input_id", input_id);
		response.sendRedirect("./Home.jsp");

	}else{
		System.out.println("로그인 실패!");
		response.sendRedirect("./Home.jsp");
	}
%>



</body>
</html>