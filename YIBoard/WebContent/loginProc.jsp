<%@page import="ac.yongin.yulli.board.common.JDBCUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="ac.yongin.yulli.user.dao.UserDAO"%>
<%@ page import="ac.yongin.yulli.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//사용자가 입력한 아이디 패스워드
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	// vo 내 id, password에 저장
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPassword(password);

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB내에 동일한 id와 pw가 존재할 때 id 반환
	String sql = "select id from users where id=? and password=?";
	try {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPassword());
		rs = pstmt.executeQuery();
		if(rs.next())	// 반환 값 있으면 일치하는 회원
		{
			session.setAttribute("user", vo);
			response.sendRedirect("getBoardList.jsp");
		}
		else	// 반환 값 없으면 불일치
		{
			response.sendRedirect("Login.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		JDBCUtil.close(conn, pstmt);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginProcess</title>
</head>
<body>
</body>
</html>