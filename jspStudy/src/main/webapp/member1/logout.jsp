<%@page contentType="text/html; charset=UTF-8"%>
<%
session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<title>Logout</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<main>
		<font size="4"> 성공적으로 로그아웃 되었습니다.
		<br></br>
		<a href="login.jsp">로그인 페이지로 이동</a>
		</font>
	</main>
</body>
</html>