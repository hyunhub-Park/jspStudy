<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="vo" class="co.kh.jstl.MemberVO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
												<!-- name이라는 속성 -->
	<c:set target="${vo}" property="name" value="mem"></c:set>
	<c:set target="${vo}" property="email">mem@email.com</c:set>
	<c:set var="age" value="10" scope="page"></c:set>
	<c:set target="${vo}" property="age" value="${age}"></c:set>
	<ul>
		<li>NAME : ${vo.name}</li>
					<!-- EL표기가 아니므로 getters가 안됨. -->
		<li>EMAIL : <%= vo.getEmail() %></li>
		<li>AGE : ${vo.age}</li>
	</ul>

</body>
</html>