<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("name", "김사람");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>${name}</li>
		<li>${requestScope.name}</li>
		<li>${requestScope["name"]}</li>
		<li>${pageContext.request.requestURI}</li>
		<li>param.code = ${param.code}</li>
		<li>param.code = ${param["code"]}</li>
		<!-- http://localhost:8080/jspStudy/eltag/eleaxm2.jsp?code=1024 -->
	</ul>

</body>
</html>