package co.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.student.control.ActionForward;
import co.kh.dev.student.model.StudentDAO;
import co.kh.dev.student.model.StudentVO;

public class ModifyProcAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
//		request.setCharacterEncoding("UTF-8");
//		
//		HttpSession session = request.getSession();
//		
//		String id = (String) session.getAttribute("id");
//		
//		StudentDAO dao = StudentDAO.getInstance();
//		StudentVO vo = new StudentVO(id, 
//		request.getParameter("pass"),
//		request.getParameter("name"), 
//		request.getParameter("phone1"),
//		request.getParameter("phone2"), 
//		request.getParameter("phone3"),
//		request.getParameter("email"), 
//		request.getParameter("zipcode"),
//		request.getParameter("address1"),
//		request.getParameter("address2"));
//		
//		dao.updateMember(vo);
//		
//		return new ActionForward("/mvcmem/modifyProc.jsp", false);
		
//		request.setCharacterEncoding("UTF-8");
//		
//		HttpSession session = request.getSession();
//
//		String id = (String) session.getAttribute("id");
//		StudentDAO dao = StudentDAO.getInstance();
//		StudentVO vo = new StudentVO(id,
//				request.getParameter("pass"),
//				request.getParameter("name"),
//				request.getParameter("phone1"),
//				request.getParameter("phone2"),
//				request.getParameter("phone3"),
//				request.getParameter("email"),
//				request.getParameter("zipcode"),
//				request.getParameter("address1"),
//				request.getParameter("address2"));
		
		// boolean flag = dao.updateMember(vo);
		
		// request.setAttribute("flag", flag);
		
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		StudentDAO dao = StudentDAO.getInstance();
		StudentVO vo = new StudentVO(id, 
		request.getParameter("pass"),
		request.getParameter("name"), 
		request.getParameter("phone1"),
		request.getParameter("phone2"), 
		request.getParameter("phone3"),
		request.getParameter("email"), 
		request.getParameter("zipcode"),
		request.getParameter("address1"),
		request.getParameter("address2"));
		boolean flag = dao.updateMember(vo);
		
		if (flag == true)
		{
			session.setAttribute("pass", request.getParameter("pass"));
		}
		
		request.setAttribute("flag", flag);
		
		// dao.updateMember(vo);
		return new ActionForward("/mvcmem/modifyProc.jsp", false);
	}
}