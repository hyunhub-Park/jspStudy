package co.kh.board.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.action.CommandAction;

public class ControllerServlet extends HttpServlet {
	// 1. board/list.do=com.kh.edu.board.action.ListAction
	// 키값: "board/list.do" 객체: Class.Load(com.kh.edu.board.action.ListAction);
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	// 2. CommandPro.properties 키값과 value값을 가져와서 미리 객체를 만들고 commandMap 저장해놓는다(Pre
	// Loading)
	@SuppressWarnings("deprecation")
	public void init(ServletConfig config) throws ServletException {

		String props = config.getInitParameter("propertyConfig");
		Properties pr = new Properties();
		FileInputStream f = null;
		String path = config.getServletContext().getRealPath("/WEB-INF");
		try {
			f = new FileInputStream(new File(path, props));
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}
		// board/list.do=com.kh.edu.board.action.ListAction 키값에 "board/list.do" Set 등록
		Iterator<Object> keyIter = pr.keySet().iterator();
		while (keyIter.hasNext()) {
			// key값 : "board/list.do"
			String command = (String) keyIter.next();
			// value값 : "com.kh.edu.board.action.ListAction"
			String className = pr.getProperty(command);
			try {
				// com.kh.edu.board.action.ListAction 해당 문자열을 클래스 가져온다..
				Class commandClass = Class.forName(className);
				// com.kh.edu.board.action.ListAction 객체를 만든다.
				Object commandInstance = commandClass.newInstance();// 해당클래스의 객체를 생성
				// Map객체인 commandMap에 객체 저장
				commandMap.put(command, commandInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ActionForward af = null;
		CommandAction com = null;
		try {
			//http://localhost:8080/jspStudy3/board/index.do?name=kdj
			// command = "/jspStudy3/board/index.do"
			String command = request.getRequestURI();
			//request.getContextPath() == "/jspStudy3"
			if (command.indexOf(request.getContextPath()) == 0) {
				// command = "/board/index.do"
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandAction) commandMap.get(command);
			af = com.execute(request, response);
			
			if(af.isRedirect() == true) {
				response.sendRedirect(af.getUrl()); 
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response); 
			}
		} catch (Throwable e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}







//package co.kh.board.control;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Map;
//import java.util.Properties;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletConfig;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import co.kh.board.action.CommandAction;
//
//
//@WebServlet("*.do")
//public class ControllerServlet extends HttpServlet
//{
//	// [1] preLoading 보관
//	// key(객체참조변수) : -.do를 저장, value(new, 그 객체의 번지가 들어있음.) : controller/service/dao객체를 매치시킴.
//	// '/board/list.do=' -> key, 'Class.Load(co.kh.board.action.ListAction)' -> value(new해서 만들어진 객체의 번지).
//	// HashMap(다중 thread -> deadLock 발생 X.)
//	private Map <String, Object> commandMap = new HashMap <String, Object>();
//       
//	// [2] CommandPro.properties에 존재하는 key, value값을 가져와 미리 객체를 만들고, commandMap에 저장해 둠.(pre Loading)
//	@SuppressWarnings("deprecation")
//	public void init(ServletConfig config) throws ServletException
//	{
//		// [2] preLoading명단 호출.
//		// props = "CommandPro.properties"
//											// web.xml에 아래의 이름이 있음.
//		String props = config.getInitParameter("propertyConfig");
//		
//		// CommandPro.properties 파일을 가져오기 위한 경로 탐색.
//		Properties pr = new Properties();
//		FileInputStream f = null;
//		String path = config.getServletContext().getRealPath("/WEB-INF");
//		
//		try
//		{
//			// Command.properties파일의 내용을 읽어옴
//			// /board/list.do=co.kh.board.action.ListAction
//			f = new FileInputStream(new File(path, props));
//			// Command.properties파일의 정보를 Properties객체에 저장
//			pr.load(f);	// properties로 load. properties는 map에 속함(Map컬렉션).
//		} catch (IOException e)
//		{
//			throw new ServletException(e);
//		} finally
//		{
//			if (f != null)
//			{
//				
//				try
//				{
//					f.close();
//				} catch (IOException ex)
//				{
//				}
//			}
//		}
//		// '/board/list.do=' -> key값 만을 set에 집어넣음.(문자열로) 
//		Iterator <Object> keyIter = pr.keySet().iterator();
//		
//		while (keyIter.hasNext())
//		{
//			// key - 'board/list.do='를 command로 바꾸는 것.
//			String command = (String) keyIter.next();
//			// value - 'co.kh.board.action.ListAction'
//			String className = pr.getProperty(command);
//			try
//			{	// 'co.kh.board.action.ListAction' 해당 문자열을 가져옴. 클래스 위치를 찾음.
//				Class commandClass = Class.forName(className);
//				// 'co.kh.board.action.ListAction' 객체를 만든다.
//				// 원래는 listAction해야하는데.
//				Object commandInstance = commandClass.newInstance();// 해당클래스의 객체를 생성
//				// Map객체인 commandMap에 객체 저장
//				commandMap.put(command, commandInstance);
//			} catch (ClassNotFoundException e)
//			{
//				throw new ServletException(e);
//			} catch (InstantiationException e)
//			{
//				throw new ServletException(e);
//			} catch (IllegalAccessException e)
//			{
//				throw new ServletException(e);
//			}
//		}
//	}
//	
//	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
//	{
////		String view = null;
//		ActionForward af = null;
//		CommandAction com = null;
//		
//		try
//		{
//			// http://localhost:8080/jspStudy3/board/index.do?name=blahblah
//			// URI = /jspStudy3/board/index.do?name=blahblah
//			// 따라서 command = '/jspStudy3/board/index.do'
//			String command = request.getRequestURI();
//			
//			// request.getContextPath() == '/jspStudy3'
//			if (command.indexOf(request.getContextPath()) == 0)
//			{
//				// command = '/board/index.do' -> 10번째 String분할.
//				command = command.substring(request.getContextPath().length());
//			}
//				// 최고의 부모. CommandAction. commandMap은 Object. 따라서 다운캐스팅.
//			com = (CommandAction) commandMap.get(command);
////			view = com.requestPro(request, response);
//			af = com.execute(request, response);
//			
//				
//				// 3. 화면 오청.(sendRedirect, forward.)
//				if (af.isRedirect() == true)
//				{
//					response.sendRedirect(af.getUrl());
//				} else
//				{
//					RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
//					rd.forward(request, response);
//				}
//		} catch (Throwable e)
//		{
//			throw new ServletException(e);
//		}
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
//		dispatcher.forward(request, response);
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
//		processRequest(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
//		processRequest(request, response);
//	}
//}