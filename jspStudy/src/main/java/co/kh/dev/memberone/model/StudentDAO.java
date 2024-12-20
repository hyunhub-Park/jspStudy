package co.kh.dev.memberone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.dev.common.ConnectionPool;

public class StudentDAO
{
	private final String SELECT_SQL = "SELECT * FROM STUDENT";
	private final String SELECT_ID_SQL = "SELECT * FROM STUDENT WHERE ID = ?";
	private final String SELECT_BY_ID_SQL = "SELECT COUNT(*) AS COUNT FROM STUDENT WHERE ID = ?";
	private final String SELECT_LOGIN_CHECK_SQL = "SELECT pass FROM STUDENT WHERE ID = ?";
	private final String INSERT_SQL = "insert into student values(?,?,?,?,?,?,?,?,?,?)";
	private final String DELETE_SQL = "DELETE FROM STUDENT WHERE ID =?";
	private final String UPDATE_SQL = "UPDATE STUDENT SET pass=?, phone1=?, phone2=?, phone3=?, email=?, zipcode=?, address1=?, address2=? WHERE id=?";
	// 테이블당 DAO별도로 만들어야 함.
	private final String SELECT_ZIP_SQL = "SELECT * FROM zipcode WHERE dong LIKE ?";

	// 전체를 DB에서 출력.
	public ArrayList <StudentVO> selectDB()
	{
		// Connection con = DBUtility.dbCon();
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<StudentVO> tmList = new ArrayList<StudentVO>();

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

				StudentVO tmvo = new StudentVO(id, passwd, name, memNum1, memNum2, eMail, phone, zipcode, address, job);

				tmList.add(tmvo);
			}
		} catch (SQLException e)
		{
			// System.out.println(e.toString());
			e.printStackTrace();
		} finally
		{
			// DBUtility.dbClose(con, pstmt, rs);
			cp.dbClose(con, pstmt, rs);
		}
		return tmList;
	}

	// idCheck.
	public boolean selectIdCheck(StudentVO svo)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try
		{
			pstmt = con.prepareStatement(SELECT_BY_ID_SQL);
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();

			if (rs.next())
			{
				count = rs.getInt("count");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			cp.dbClose(con, pstmt, rs);
		}

		return (count != 0) ? true : false;
	}

	// zipCheck.
	public ArrayList <ZipCodeVO> selectZipCode(ZipCodeVO zvo)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ZipCodeVO> zipList = new ArrayList<ZipCodeVO>();

		try
		{
			pstmt = con.prepareStatement(SELECT_ZIP_SQL);
			String dongValue = zvo.getDong() + "%"; // "박촌동%"
			pstmt.setString(1, dongValue);
			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong = rs.getString("dong");
				String bunji = rs.getString("bunji");

				ZipCodeVO obj = new ZipCodeVO(zipcode, sido, gugun, dong, bunji);

				zipList.add(obj);
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			cp.dbClose(con, pstmt, rs);
		}
		
		return zipList;
	}

	// regProc.
	public Boolean insertDB(StudentVO svo)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		
		int count = 0;
		
		try
		{
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1,svo.getId());
			pstmt.setString(2, svo.getPass());
			pstmt.setString(3, svo.getName());
			pstmt.setString(4, svo.getPhone1());
			pstmt.setString(5, svo.getPhone2());
			pstmt.setString(6, svo.getPhone3());
			pstmt.setString(7, svo.getEmail());
			pstmt.setString(8, svo.getZipcode());
			pstmt.setString(9, svo.getAddress1());
			pstmt.setString(10,svo.getAddress2());
			count = pstmt.executeUpdate();
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			cp.dbClose(con, pstmt);
		}
		return (count > 0) ? true : false;
	}

	//	loginProc.
	public int loginCheck(String id, String pass)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		
		try
		{
			pstmt = con.prepareStatement(SELECT_LOGIN_CHECK_SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				String dbPass = rs.getString("pass");
				if (pass.equals(dbPass))
				{
					check = 1;
				} else
				{
					check = 0;
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			if(rs != null)
			{
				try
				{
					rs.close();
				} catch(SQLException e)
				{
						e.printStackTrace();
				}
			}
			
			if(pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			if(con != null)
			{
				try
				{
					con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
		
		return check;
	}
	
	public int selectLoginCheck(StudentVO svo)
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
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				pass = rs.getString("PASS");
				check = (pass.equals(svo.getPass()) == true) ? 1:0;
			} else
			{
				check = 1;
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
	
	// deleteProc.
	public int deleteMember(String id, String pass)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPass = "";	// 데이터베이스에 실제 저장된 패스워드
		
		int result = -1;	// 결과치
		
		try
		{
			pstmt = con.prepareStatement(SELECT_LOGIN_CHECK_SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				dbPass = rs.getString("pass");
				if (dbPass.equals(pass))
				{	// true - 본인 확인
					pstmt = con.prepareStatement(DELETE_SQL);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1;// 회원탈퇴 성공
				} else
				{	// 본인확인 실패 - 비밀번호 오류
					result = 0;
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			if (con != null)
			{
				{
					try
					{
						con.close();
					} catch (SQLException e)
					{
						e.printStackTrace();
					}
				}
			}
		}
		
		return result;
	}
	
	// modifyProc.
	public StudentVO getMember(String id)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StudentVO svo = null;

		try
		{
			pstmt = con.prepareStatement(SELECT_ID_SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next())
			{	// 해당 아이디에 대한 회원이 존재
				svo = new StudentVO();
				svo.setId(rs.getString("id"));
				svo.setPass(rs.getString("pass"));
				svo.setName(rs.getString("name"));
				svo.setPhone1(rs.getString("phone1"));
				svo.setPhone2(rs.getString("phone2"));
				svo.setPhone3(rs.getString("phone3"));
				svo.setEmail(rs.getString("email"));
				svo.setZipcode(rs.getString("zipcode"));
				svo.setAddress1(rs.getString("Address1"));
				svo.setAddress2(rs.getString("Address2"));
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			if (con != null)
			{
				try
				{
					con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
		
		return svo;
	}
	
	/*
	 * // modifyProc. public StudentVO getMember(StudentVO svo) {	// to
	 * ConnectionPool cp
	 * = ConnectionPool.getInstance(); Connection con = cp.dbCon();
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * StudentVO resultVO = null;
	 * 
	 * try { pstmt = con.prepareStatement(SELECT_ID_SQL); pstmt.setString(1,
	 * svo.getId()); rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { // 해당 아이디에 대한 회원이 존재
	 * 
	 * String id = rs.getString("ID"); String passwd = rs.getString("PASSWD");
	 * String name = rs.getString("NAME"); String memNum1 =
	 * rs.getString("MEM_NUM1"); String memNum2 = rs.getString("MEM_NUM2"); String
	 * eMail = rs.getString("E_MAIL"); String phone = rs.getString("PHONE"); String
	 * zipcode = rs.getString("ZIPCODE"); String address = rs.getString("ADDRESS");
	 * String job = rs.getString("JOB");
	 * 
	 * resultVO = new StudentVO(id, passwd, name, phone, phone, phone, eMail,
	 * zipcode, address, address); } } catch (Exception e) { e.printStackTrace(); }
	 * finally { if (rs != null) { try { rs.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } }
	 * 
	 * if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } }
	 * 
	 * if (con != null) { try { con.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } } }
	 * 
	 * return svo; }
	 */
	
	
	
	
	
	// modifyProc.
	public void updateMember(StudentVO svo)
	{
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		 
		try
		{
			pstmt = con.prepareStatement(UPDATE_SQL);
			pstmt.setString(1, svo.getPass());
			pstmt.setString(2, svo.getPhone1());
			pstmt.setString(3, svo.getPhone2());
			pstmt.setString(4, svo.getPhone3());
			pstmt.setString(5, svo.getEmail());
			pstmt.setString(6, svo.getZipcode());
			pstmt.setString(7, svo.getAddress1());
			pstmt.setString(8, svo.getAddress2());
			pstmt.setString(9, svo.getId());
			pstmt.executeUpdate();
		 } catch (Exception e)
		 {
			e.printStackTrace();
		 } finally
		 {
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			
			if (con != null)
			{
				try
				{
					con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		 }
	}
}