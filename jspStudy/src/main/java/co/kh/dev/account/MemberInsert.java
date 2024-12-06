package co.kh.dev.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.account.model.AccountDAO;
import co.kh.dev.account.model.AccountVO;

@WebServlet("/memberInsert.do")
public class MemberInsert extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public MemberInsert()
	{
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		// 1. 값을 읽어온다.
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		
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
			out = response.getWriter();
			
			if (returnflag)
			{
				System.out.println("입력성공");
				out.println("<html>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<title>Insert title here</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<h1 align='center'>회원가입이 완료되었습니다.</h1>");
				out.println("<table align='center' width='300' border='1'>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("이름 = " + name);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("id = " + uid);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("비밀번호 = " + pwd);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("<a href='/jspStudy/loginServlet.do'><input type=\"button\" value=\"로그인\"></a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			} else
			{
				System.out.println("입력실패");
				out.println("<html>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<title>Insert title here</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<h1 align='center'>회원가입이 실패되었습니다.</h1>");
				out.println("<table align='center' width='300' border='1'>");
				out.println("<tr>");
				out.println("<td align=\"center\">");
				out.println("<a href='/jspStudy/member2/member2.html'><input type=\"button\" value=\"회원가입\"></a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
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
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		processRequest(request, response);
	}
}