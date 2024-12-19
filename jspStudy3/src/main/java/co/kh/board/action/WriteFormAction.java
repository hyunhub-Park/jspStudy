package co.kh.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.control.ActionForward;

public class WriteFormAction implements CommandAction
{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		int num=0,ref=1, step=0, depth=0; 
		 try
		 { 
			 if(request.getParameter("num")!=null)
			 {
				 num=Integer.parseInt(request.getParameter("num"));
				 ref=Integer.parseInt(request.getParameter("ref"));
				 step=Integer.parseInt(request.getParameter("step"));
				 depth=Integer.parseInt(request.getParameter("depth"));
			 }
		}catch(Exception e){e.printStackTrace();}
		 //해당 뷰에서 사용할 속성
		request.setAttribute("num", (num));
		 request.setAttribute("ref", (ref));
		 request.setAttribute("step", (step));
		 request.setAttribute("depth", (depth));
		 return new ActionForward("/board/writeForm.jsp", false);
		 
		 }
}