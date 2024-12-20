<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${3>4}">
		<p>'3>4'는 거짓조건.</p>
	</c:if>
	<c:if test="${3<4}">
		<p>'3<4'는 참조건. \${3<4}</p>
	</c:if>
	<c:if test="${param.type eq 'guest'}">
		<p>guest</p>
	</c:if>
	<c:if test="${param.type eq 'member'}">
		<p>member</p>
	</c:if>
	
	<!-- '?type='을 적어줘야 함. http://localhost:8080/jspStudy3/jstl/ifExam.jsp?type=guest -->
	
</body>
</html>