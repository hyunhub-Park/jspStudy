package co.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.student.control.ActionForward;

public class LogoutAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return new ActionForward("/mvcmem/logout.jsp", false);
	}
}