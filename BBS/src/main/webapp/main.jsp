<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css"><%-- jsp 주석 --%>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
		<%
			String userID = null;//로그인 안하면 null 로그인 하면 id값이 담김
			if(session.getAttribute("userID") !=null){
				userID = (String) session.getAttribute("userID");
			}
		%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right"><%-- 오른쪽 --%>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a><%-- 하나의 아이콘 같은것 --%>
					<ul class="dropdown-menu">
						<li ><a href="login.jsp">로그인</a></li><%-- active=현재 선택된 페이지 --%>
						<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			
			<%			
				}else{
					
			%>
			<ul class="nav navbar-nav navbar-right"><%-- 오른쪽 --%>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a><%-- 하나의 아이콘 같은것 --%>
					<ul class="dropdown-menu">
						<li ><a href="logoutAction.jsp">로그아웃</a></li><%-- active=현재 선택된 페이지 --%>
						</ul>
					</li>
				</ul>
			<%
				}
			%>
			
			
		</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>	
	
</body>
</html>