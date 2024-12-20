<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 화면 설계 -->
<%
	boolean flag = (Boolean)request.getAttribute("flag");
	String id = (String)request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 확인</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<br></br>
<main>
<%
	if (flag == true)
	{
		// out.println("<b>회원가입을 축하 드립니다.</b><br/>");
		out.println(id + "님의 회원가입을 축하 드립니다.</b><br/>");
		out.println("<a href=login.do>로그인</a>");
	} else
	{
		out.println("<b>다시 입력해 주세요.</b><br/>");
		out.println("<a href=regForm.do>다시 가입</a>");
	}
%>
</main>
</body>
</html>