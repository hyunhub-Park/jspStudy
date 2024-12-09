<%@page contentType="text/html; charset=UTF-8" %>
<%@page isErrorPage="true" %>
<%
// 웹브라우저에게 정상적으로 처리되었음을 통보함.
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
<h1>문제 발생</h1>
<h1>신속히 처리하도록 하겠습니다.</h1>
<h2>에러타입 <%= exception.getClass().getName() %></h2>
<h2>에러타입 <%= exception.getMessage() %></h2>
</body>
</html>