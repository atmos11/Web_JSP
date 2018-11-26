<%@ page import="ac.yongin.yulli.board.dao.BoardDAO"%>
<%@ page import="ac.yongin.yulli.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String seq = request.getParameter("seq");
	BoardVO vo = new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDao = new BoardDAO();
	BoardVO board = boardDao.getBoard(vo);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 상세 페이지</title>
</head>
<body>
<div align="center">
<h2>글 상세보기</h2>
<a href = "logoutProc.jsp">logout</a>
<hr>
<form action="updateBoard_Proc.jsp" method="post">
<input type="hidden" name="seq" value="<%=board.getSeq() %>"/>
<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="orange" width="70">제목</td>
		<td align="left"><input name="title"type="text"value=<%=board.getTitle()%>></td>
	</tr>
	<tr>
		<td bgcolor="orange">작성자</td>
		<td align="left"><%=board.getWriter()%></td>
	</tr>
	<tr>
		<td bgcolor="orange" width="70">내용</td>
		<td align="left">
		<textarea name="content" cols="40" rows="10">
		<%=board.getContent() %>
		</textarea></td>
	</tr>
	<tr>
		<td bgcolor="orange">등록일</td>
		<td align="left"><%=board.getRegDate()%></td>
	</tr>
	<tr>
		<td bgcolor="orange">조회수</td>
		<td align="left"><%=board.getCnt()%></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="글수정"/></td>	
	</tr>
</table>
</form>
</div>

</body>
</html>