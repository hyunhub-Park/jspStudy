<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="co.kh.dev.SimpleVO"%>

<!-- 사용자 정보 가져오기. -->
<%
	request.setCharacterEncoding("UTF-8");
/* 	String message1 = request.getParameter("message1");
	String message2 = request.getParameter("message2");
	
	SimpleVO svo = new SimpleVO(message1, message2); */
%>

<jsp:useBean id="svo" class="co.kh.dev.SimpleVO" />
<jsp:setProperty name="svo" property="*" />
<!-- 정보 가져오기. -->
<!-- 화면출력. -->
<html>
<body>
	<h1>간단한 빈즈 프로그램 결과</h1>
	<hr color="red"></hr>
	<br></br>
	<%-- <h3>메세지1 : <%= svo.getMessage1() %></h3>
	<br></br>
	<h3>메세지2 : <%= svo.getMessage2() %></h3> --%>
	
	<h3>메세지1 : <jsp:getProperty name="svo" property="message1" /></h3>
	<br></br>
	<h3>메세지2 : <jsp:getProperty name="svo" property="message2" /></h3>
	
	
</body>
</html>