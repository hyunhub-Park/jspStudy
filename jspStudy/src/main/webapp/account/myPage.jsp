<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
<%
	//1. 사용자 정보를 가져오기.
	// HttpSession session = request.getSession(); -> 정보가 없을 시 세션을 만들어버리기(정보를 조회하는 페이지이기 때문에 세션을 만들 필요는 없음.) 때문에 반드시 false값으로 설정해줘야 함.
	HttpSession session2 = request.getSession(false);
	
	if (session2 == null)
	{
		// 세션이 등록되어있지 않은 상황.
		// return;
	} else
	{
		String name = (String) session2.getAttribute("name");
		String id = (String) session2.getAttribute("id");
		String pwd = (String) session2.getAttribute("pwd");
	
		// 2. db가져오기.(CRUD)
	
		// 3. 화면 출력하기.
		PrintWriter out2 = null;
	
		response.setContentType("text/html; charSet=UTF-8");
	
		try
		{
			out2 = response.getWriter();
			out2.println("<h1 align=\"center\">마이페이지</h1>");
			out2.println("<table align=\"center\" width=\"300\" border=\"1\">");
			out2.println("<tr>");
			out2.println("<td align=\"center\">");
			out2.println("이름 = " + name);
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("<tr>");
			out2.println("<tr>");
			out2.println("<td align=\"center\">");
			out2.println("id = " + id);
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("<tr>");
			out2.println("<td align=\"center\">");
			out2.println("비밀번호 = " + pwd);
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("<tr>");
			out2.println("<td align=\"center\">");
			out2.println("<a href='/jspStudy/account/memberUpdatePrint.jsp'><input type=\"button\" value=\"회원정보 수정\"></a>");
			out2.println("<a href='/jspStudy/account/login.jsp'><input type=\"button\" value=\"메인으로\"></a>");
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("</table>");
		} catch (IOException e)
		{
			System.out.println(e.toString());
	}
}
%>

</body>
</html>