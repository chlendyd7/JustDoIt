<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	#wrap{
		width: 450px;
		margin: 0 auto 0 auto;
	}
	
	#header{
		text-align: center;
		width: 280px;
		height: 80px;
		background-color: rgba(10, 73, 10, 0.514);
		padding: 10px 10px 10px 10px;
		


	}
	#user{
		float: left;
		width: 300px;
		height: 300px;
		background-color: rgba(10, 73, 10, 0.514);
		text-align: center;
		vertical-align: middle;
	}
		#footer{
		clear: left;
		width: 200px;
		height: 100px;
		background-color: ;
		text-align: center;
		padding: 50px 50px;
		vertical-align: middle;
	}
	</style>


</head>
<body>
<div id="wrap">
	<div id="header">
	<h1>주문내역</h1>
	<hr>
	</div>
	
	<div id="user">
    
   
		<% String[] menu = request.getParameterValues("menu"); 
   		if (menu != null) { 
      	for (int i = 0; i < menu.length; i++) 
         { out.print(menu[i]+"<br>"); }
         } %> 
	</div>
	<div id="footer">
	<input type="button" value="HOME"
                 onclick="location='Home.jsp'" >
	</div>
</div>
</body>
</html>