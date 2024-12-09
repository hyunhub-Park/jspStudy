<%@page contentType="text/html; charset=UTF-8"%>
<%@page errorPage="/directive/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>서버에러 발생으로 인한 에러페이지로의 연결</h1>
	<%
	// 사용자 요청을 가져와 출력함.
	String name = request.getParameter("name").toUpperCase();
	out.println("사용자가 입력한 이름 = " + name);
	%>

</body>
</html>