package com.flo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flo.common.ConnectionPool;


public class MemberDAO
{
	
	private final String SELECT_SQL = "SELECT * FROM MEMBER";
	private final String SELECT_ID_SQL = "SELECT * FROM MEMBER WHERE ID = ?";
	private final String SELECT_BY_ID_SQL = "SELECT COUNT(*) AS COUNT FROM MEMBER WHERE ID = ?";
	private final String SELECT_LOGIN_CHECK_SQL = "SELECT PWD FROM MEMBER WHERE ID = ?";
	private final String INSERT_SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,?)";
	private final String DELETE_SQL = "DELETE FROM MEMBER WHERE ID =?";
	private final String UPDATE_SQL = "UPDATE MEMBER SET PWD=?, phone1=?, phone2=?, phone3=?, email=?, zipcode=?, address1=?, address2=? WHERE id=?";
	
	
	public int loginCheck(MemberVO mvo)
	{	// to
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		
		String pass = null;
		
		try
		{
			pstmt = con.prepareStatement(SELECT_LOGIN_CHECK_SQL);
			pstmt.setString(1, mvo.getId());
			rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				pass = rs.getString("PASS");
				check = (pass.equals(mvo.getPwd()) == true) ? 1:0;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			cp.dbClose(con, pstmt, rs);
		}
		return check;
	}
	

}
