package co.kh.dev.mvc.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.mvc.action.Action;


@WebServlet("*.do")
public class ControlServlet extends HttpServlet
{
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		// 1. 사용자 정보 가져오기. 사용자의 요청사항 파악하기.(URL로 파악 가능.)
		// http://localhost:8080/jspStudy/index.do?name=kimsaram
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();	// /jspStudy/index.do만 가져오는 것임.
		String cmd = uri.substring(uri.lastIndexOf("/"));	// /index.do만을 추출함.
		// String cmd = uri.substring(uri.lastIndexOf("/")+1);	// index.do만을 추출함.
		
		if (cmd != null)
		{
			// 2. ActionFactory에 관련된 Action객체 만들어줄 것을 요청함.
			ActionFactory factory = ActionFactory.getInstance();	// new 하는 것 아님.
			Action action = factory.getAction(cmd);
			
			if (action != null)
			{
				// overriding된 추상메소드를 호출.
				ActionForward af = action.execute(request, response);
				
				// 3. 화면 오청.(sendRedirect, forward.)
				if (af.isRedirect() == true)
				{
					response.sendRedirect(af.getUrl());
				} else
				{
					RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
					rd.forward(request, response);
				}
			} else
			{
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		} else
		{
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
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