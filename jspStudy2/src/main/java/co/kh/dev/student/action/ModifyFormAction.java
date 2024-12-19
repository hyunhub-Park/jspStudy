package co.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.student.control.ActionForward;
import co.kh.dev.student.model.StudentDAO;
import co.kh.dev.student.model.StudentVO;

public class ModifyFormAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");
		StudentVO svo = new StudentVO();
		svo.setId(id);
		StudentDAO dao = StudentDAO.getInstance();
		svo = dao.selectOneDB(svo);
		
		request.setAttribute("svo", svo);
		
		return new ActionForward("/mvcmem/modifyForm.jsp", false);
		// modifyProc서부터 진행.
//		HttpSession session = request.getSession();
//		
//		String id = (String) session.getAttribute("id");
//		
//		StudentDAO dao = StudentDAO.getInstance();
//		StudentVO vo = dao.getMember(id);
//
//		request.setAttribute("id", vo.getId());
//		request.setAttribute("pass", vo.getPass());
//		request.setAttribute("name", vo.getName());
//		request.setAttribute("phone1", vo.getPhone1());
//		request.setAttribute("phone2", vo.getPhone2());
//		request.setAttribute("phone3", vo.getPhone3());
//		request.setAttribute("email", vo.getEmail());
//		request.setAttribute("zipcode", vo.getZipcode());
//		request.setAttribute("address1", vo.getAddress1());
//		request.setAttribute("address2", vo.getAddress2());
//		
//		return new ActionForward("/mvcmem/modifyForm.jsp", false);
	}
}