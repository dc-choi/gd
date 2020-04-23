<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	System.out.println(qnaNo + "<-- qnaNo");
	String qnaPw = request.getParameter("qnaPw");
	System.out.println(qnaPw + "<-- qnaPw");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	PreparedStatement stmt1 = conn.prepareStatement(
			"delete from qna where qna_no=? and qna_pw=?");
	stmt1.setInt(1, qnaNo);
	stmt1.setString(2, qnaPw);
	System.out.println(stmt1 + "<-- stmt1");
	
	int row = stmt1.executeUpdate(); // 1 or 0
	System.out.println(row + "<-- row");
	
	if(row == 0) {
		response.sendRedirect(request.getContextPath()+"/qna/selectQnA.jsp?qnaNo="+qnaNo);
	} else {
		response.sendRedirect(request.getContextPath()+"/qna/QnAList.jsp");
	}
%>