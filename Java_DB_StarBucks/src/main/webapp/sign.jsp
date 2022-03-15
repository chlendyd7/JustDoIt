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
<link rel="stylesheet" href="css/bootstrap.css">
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
	form.submit();
	alert("완료!");
}
</script>
</head>
<body>
	<div class="container">
	<div class="col-log-4"></div><%-- 굵기 변경 --%>
	<div class="col-log-4">
		<div class="jumbotron" style="padding-top: 20px;"><%-- 위의 회색 빈공간 --%>
		<form name="regForm" action="./SignAction.jsp" method="post"><%-- joinAction 페이지로 암호화한 정보를 보냄 --%>
		
		<h3 style="text-align: center;">회원가입 화면</h3>
		
		<div class="form-group">
			<input type="text" class="form-control" placeholder="이름" id="input_name" name="input_name" maxlength="20">
		</div>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="아이디" name="input_id" id="input_id" maxlength="20">
			<br>
			<input type="button" class="btn btn-success form-control" value="아이디 중복체크" checked onclick="IdCheck()">
		</div>
		<div class="form-group">
				<input type="password"class="form-control" placeholder="비밀번호 입력" id="input_pw" name="input_pw" maxlength="20">
		</div> 
		<div class="form-group">
				<input type="password"class="form-control" placeholder="비밀번호 확인" name="password_confirm" maxlength="20">
		</div> 
		
		<input type="button" class="btn btn-success form-control" id="find_button" value="주소 검색"> <br>
		<br>
		<div class="form-group">
				<input type="text"class="form-control" placeholder="우편번호" name="zonecode" id="zonecode" readonly>
		</div> 
		
		<div class="form-group">
				<input type="text"class="form-control" placeholder="도로명주소" name="address" id="address" readonly>
		</div> 
		
		<div class="form-group">
				<input type="text"class="form-control" placeholder="상세주소" name="detail" maxlength="20">
		</div> 
		<div>
					<input type="submit" class="btn btn-success form-control" value="회원가입">
					</div>
		</form>
			</div>

			
		
	</div>
	</div>
	
</body>
</html>