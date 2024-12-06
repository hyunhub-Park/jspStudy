<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//<< servlet의 주 업무>>
		// 1. 사용자정보를 가져온다.(세션에서)
		// 1.1 request.getSession(); -> 세션값이 없으면 세션을 만들어버림. 로그아웃 창이기때문에 세션을 만들면 안됨. false값으로 지정하여 값이 없을 시, null을 반환하도록 해야함.
		// 2. db체크.(조회할 것 없음.)
		// 3. 화면 설계.(설계할 것이 없으니 페이지 이동. sendRedirect or forward.
		HttpSession session2 = request.getSession(false);
		
		try
		{
			if (session != null)
			{
				session.invalidate();
			}
			response.sendRedirect("/jspStudy/account/login.jsp");
		} catch (IOException e)
		{
			System.out.println(e.toString());
		}
%>

</body>
</html>