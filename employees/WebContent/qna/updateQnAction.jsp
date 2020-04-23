<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="gd.emp.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		System.out.println(qnaNo);
		String qnaPw = request.getParameter("qnaPw");
		System.out.println(qnaPw + " <-- qnapw(1)");
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		
		PreparedStatement stmt1 = conn.prepareStatement(
				"select qna_no, qna_title, qna_content, qna_user, qna_date, qna_pw from qna where qna_no=?");
		stmt1.setInt(1, qnaNo);
		System.out.println(stmt1 + " <-- stmt1");
		
		ResultSet rs1 = stmt1.executeQuery();
		System.out.println(rs1 + " <-- rs1");
		
		String qnaPw2 = "";
		Qna qna = new Qna();
		if(rs1.next()) {
			qna.qnaNo = rs1.getInt("qna_no");
			qna.qnaTitle = rs1.getString("qna_title");
			qna.qnaContent = rs1.getString("qna_content");
			qna.qnaUser = rs1.getString("qna_user");
			qna.qnaDate = rs1.getString("qna_date");
			qna.qnaDate = rs1.getString("qna_date");
			qna.qnaPw = rs1.getString("qna_pw");
			qnaPw2 = qna.qnaPw;
		} System.out.println(qnaPw + " <-- qnapw(2)");
		System.out.println(qnaPw2 + " <-- qnapw2");
		
		if (qnaPw != qnaPw2) {
			response.sendRedirect(request.getContextPath() + "/qna/updateQnAForm.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/qna/updateQnAForm2.jsp");
		}
	%>
</body>
</html>