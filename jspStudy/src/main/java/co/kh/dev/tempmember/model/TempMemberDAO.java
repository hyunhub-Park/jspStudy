package co.kh.dev.tempmember.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.dev.common.DBUtility;

public class TempMemberDAO
{
	private final String SELECT_SQL = "SELECT * FROM TEMPMEMBER";
	private final String SELECT_BY_ID_SQL = "SELECT * FROM TEMPMEMBER WHERE ID = ?";
	private final String SELECT_LOGIN_CHECK_SQL = "SELECT * FROM ACCOUNT WHERE ID = ? AND PWD = ?";
	private final String INSERT_SQL = "INSERT INTO TEMPMEMBER VALUES(?)";
	private final String DELETE_SQL = "DELETE FROM TEMPMEMBER WHERE NO = ?";
	private final String UPDATE_SQL = "UPDATE TEMPMEMBER SET NAME= ? , PWD = ? WHERE ID = ?";

	// 전체를 DB에서 출력
	public ArrayList<TempMemberVO> selectDB()
	{
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<TempMemberVO> tmList = new ArrayList<TempMemberVO>();
		
		try
		{
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				String id = rs.getString("ID");
				String passwd = rs.getString("PASSWD");
				String name = rs.getString("NAME");
				String memNum1 = rs.getString("MEM_NUM1");
				String memNum2 = rs.getString("MEM_NUM2");
				String eMail = rs.getString("E_MAIL");
				String phone = rs.getString("PHONE");
				String zipcode = rs.getString("ZIPCODE");
				String address = rs.getString("ADDRESS");
				String job = rs.getString("JOB");
				
				TempMemberVO tmvo = new TempMemberVO(id, passwd, name, memNum1, memNum2, eMail, phone, zipcode, address, job);
				
				tmList.add(tmvo);
			}
		} catch (SQLException e)
		{
			// System.out.println(e.toString());
			e.printStackTrace();
		}
		return tmList;
	}

	// 아이디를 받아서 아이디에 맞는 레코드 출력
	/*
	 * public TempMemberVO selectByIdDB(TempMemberVO mvo) { Connection con =
	 * DBUtility.dbCon(); PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * try { pstmt = con.prepareStatement(SELECT_BY_ID_SQL); pstmt.setString(1,
	 * mvo.getId()); rs = pstmt.executeQuery(); if (rs.next()) { int no =
	 * rs.getInt("NO"); String name = rs.getString("NAME"); String id =
	 * rs.getString("ID"); String pwd = rs.getString("PWD"); Date regdate =
	 * rs.getDate("REGDATE"); mvo = new TempMemberVO(no, name, id, pwd, regdate); }
	 * else { // mvo=new TempMemberVO();} mvo = null; } } catch (SQLException e) {
	 * e.printStackTrace(); } return mvo; }
	 * 
	 * // id, pwd를받아서 맞는 레코드를 출력 public TempMemberVO selectLoginCheckDB(TempMemberVO
	 * mvo) { Connection con = DBUtility.dbCon(); PreparedStatement pstmt = null;
	 * ResultSet rs = null; try { pstmt =
	 * con.prepareStatement(SELECT_LOGIN_CHECK_SQL); pstmt.setString(1,
	 * mvo.getId()); pstmt.setString(2, mvo.getPwd()); rs = pstmt.executeQuery(); if
	 * (rs.next()) { int no = rs.getInt("NO"); String name = rs.getString("NAME");
	 * String id = rs.getString("ID"); String pwd = rs.getString("PWD"); Date
	 * regdate = rs.getDate("REGDATE"); mvo = new TempMemberVO(no, name, id, pwd,
	 * regdate); } else { // mvo = new TempMemberVO(); mvo = null; } } catch
	 * (SQLException e) { e.printStackTrace(); } return mvo; }
	 * 
	 * public Boolean insertDB(TempMemberVO mvo) { Connection con =
	 * DBUtility.dbCon(); PreparedStatement pstmt = null; int rs = 0; try { pstmt =
	 * con.prepareStatement(INSERT_SQL); pstmt.setString(1, mvo.getName());
	 * pstmt.setString(2, mvo.getId()); pstmt.setString(3, mvo.getPwd()); rs =
	 * pstmt.executeUpdate(); } catch (SQLException e) { e.printStackTrace(); }
	 * return (rs == 0) ? false : true; }
	 * 
	 * public Boolean deleteDB(TempMemberVO mvo) { Connection con =
	 * DBUtility.dbCon(); PreparedStatement pstmt = null; int rs = 0; try { pstmt =
	 * con.prepareStatement(DELETE_SQL); pstmt.setInt(1, mvo.getNo()); rs =
	 * pstmt.executeUpdate(); } catch (SQLException e) { e.printStackTrace(); }
	 * return (rs == 0) ? false : true; }
	 * 
	 * public Boolean updateDB(TempMemberVO mvo) { Connection con =
	 * DBUtility.dbCon(); PreparedStatement pstmt = null; int rs = 0; try { pstmt =
	 * con.prepareStatement(UPDATE_SQL); pstmt.setString(1, mvo.getName());
	 * pstmt.setString(2, mvo.getPwd()); pstmt.setString(3, mvo.getId()); rs =
	 * pstmt.executeUpdate(); } catch (SQLException e) { e.printStackTrace(); }
	 * return (rs == 0) ? false : true; }
	 */
}