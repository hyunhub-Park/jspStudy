package co.kh.dev.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/myPageServlet.do")
public class MypageServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    
	    private void processRequest(HttpServletRequest request, HttpServletResponse response)
	    {
	    	// 1. 사용자 정보를 가져오기.
	    	// HttpSession session = request.getSession(); -> 정보가 없을 시 세션을 만들어버리기(정보를 조회하는 페이지이기 때문에 세션을 만들 필요는 없음.) 때문에 반드시 false값으로 설정해줘야 함.
	    	HttpSession session = request.getSession(false);
    	
    	if (session == null)
    	{
    		// 세션이 등록되어있지 않은 상황.
    		// return;
    	} else
    	{
    		
    		String name = (String) session.getAttribute("name");
    		String id = (String) session.getAttribute("id");
    		String pwd = (String) session.getAttribute("pwd");
    		
    		// 2. db가져오기.(CRUD)
    		
    		// 3. 화면 출력하기.
    		PrintWriter out = null;
    		
    		response.setContentType("text/html; charSet=UTF-8");
    		
    		try
    		{
    			out = response.getWriter();
    			out.println("<h1 align=\"center\">마이페이지</h1>");
    			out.println("<table align=\"center\" width=\"300\" border=\"1\">");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("이름 = "+ name);
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("<tr>");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("id = "+ id);
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("비밀번호 = "+ pwd);
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("<tr>");
    			out.println("<td align=\"center\">");
    			out.println("<a href='/jspStudy/member2/memberUpdate.html'><input type=\"button\" value=\"회원정보 수정\"></a>");
    			out.println("<a href='/jspStudy/loginServlet.do'><input type=\"button\" value=\"메인으로\"></a>");
    			out.println("</td>");
    			out.println("</tr>");
    			out.println("</table>");	
    		} catch (IOException e)
    		{
    			System.out.println(e.toString());
    		}
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		processRequest(request, response);
	}
}