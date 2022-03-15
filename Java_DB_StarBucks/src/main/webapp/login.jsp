<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스 로그인</title>
<link rel="stylesheet" href="login.css">
<style>
.mySlide {display:none;}
</style>
<script src="https://kit.fontawesome.com/a177ebec54.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="main-container">
		<div class="main-warp">
		<header>
			<div class="logo-warp" style="text-align:center;">
				<img width=300px height=300px src="./logo.png">
			</div>
		</header>
		<form action="./Login_Action.jsp" method=post>
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">
				
				<input placeholder="  아이디" type="text" name="input_id">
				
			</div>
			<div class="login-input-wrap password-wrap">
				<input placeholder="  비밀번호" type="password" name="input_pw">
			</div>
			<div class="login-stay-sign-in">
				<input type="checkbox">&ensp;로그인 상태 유지
			</div>	
			<div class="login-button-wrap">
				<input type="submit" value="로그인">
			</div>
						
		</section>
			<div class="bottom-button-wrap">
			<ul class="find_wrap" id="find_wrap">
				<li>
				<a target="_blank" href="" class="find_text">아이디/비밀번호 찾기</a> &emsp;
				
				<a target="_blank" href="sign.jsp"class="find_text">회원가입</a>

				</li>
			</ul>
			</div>
		</form>
		<form>
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