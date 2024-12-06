package co.kh.dev.account;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet({ "/logoutServlet.do" })
public class LogoutServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	{
		// << servlet의 주 업무>>
		// 1. 사용자정보를 가져온다.(세션에서)
		// 1.1 request.getSession(); -> 세션값이 없으면 세션을 만들어버림. 로그아웃 창이기때문에 세션을 만들면 안됨. false값으로 지정하여 값이 없을 시, null을 반환하도록 해야함.
		// 2. db체크.(조회할 것 없음.)
		// 3. 화면 설계.(설계할 것이 없으니 페이지 이동. sendRedirect or forward.
		HttpSession session = request.getSession(false);
		
		try
		{
			if (session != null)
			{
				session.invalidate();
			}
			response.sendRedirect("loginServlet.do");
		} catch (IOException e)
		{
			System.out.println(e.toString());
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