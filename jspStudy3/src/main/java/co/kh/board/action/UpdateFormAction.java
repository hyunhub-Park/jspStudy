package co.kh.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.control.ActionForward;
import co.kh.board.model.BoardDAO;
import co.kh.board.model.BoardVO;

public class UpdateFormAction implements CommandAction
{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		try
		{
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			BoardDAO dbPro = BoardDAO.getInstance();
			BoardVO vo = new BoardVO();
			vo.setNum(num);
			BoardVO article = dbPro.selectBoardDB(vo);
			
			// 해당 뷰에서 사용할 속성
			request.setAttribute("pageNum", (pageNum));
			request.setAttribute("article", article);

			return new ActionForward("/board/updateForm.jsp", false);
		} catch(Exception e)
		{
			e.printStackTrace();	// 에러페이지를 별도로 만들어 삽입하는 구간.
			return new ActionForward("/board/writeForm.jsp", false);
		}
	}
}