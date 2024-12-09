<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="./top.jsp" %>
<%
	// 지역변수
	String name = "김이름";
%>

<h2>body 영역</h2>

<body>
	<h2>회원정보 수정 완료!</h2>
	<%
		//세션의 정보는 Object타입으로 저장되어있음
		//다운 캐스팅 : 자식클래스의 변수 = (자식클래스 타입) 부모타입의 데이터
		String name2 = (String) session.getAttribute("name2");
		out.print("[" + name2 + "]님의 정보 수정이 완료되었습니다.");
	%>
	<a href="/jspStudy/loginServlet.do"></br>메인으로</a>
</body>
</html>

<!-- footer -->
<%@ include file="./bottom.jsp" %>
