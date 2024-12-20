<%@page contentType="text/html; charset=UTF-8"%>
<%
	boolean flag = (Boolean)request.getAttribute("flag");
%>
<!DOCTYPE html>
<html>
<head>
<title>Update Process</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<!-- <meta http-equiv="Refresh" content="3;url=login.jsp"> -->
<body>
	<main>
	
	<%
		if (flag == true){
	%>
		<h2> 회원정보 수정이 완료되었습니다.</h2>
		<br></br>
		<a href="login.do">이전으로</a>
		
		<%} else 
		{%>
		
				<h2> 회원정보 수정 실패.</h2>
		<br></br>
		<a href="login.do">이전으로</a>
		
		<%} %>
		<!-- 	<font size="5" face="바탕체"> 입력하신 내용대로
		<b>회원정보가 수정 되었습니다.</b>
		<br></br>
			3초후에 Logon Page로 이동합니다
		</font> -->
	</main>
</body>
</html>