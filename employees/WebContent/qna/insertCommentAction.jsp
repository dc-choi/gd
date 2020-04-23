<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo");
	
	String CommentPw = request.getParameter("CommentPw");
	System.out.println(CommentPw + "<-- CommentPw");
	
	String Comment = request.getParameter("Comment");
	System.out.println(Comment + "<-- Comment");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	PreparedStatement stmt1 = conn.prepareStatement("select max(comment_no) from comment");
	ResultSet rs1 = stmt1.executeQuery();
	
	int commentNo = 1;
	if(rs1.next()) {
		commentNo = rs1.getInt("max(comment_no)") + 1;
	}
	
	// 입력
	PreparedStatement stmt2 = conn.prepareStatement("insert into comment(comment_no, qna_no, comment, comment_date, comment_pw) values(?, ?, ?, now(), ?)");
	stmt2.setInt(1, commentNo);
	stmt2.setInt(2, qnaNo);
	stmt2.setString(3, Comment);
	stmt2.setString(4, CommentPw);
	stmt2.executeUpdate();
	
	response.sendRedirect(request.getContextPath()+"/qna/selectQnA.jsp?qnaNo="+qnaNo);
%>