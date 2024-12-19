<%@page contentType="text/html; charset=UTF-8"%>
<%
	// session.invalidate();
	response.setContentType("text/html;charset=UTF-8");
	// String loginID = (String)session.getAttribute("loginID");
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<title>Logout</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<main>
		<h2><%=id%>님의 계정이 로그아웃되었습니다.</h2>
		<br></br>
<%
session.invalidate();
%>
		<a href="login.jsp">로그인 페이지로 이동</a>
		<!-- 		<font size="4"> 성공적으로 로그아웃 되었습니다.
		<br></br>
		<a href="login.jsp">로그인 페이지로 이동</a>
		</font> -->
	</main>
</body>
</html>