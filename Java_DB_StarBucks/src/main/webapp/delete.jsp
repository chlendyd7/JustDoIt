<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원탈퇴 -->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ȸ��Ż��</title>
<link rel="stylesheet" href="login.css">
<script src="https://kit.fontawesome.com/a177ebec54.js" crossorigin="anonymous"></script>
</head>
<body>
<%
if(session.getAttribute("input_id")==null){
	response.sendRedirect("./Home.jsp");
}else{
%>
<div class="main-container">
		<div class="main-warp">
		<header>
			<div class="logo-warp" style="text-align:center;">
				<img width=300px height=300px src="./logo.png">
			</div>
		</header>

<form name="myform" action="deleteAction.jsp" method="post">

<section class="login-input-section-wrap">
	<div class="login-input-wrap">
			
<%
    Object lobj_getdata = session.getAttribute("input_id");//세션에 저장된 값 불러옴
	String input_id = (String) session.getAttribute("input_id");
	out.println(" " + input_id);%>
    
	</div>

<div class="login-input-wrap password-wrap">
<input placeholder="  비밀번호" type=password name="input_pw"  size="15" maxlength="12"><br/><br/><br/>
</div>

<div class="login-button-wrap">     
<br/> 
<input type=submit value="회원탈퇴"><br/>
<input type="button" value="취  소" onclick="location.href='Home.jsp'">
<br/>
</div>
</section>
</form>
<form>
<br/><br/>
			<div class="w3-content w3-section" style="max-width:500px; max-height:300px">
				<a href="https://www.starbucks.co.kr/index.do"><img class="mySlides" src="img1.jpg" style="height:300px; width:100%"></a>
				<a href="https://www.starbucks.co.kr/index.do"><img class="mySlides" src="img2.jpg" style="height:300px; width:100%"></a>
				<a href="https://www.starbucks.co.kr/index.do"><img class="mySlides" src="img3.jpg" style="height:300px; width:100%"></a>
			</div>

			<script>
			var myIndex = 0;
			carousel();

			function carousel() {
  				var i;
  				var x = document.getElementsByClassName("mySlides");
  				for (i = 0; i < x.length; i++) {
   				x[i].style.display = "none";  
  				}
  				myIndex++;
  				if (myIndex > x.length) {myIndex = 1}    
  				x[myIndex-1].style.display = "block";  
  				setTimeout(carousel, 2500); // Change image every 2 seconds
				}
				</script>
			</form>
</div>
</div>
</body>
</html>
<%}%>