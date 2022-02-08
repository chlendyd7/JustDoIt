<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

</head>
<style>

	#wrap{
		width: 1000px;
		margin: 0 auto 0 auto;
	}
	
	#header{
		text-align: center;
		width: 1000px;
		height: 150px;
		background-color: ;
		padding: 60px 0px;
	}
	#user{
		float: left;
		width: 1000px;
		height: 100px;
		background-color: ;
		text-align: center;
		vertical-align: middle;
	}
	#menu{
		float: left;
		width: 1000px;
		height:60px;
		background-color: ;
		text-align: center;
		vertical-align: middle
	}
	#footer{
		clear: left;
		width: 1000px;
		height: 460px;
		background-color:;
		vertical-align: middle;
		text-align: center;
		
	}
</style>
<body>

	<div id="wrap">
		<div id="header">
		<img src="스타벅스 이미지.jpg" width="200" height="200"/>
		
		
		</div>
		<div id="user">
		<jsp:include page="user.jsp" />
		</div>
		<div id="menu">
		<h1>메뉴</h1>
		</div>
		<div id="footer">
		
		<%
		
			if(session.getAttribute("searching")==null) {
			%>
			<jsp:include page="paging.jsp"/>
		<% }else { %>
			<jsp:include page="search.jsp"/>
		<%
		}
		%>
		
		
		
		
		
		</div>
	</div>
</body>
</html>