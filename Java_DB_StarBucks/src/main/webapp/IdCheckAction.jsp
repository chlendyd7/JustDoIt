<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="DAO.memberDAO" %>
<!-- 아이디 중복확인 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
<div style="text-align: center"></div> 
<h3>* 아이디 중복 확인 결과 *</h3> 
<% 
//1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함 
String input_id=request.getParameter("input_id"); 
memberDAO dao=new memberDAO();
boolean id_check=dao.checkDuplicateID(input_id); 
int cnt=0;
out.println("입력 ID : <strong>" + input_id + "</strong>"); 
if(id_check==true){ 
	out.println("<p>사용 가능한 아이디입니다.</p>"); 
	out.println("<a href=\"javascript:apply(\'" + input_id + "\')\">[적용]</a>");
%>
<script> 
function apply(input_id){ 
	//2) 중복확인 id를 부모창에 적용 
	//부모창 opener 
	alert("apply");
	opener.document.regForm.input_id.value=input_id;
	opener.document.regForm.input_id.readOnly=true;
	opener.document.regForm.input_id.style.backgroundColor='gray';
	window.close(); //창닫기 
	}//apply () end 
</script> 
	<% }else{ 
		out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>"); }//if end %> <hr> 
		<a href="javascript:history.back()">[다시시도]</a> 
		&nbsp; &nbsp; 
		<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>