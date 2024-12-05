<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>해당 라인에서도 아래 선언된 멤버변수 사용이 가능함. <%= declation %></h1>
	<h1>해당 라인에서도 아래 선언된 멤버함수 사용이 가능함. <%= getDeclation() %></h1>
	<h1>연산처리</h1>
	<%
	// 내장 객체 - context, config, request, response, pageContext, session, out, page	
	// 자바 연산처리문(제어/반복) : service에서 진행됨.
		String message = "연산처리문입니다.";	// message : service에 있는 지역변수임.
		out.println("내장객체를 이용한 message : " + message);
	%>
	
	<h1>멤버변수 선언</h1>
	<%!
		String declation = "멤버변수선언문입니다.";
	%>
	
	<h1>멤버함수 선언</h1>
	<%!
	// 멤버함수선언
	public String getDeclation ()
	{
		return declation;
	}
	%>

</body>
</html>