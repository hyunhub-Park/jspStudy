<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("score", 85);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${score ge 90}">
			<p>score >= 90 ${score}</p>
		</c:when>
		<c:when test="${score ge 80}">
			<p>score >= 80 ${score}</p>
		</c:when>
		<c:when test="${score ge 70}">
			<p>score >= 70 ${score}</p>
		</c:when>
		<c:otherwise>해당점수 없음.</c:otherwise>
	</c:choose>

</body>
</html>