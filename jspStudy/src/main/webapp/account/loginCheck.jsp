<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.*" %>
<%@page import="co.kh.dev.account.model.AccountDAO" %>
<%@page import="co.kh.dev.account.model.AccountVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Check Page</title>
</head>
<body>
<%
		// 1. 사용자 정보를 가져온다.
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// 2. CRUD
		AccountDAO ad = new AccountDAO();
		
		// ad.selectLoginCheckDB(null);
		
		// id, pwd는 vo를 통해 넣어줘야 함. name은 없으므로 null.
		AccountVO avo = new AccountVO(null, id, pwd);
		AccountVO ravo = ad.selectLoginCheckDB(avo);
		
		if (ravo == null)
		{
			// null이면 id, pwd가 잘못된 것임.
			
		} else
		{
			HttpSession session2 = request.getSession();
			session2.setAttribute("id", ravo.getId());
			session2.setAttribute("pwd", ravo.getPwd());
			session2.setAttribute("name", ravo.getName());
		}
		// 3. 화면처리.
		response.sendRedirect("login.jsp");
%>

</body>
</html>