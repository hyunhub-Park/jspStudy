package co.kh.dev;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifeCycle.do")
public class LifeCycle extends HttpServlet
{
	private static final long serialVersionUID = 1L;
     
    public LifeCycle()
    {
    	System.out.println("LifeCycle() default생성자.");
    }

	public void init(ServletConfig config) throws ServletException
	{
		System.out.println("init() 호출.");
	}

	public void destroy()
	{
		System.out.println("destroy() 호출.");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("service() 호출.");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("doGet() 호출.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("doPost() 호출.");
		doGet(request, response);
	}
}