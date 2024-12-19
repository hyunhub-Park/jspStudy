package co.kh.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.control.ActionForward;

public class DeleteFormAction implements CommandAction
{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		// 해당 뷰에서 사용할 속성
		request.setAttribute("num", (num));
		request.setAttribute("pageNum", (pageNum));

		return new ActionForward("/board/deleteForm.jsp", false);
	}
}