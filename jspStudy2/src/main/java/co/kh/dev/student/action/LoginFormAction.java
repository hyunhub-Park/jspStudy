package co.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.student.control.ActionForward;

public class LoginFormAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return new ActionForward("/mvcmem/login.jsp", false);
	}
}