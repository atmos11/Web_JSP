package ac.yongin.yulli.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ac.yongin.yulli.board.common.JDBCUtil;
import ac.yongin.yulli.user.vo.UserVO;

public class UserDAO {
	public UserVO getId(String id, String password) throws SQLException
	{
		UserVO vo=new UserVO();
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
			conn = DriverManager.getConnection(url,"scott","tiger");
			String query = "select*from user where id = 'id' and password = 'password'";
			
			stmt = conn.createStatement();
			stmt.executeQuery(query);
			if(rs.next())
			{
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		return vo;
	}
	
	public List<UserVO> getUserList() throws SQLException
	{
		List<UserVO> users = new ArrayList<UserVO>();
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		
		try {
			//db 접속
			//vo<-select*from user where id = 'id' and password = 'password';
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
			conn = DriverManager.getConnection(url,"scott","tiger");
			String query = "select*from user where id = 'id' and password = 'password'";
			
			stmt = conn.createStatement();
			stmt.executeQuery(query);
			if(rs.next())
			{
				((UserVO) users).setId(rs.getString("id"));
				((UserVO) users).setName(rs.getString("name"));
				((UserVO) users).setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		return users;
	}

}
