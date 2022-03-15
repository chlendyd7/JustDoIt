<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="DAO.memberDAO" %>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String input_name=request.getParameter("input_name");
String input_id=request.getParameter("input_id");
String input_pw=request.getParameter("input_pw");
String input_address=request.getParameter("zonecode ") + request.getParameter("address") + request.getParameter("detail");

String password_confirm=request.getParameter("password_confirm");

PreparedStatement pstmt = null;
boolean id_check=false;
boolean password_check=false;
memberDAO DAO=new memberDAO();
if(input_pw.equals(password_confirm)==false){
	System.out.println("비밀번호가 일치하지 않습니다.");
	response.sendRedirect("./Home.jsp");
}
else {
	DAO.memberUpdatePw(input_pw,input_id);
	DAO.memberUpdateName(input_name,input_id);
	DAO.memberUpdateAddress(input_address,input_id);
	System.out.println("회원정보 수정 완료!");
	response.sendRedirect("./Home.jsp");
}
%>
</body>
</html>