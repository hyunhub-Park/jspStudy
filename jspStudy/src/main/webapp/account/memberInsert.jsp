<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="javax.*" %>
<%@page import="co.kh.dev.account.model.AccountDAO" %>
<%@page import="co.kh.dev.account.model.AccountVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//1. 값을 읽어온다.
		request.setCharacterEncoding("UTF-8");
		PrintWriter out2 = null;
		
		try 
		{
			String name = request.getParameter("name");
			String uid = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			// 2. 데이터베이스 처리.(CRUD)
			AccountDAO ad = new AccountDAO();
			AccountVO avo = new AccountVO(name, uid, pwd);
			boolean returnflag = ad.insertDB(avo);
			// AccountVO ravo = ad.insertDB(avo);
			
			// 3. 출력.
			response.setContentType("text/html;charSet=UTF-8");
			out2 = response.getWriter();
			
			if (returnflag)
			{
				System.out.println("입력성공");
				out2.println("<html>");
				out2.println("<head>");
				out2.println("<meta charset='UTF-8'>");
				out2.println("<title>Insert title here</title>");
				out2.println("</head>");
				out2.println("<body>");
				out2.println("<h1 align='center'>회원가입이 완료되었습니다.</h1>");
				out2.println("<table align='center' width='300' border='1'>");
				out2.println("<tr>");
				out2.println("<td align=\"center\">");
				out2.println("이름 = " + name);
				out2.println("</td>");
				out2.println("</tr>");
				out2.println("<tr>");
				out2.println("<tr>");
				out2.println("<td align=\"center\">");
				out2.println("id = " + uid);
				out2.println("</td>");
				out2.println("</tr>");
				out2.println("<tr>");
				out2.println("<td align=\"center\">");
				out2.println("비밀번호 = " + pwd);
				out2.println("</td>");
				out2.println("</tr>");
				out2.println("<tr>");
				out2.println("<td align=\"center\">");
				out2.println("<a href='/jspStudy/account/login.jsp'><input type=\"button\" value=\"로그인\"></a>");
				out2.println("</td>");
				out2.println("</tr>");
				out2.println("</table>");
				out2.println("</body>");
				out2.println("</html>");
			} else
			{
				System.out.println("입력실패");
				out2.println("<html>");
				out2.println("<head>");
				out2.println("<meta charset='UTF-8'>");
				out2.println("<title>Insert title here</title>");
				out2.println("</head>");
				out2.println("<body>");
				out2.println("<h1 align='center'>회원가입이 실패되었습니다.</h1>");
				out2.println("<table align='center' width='300' border='1'>");
				out2.println("<tr>");
				out2.println("<td align=\"center\">");
				out2.println("<a href='/jspStudy/account/member2.jsp'><input type=\"button\" value=\"회원가입\"></a>");
				out2.println("</td>");
				out2.println("</tr>");
				out2.println("</table>");
				out2.println("</body>");
			}
			
		}catch (Exception e)
		{
			e.printStackTrace();
			
		}finally
		{
			if (out != null)
			{
				out.close();
			}
		}


%>
</body>
</html>