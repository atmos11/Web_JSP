package ac.yongin.yulli.board.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/board?useSSL=false","scott","tiger");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void close(Connection conn, PreparedStatement pstmt)
	{
		if(pstmt != null)
		{
			try {
				if(!pstmt.isClosed())
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pstmt = null;
			}
		}
		if(conn != null)
		{
			try {
				if(!conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				conn = null;
			}
		} 
	}
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs)
	{
		if(rs!=null)
		{
			try {
				if(!rs.isClosed())
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				rs = null;
			}
		}
		if(pstmt!=null)
		{
			try {
				if(!pstmt.isClosed())
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pstmt = null;
			}
		}
		if(conn!=null)
		{
			try {
				if(!conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
}
