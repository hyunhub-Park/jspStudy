<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="co.kh.dev.memberone.model.*"%>

<jsp:useBean id="dao" class="co.kh.dev.memberone.model.StudentDAO" />

<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	String id = (String) session.getAttribute("loginID");
	String pass = request.getParameter("pass");
	int check = dao.deleteMember(id, pass);
	if (check == 1)
	{
		session.invalidate();
%>
<!-- <meta http-equiv="Refresh" content="3;url=login.jsp"> -->
<body>
	<main>
		<h2> 회원탈퇴가 완료되었습니다.</h2>
		<br></br>
		<h2> 이용해주셔서 감사합니다.</h2>
		<a href="login.jsp">이전으로</a>
	</main>
<!-- 	<main>
		<font size="5" face="바탕체"> 회원정보가 삭제되었습니다
		<br></br> 안녕히 가세요 ! ㅠ.ㅠ
		<br></br>
			3초후에 로그인 페이지로 이동합니다
		</font>
	</main> -->
<%
	} else
	{
%>
	<script>
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>