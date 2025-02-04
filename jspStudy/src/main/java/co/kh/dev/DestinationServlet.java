package co.kh.dev;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DestinationServlet
 */
@WebServlet("/destination.do")
public class DestinationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// forward방식으로 페이지 요청을 받음.
		String name = (String)request.getAttribute("name");
		
		// sendRedirect로 요청을 받았으니 화면에 3가지 작업을 함.(1. 요청정보 확인, 2. DBMS CRUD, 3. 화면작업.) -> 근데 하나도 전달해주는게 없음.
		// response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try
		{
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Destination</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1> Destination Servlet 입니다</h1>");
			out.println("<h1> name =" + name + "</h1>");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		} finally
		{
			if (out != null)
			{
				out.close();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		processRequest(request, response);
	}
}