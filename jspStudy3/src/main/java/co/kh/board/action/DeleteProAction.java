package co.kh.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.control.ActionForward;
import co.kh.board.model.BoardDAO;
import co.kh.board.model.BoardVO;

public class DeleteProAction implements CommandAction
{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.setCharacterEncoding("UTF-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String pass = request.getParameter("pass");
		
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setPass(pass);
		
		boolean flag = dbPro.deleteDB(vo);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("flag", flag);
		
		return new ActionForward("/board/deletePro.jsp", false);
	}
}