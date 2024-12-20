package co.kh.dev.mvc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.mvc.control.ActionForward;

public class indexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		System.out.println("사용자 정보를 받고 -> DB조회 후 -> 결과를 request에 입력 -> 화면.jsp(redirect or forward)");
		return new ActionForward("index.jsp", false);	// false가 forward.
	}
}