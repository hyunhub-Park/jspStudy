<%@page language="java" contentType="text/html; charset=UTF-8"%>

<!-- <meta http-equiv="Refresh" content="3;url=login.jsp"> -->
<%
boolean flag = (Boolean)request.getAttribute("flag"); 
if(flag == true)
{
%>
<html>
<head>
<title>회원탈퇴</title>
</head>
<body>
	<main>
		<h2> 회원탈퇴가 완료되었습니다.</h2>
		<br></br>
		<h2> 이용해주셔서 감사합니다.</h2>
		<a href="login.do">이전으로</a>
	</main>
<!-- 	<main>
		<font size="5" face="바탕체"> 회원정보가 삭제되었습니다
		<br></br> 안녕히 가세요 ! ㅠ.ㅠ
		<br></br>
			3초후에 로그인 페이지로 이동합니다
		</font>
	</main> -->
</body>
</html>
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