<%@page import="DAO.memberDAO"
import="java.sql.ResultSet"
%>
<%@ page language="java"
    pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/sign.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-Latest.min.js"><</script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"><</script>

<script>
$(window).on("load",function(){
	$("#find_button").click(function(){
		alert("find!");
		
		new daum.Postcode({
			
			oncomplete:function(data) {
				
				jQuery("#zonecode").val(data.zonecode);
				jQuery("#address").val(data.address);
				
				jQuery("#detail").focus();
				
				$("#zonecode").css({background:"gray"});
				$("#address").css({background:"gray"});
			}
		}).open();
	});
})
</script>

<script>
function IdCheck(){
	alert("IdCheck!");
	
	window.open("IdCheckForm.jsp", "idwin", "width=400, height=350");
}

function checkform() {
	var form = document.regForm;
	if(form.input_id.value=="") {
		alert("아이디를 입력해주세요");
		form.input_id.focus();
		return false;
	} else if (form.password.value == "") {
		alert("비밀번호를 입력해주세요");
		form.password.focus();
		return false;
	} else if (form.password.value != form.password_confirm.value) {
		alert("비밀번호 불일치");
		return false;
	}
	alert("완료!");
	form.submit();
}
</script>
</head>
<body>
<%
String input_id = (String) session.getAttribute("input_id");
memberDAO dao=new memberDAO();
ResultSet rs=dao.memberInfo(input_id);
String input_name = null;
String input_pw = null;
String input_address = null;
while(rs.next()){
	input_name=rs.getString("member_name");
	input_pw=rs.getString("member_pw");
	input_address=rs.getString("member_address");
}

%>
	<form name="regForm" action="./updateAction.jsp" method="post" >
		<label for="input_name">이름:</label>
		<input type="text" name="input_name" id="input_name" value="<%=input_name %>" placeholder="이름을 입력하세요"> <br>
		<label for="input_id">아이디:</label>
		<input type="text" name="input_id" id="input_id" readOnly=true style="background-color: gray;" value="<%=input_id %>" > <br>
		<input type="button" onclick="IdCheck()" value="아이디 중복체크"> <br>
		<label for="input_pw">비밀번호:</label>
		<input type="password" name="input_pw" value="<%=input_pw%>" placeholder="비밀번호를 입력하세요"> <br>
		<label for="password_confirm">비밀번호 확인:</label>
		<input type="password" name="password_confirm" value="<%=input_pw%>" placeholder="비밀번호확인"> <br>
		<label for="input_address">주소</label>
		<input type="button" id="find_button" value="주소 검색"> <br>
		
		<input type="text" name="zonecode" id="zonecode" placeholder="우편번호" readonly> <br>
		<input type="text" name="address" id="address" value="<%=input_address %>" placeholder="도로명주소" readonly> <br>
		<input type="text" name="detail" id="detail" placeholder="상세주소"> <br>
		
		
		<input type="submit" value="수정" id="signBtn" onclick="checkform()">
	</form>
</body>
</html>