package co.kh.dev.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberInsert
 */
@WebServlet(name = "memberInsert", urlPatterns = { "/memberInsert" })
public class MyMemberInsert extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public MyMemberInsert()
    {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 1.1 전송된 값을 가져옴.(어떤 언어일지 모름. 한글이라면 UTF-8)
		request.setCharacterEncoding("UTF-8");
		System.out.println("do post 작동");

		// 1.2 정보가져오기.
	    String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    String address = request.getParameter("addr1");


		// 2. MEMBER 테이블에 저장한다.(프로토콜 : 약속)
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean successFlag = false;
		// db.properties 에서 id, pw 가져오기
		String url = "jdbc:oracle:thin:@127.0.0.1:1521/orcl";
		String MEMBER_INSERT = "INSERT INTO MEMBER VALUES(MEMBER_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
		// con = DBUtility.dbCon();

		// 1. jdbc driver load 2. connection
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "webuser", "123456");
			pstmt = con.prepareStatement(MEMBER_INSERT);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, address);

			int count = pstmt.executeUpdate();
			successFlag = (count != 0) ? true : false;
			
		} catch (ClassNotFoundException e)
		{
			System.out.println(e.toString());
		} catch (SQLException e)
		{
			System.out.println(e.toString());
		} finally
		{
			if (con != null)
			{
				try
				{
					con.close();
				} catch (SQLException e)
				{
					System.out.println(e.toString());
				}
			}
			
			if (pstmt != null)
			{
				try
				{
					pstmt.close();

				} catch (SQLException e)
				{
					System.out.println(e.toString());
				}
			}
		}

		if (successFlag == true)
		{
			System.out.println("입력성공!");
			// javaStudy/memberList를 다시 한 번 response.
			response.sendRedirect("memberList");
		} else {
			System.out.println("입력실패!");
		}
	}
}