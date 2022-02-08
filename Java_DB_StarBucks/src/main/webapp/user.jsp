<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
		<p>
		
			<button style="background-color: #EFFBF2;" onclick="location='Home.jsp'">HOME</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<%
			Object input_id = session.getAttribute("input_id");
			%>
		<%
			// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
			if(session.getAttribute("input_id")==null){ 
		%>
			<button style="background-color: #EFFBF2;" onclick="location='login.jsp'">로그인</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button style="background-color: #EFFBF2;" onclick="location='sign.jsp'">회원가입</button>
		<%
			//로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
			}else{ 
		%>
		
			<button style="background-color: #EFFBF2;" onclick="location='LogoutAction.jsp'">로그아웃</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button style="background-color: #EFFBF2;" onclick="location='update.jsp'">회원정보수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button style="background-color: #EFFBF2;" onclick="location='delete.jsp'">회원탈퇴</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button style="background-color: #EFFBF2;" onclick="location='oders.jsp'">주문내역</button>
		<%	}	%>	

		</p>

</body>
</html>