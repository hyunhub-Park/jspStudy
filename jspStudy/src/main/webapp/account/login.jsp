<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Main Page</title>
</head>
<body>
<%
	// 1. 사용자 정보를 가져온다.
	// 2. db 조회.(CRUD)
	// 3. 화면으로 보내주기.
	PrintWriter out2 = null;
	response.setContentType("text/html;charset=UTF-8");
	
try
	{
		out2 = response.getWriter();
		// out = response.getWriter();
		// 4. 세션 정보를 가져오기 (세션이 없으면 null 반환)
		HttpSession session2 = request.getSession(false);

		/* if (session2 == null) */
			
		if(session2 == null || session2.getAttribute("id") == null)
		{
			// 세션이 없을 때 로그인 화면 출력
			out2.println("<html>");
			out2.println("<body>");
			out2.println("<form method='post' action='/jspStudy/account/loginCheck.jsp'>");
			out2.println("<table border='1' width='300' align=\"center\">");
			out2.println("<tr>");
			out2.println("<th width='100'>아이디</th>");
			out2.println("<td width='200'>&nbsp;<input type='text' name='id'></td>");
			out2.println("</tr>");
			out2.println("<tr>");
			out2.println("<th width='100'>비번</th>");
			out2.println("<td width='200'>&nbsp;<input type='password' name='pwd'></td>");
			out2.println("</tr>");
			out2.println("<tr>");
			out2.println("<td align='center' colspan='2'>");
			out2.println("<a href='/jspStudy/account/member2.jsp'><input type='button' value='회원가입'></a> &nbsp; &nbsp;");
			out2.println("<input type='submit' value='로그인'>");
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("</form>");
			out2.println("</table>");
			out2.println("</body>");
			out2.println("</html>");
		} else
		{
			// 세션이 있을 때
			String id = (String) session2.getAttribute("id");
			out2.println("<html>");
			out2.println("<body>");
			out2.println("<table border='1' width='300' align=\"center\">");
			out2.println("<tr>");
			out2.println("<td width='300' align='center'>" + id + " 님 로그인 되었습니다.</td>");
			out2.println("</tr>");
			out2.println("<tr>");
			out2.println("<td align='center'>");
			out2.println("<a href='myPage.jsp'>회원정보</a> &nbsp;&nbsp;");
			out2.println("<a href='logout.jsp'>로그아웃</a>");
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("</table>");
			out2.println("</body>");
			out2.println("</html>");
		}
	} catch (Exception e)
	{
		e.printStackTrace();
	} finally
	{
		if (out2 != null)
		{
			out2.close();
		}
	}
%>

</body>
</html>