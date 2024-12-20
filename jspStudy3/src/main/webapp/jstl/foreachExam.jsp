<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.jstl.MemberVO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO vo1 = new MemberVO("김사람", "kim01@email.com", 20);
	MemberVO vo2 = new MemberVO("박사람", "kim02@email.com", 30);
	MemberVO vo3 = new MemberVO("최사람", "kim03@email.com", 40);
	MemberVO vo4 = new MemberVO("이사람", "kim04@email.com", 50);
	
	ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	
	list.add(vo1);
	list.add(vo2);
	list.add(vo3);
	list.add(vo4);
	
	request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<title>JSTL Example</title>
</head>
<body>
	<h3>회원 정보</h3>
	<table border="1" width="450">
		<tr>
			<th width="50">번호</th>
			<th width="100">이름</th>
			<th width="200">메일</th>
			<th width="100">나이</th>
		</tr>
																			<!-- 상태 카운트. -->
		<c:forEach var="data" items="${list}" varStatus="no">
		
		<tr>
			<!-- 원래는 getters해야 함. EL표기법이라 필요 없음. -->
			<td width="50">${no.count}</td>
			<td width="100">${data.name}</td>
			<td width="200">${data.email}</td>
			<td width="100">${data.age}</td>
		</tr>
			
		</c:forEach>
	</table>
</body>
</html>