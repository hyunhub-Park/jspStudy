<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="javax.*" %>
<%@page import="co.kh.dev.account.model.AccountDAO" %>
<%@page import="co.kh.dev.account.model.AccountVO" %>
<%@page import="co.kh.dev.common.DBUtility" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//객체참조변수 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	// 1. 사용자정보를 가져온다, 3 화면에 보여준다.
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// 자신의 정보와 체크하기 위함이다.
	HttpSession session2 = request.getSession(false);
	
	try
	{
		if (session2 == null)
		{
			// 로그인을 하지않고 불법적으로 수정페이지롤 들어온것이기 때문에 경고창준다.
			System.out.println("세션값이 없습니다.");
			response.sendRedirect("myPage.jsp");
		} else
		{
			// 2. curd
			System.out.println("세션 아디값이 일치.");
			String sid = (String) session.getAttribute("id");
			if (!(sid.equals(id)))
			{
		System.out.println("세션 아디값이 일치하지 않습니다.");
		response.sendRedirect("myPage.jsp");
			} else
			{
		// 2. 데이터베이스 처리.(CRUD)
		AccountDAO ad = new AccountDAO();
		AccountVO avo = new AccountVO(name, id, pwd);
		boolean returnflag = ad.updateDB(avo);
	
		if (returnflag == true)
		{
			session.setAttribute("pwd", pwd);
			session.setAttribute("name", name);
			response.sendRedirect("myPage.jsp");
		} else
		{
			PrintWriter out2 = null;
			response.setContentType("text/html;charSet=UTF-8");
			out2 = response.getWriter();
	
			System.out.println("입력실패");
			out2.println("<html>");
			out2.println("<head>");
			out2.println("<meta charset='UTF-8'>");
			out2.println("<title>Insert title here</title>");
			out2.println("</head>");
			out2.println("<body>");
			out2.println("<h1 align='center'>회원수정이 실패되었습니다.</h1>");
			out2.println("<table align='center' width='300' border='1'>");
			out2.println("<tr>");
			out2.println("<td align=\"center\">");
			out2.println("<a href='/jspStudy/account/login.jsp'><input type=\"button\" value=\"로그인\"></a>");
			out2.println("</td>");
			out2.println("</tr>");
			out2.println("</table>");
			out2.println("</body>");
		}
			}
		}
	} catch (Exception e)
	{
		System.out.println(e.toString());
	} finally
	{
		DBUtility.dbClose(con, pstmt);
	}
%>
</body>
</html>