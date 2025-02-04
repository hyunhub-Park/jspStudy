package co.kh.dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "myFirstServelet", urlPatterns = { "/myFirstServelet" })
//@WebServlet("/myFirstServlet")	// web.xml에서 servlet부분 주석처리 한 뒤에 이런식으로 처리해도 됨.
public class MyfirstServelet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// 
	// private static final long serialVersionUID = 1L;

	// 디폴트 생성자
    public MyfirstServelet()
    {
        super();
        System.out.println("최초 한 번 초기화.");
    }

    									// 서블릿 컨테이너가 만듦.
    						// 웹에서 요청한 스타트라인, 메세지헤더. 바디의 3가지 정보를 가지고 만든 것.
    // 원래 @override돼야 함.	// 클라이언트가 보낸 모든 정보는 request로 끝냄.
    // callback함수.
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
//		System.out.println("service running");
		doGet(request, response);
		// super.service(request, response);
    	// requestTest(request, response);
	}
//    private void requestTest(HttpServletRequest request,
//												HttpServletResponse response) throws IOException
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
    	System.out.println("requestTest running");
		// 1. 사용자 요청 정보를 받아야한다. request. 없으니까 생략함.
		// 2. 데이터베이스 연동하여 CRUD진행.
		
		// 3-1. 서버에서 클라이언트에게 문자를 보내기 위한 문자set 진행.(response에 있음.)
		response.setCharacterEncoding("UTF-8");
		
		// 3-2. 브라우저에게 jsp가 아닌 (text/html charset=UTF-8)
		response.setContentType("text/html;charset=UTF-8");
		
		// 3-3. 출력스트림 결정. (1Byte, 2Byte)
		PrintWriter out = response.getWriter();
		Date date = new Date();
		out.println("<html>");
        out.println("<body>");
        out.println("<h1>My First Servlet Program !!!!!!</h1>");
        out.println("<br>");
        out.println(date.toString());
        // out.println(new Date());
        //out.println(new java.util.Date());	// util.date임포트 안해도 됨.
        out.println("</body>");
        out.println("</html>");
        out.flush();
											// TODO Auto-generated method stub
											
										}

//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
//		System.out.println("service running");
//		// 1. 사용자 요청 정보를 받아야한다. request. 없으니까 생략함.
//		// 2. 데이터베이스 연동하여 CRUD진행.
//		
//		// 3-1. 서버에서 클라이언트에게 문자를 보내기 위한 문자set 진행.(response에 있음.)
//		response.setCharacterEncoding("UTF-8");
//		
//		// 3-2. 브라우저에게 jsp가 아닌 (text/html charset=UTF-8)
//		response.setContentType("text/html;charset=UTF-8");
//		
//		// 3-3. 출력스트림 결정. (1Byte, 2Byte)
//		PrintWriter out = response.getWriter();
//		Date date = new Date();
//		out.println("<html>");
//        out.println("<body>");
//        out.println("<h1>My First Servlet Program !</h1>");
//        out.println("<br>");
//        out.println(date.toString());
//        // out.println(new Date());
//        //out.println(new java.util.Date());	// util.date임포트 안해도 됨.
//        out.println("</body>");
//        out.println("</html>");
//        out.flush();
//		
		
		
		// 사용자 요청정보 받아 데이터를 가져욤 request
		// 디비로부터 요청정보 받고 db에 crud.
		// 화면 만들고 웹서버로 전동. response의 outputstream or writer로.
		// 전송
//	}
//    @Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
//		doGet(request, response);
//	}

}
