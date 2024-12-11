<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
StudentDAO sdao = new StudentDAO();
%>
<%-- <jsp:useBean id="dao" class="memberone.StudentDAO"/> --%>
<jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO" />
<jsp:setProperty name="svo" property="*" />
<!-- 10개를 모두 setters 해주는 것. requestgetPrameter로 10개를 받아도 됨.-->
<%
boolean flag = sdao.insertDB(svo);
%>

<!-- 화면 설계 -->

<!DOCTYPE html>
<html>
<head>
<title>회원가입 확인</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<br></br>
<main>
	<%
	if (flag)
	{
		out.println("<b>회원가입을 축하 드립니다.</b><br/>");
		out.println("<a href=login.jsp>로그인</a>");
	} else {
		out.println("<b>다시 입력하여 주십시오.</b><br/>");
		out.println("<a href=regForm.jsp>다시 가입</a>");	/* sendRedirect or forward해도 됨. */
	}
	%>
</main>
</body>
</html>