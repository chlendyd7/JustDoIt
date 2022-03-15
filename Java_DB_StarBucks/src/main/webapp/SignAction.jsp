<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="DAO.memberDAO" %>
<%@page import="java.sql.PreparedStatement"%>
<!-- 회원가입 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
id_check=DAO.checkDuplicateID(input_id);
if(id_check==false){
	System.out.println("중복 아이디가 존재합니다.");
} else {
	if(input_pw.equals(password_confirm)==false){
		System.out.println("비밀번호가 일치하지 않습니다.");
	}
	else {
		DAO.memberInsert(input_name, input_id, input_pw, input_address);
		System.out.println("회원가입 완료!"); 
		response.sendRedirect("./Home.jsp");
	}
}
%>
</body>
</html>