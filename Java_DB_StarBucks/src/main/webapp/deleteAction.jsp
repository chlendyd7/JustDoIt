<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="DAO.memberDAO" %>
<!-- 회원탈퇴 -->

<%
String input_id =(String)session.getAttribute("input_id");
String input_pw = request.getParameter("input_pw");
memberDAO DAO=new memberDAO();
boolean result = DAO.memberDelete(input_id, input_pw);
if(result){
session.invalidate();
}
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

회원정보가 삭제되었습니다.<br/>
<input type= "button" value="확인" onClick="location.href='Home.jsp'">

</body>
</html>
