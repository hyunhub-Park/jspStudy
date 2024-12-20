<%@page import="co.kh.dev.student.model.StudentDAO"%>
<%@page import="co.kh.dev.student.model.StudentVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- 3. 화면 설계. -->
<!DOCTYPE html>
<html>
<head>
<title>ID중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
	<br>
	<main>
		<%-- <b><%=id%></b> --%>
<%-- 	<b>${id}</b>
	<c:if test="${check eq true}">는 이미 존재하는 ID입니다.<br />
	</c:if>
	<c:if test="${check ne true}">는 사용 가능 합니다.<br />
	</c:if>
	<a href="#" onClick="javascript:self.close()">닫기</a> --%>
	<%
		String id = (String)request.getAttribute("id");

		Boolean check = (Boolean)request.getAttribute("check");
		
		if (check == true)
		{
			out.println(id + "는 이미 존재하는 ID입니다.<br></br>");
		} else
		{
			out.println(id + "는 사용 가능한 ID입니다.<br></br>");
		}
%>
		<hr>
		<!-- <button onClick="javascript:self.close()">닫기</button> -->
		<a href="#" onClick="javascript:self.close()">닫기</a>
	</main>
</body>
</html>