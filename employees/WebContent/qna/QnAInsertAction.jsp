<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	// request 매개값 설정 (ip, title, comment, user, pw)
	// ip부분 받아오기
	String qnaIp = request.getRemoteAddr();
	String qnaTitle = request.getParameter("qnaTitle");
	String qnaContent = request.getParameter("qnaContent");
	String qnaUser = request.getParameter("qnaUser");
	String qnaPw = request.getParameter("qnaPw");
	// 디버깅
		System.out.println(qnaIp+"<---qnaIp");
		System.out.println(qnaTitle+"<---qnaTitle");
		System.out.println(qnaContent+"<---qnaContent");
		System.out.println(qnaUser+"<---qnaUser");
		System.out.println(qnaPw+"<---qnaPw");
	
	// 매개값에 공백이 있는 경우 폼으로 되돌려 보낼것 (ck 추가)
	if(qnaTitle.equals("") || qnaContent.equals("") || qnaUser.equals("") || qnaPw.equals("")) {
		response.sendRedirect(request.getContextPath()+"/qna/QnAInsertForm.jsp?ck=fail");
		return; // 모든 프로그래밍언어에서 명령을 종료시키는건 return이다 --> response~ 이게 끝나고 쭉 실행될수도 있어서
	}
	
	// qnaNo
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	PreparedStatement stmt1 = conn.prepareStatement("select max(qna_no) from qna");
	System.out.println(stmt1+"<---stmt1");
	ResultSet rs1 = stmt1.executeQuery();
	System.out.println(rs1+"<---rs1");
	
	int qnaNo = 1;
	// rs1에 값이 있으면 qnaNo의 값 + 1
	// else이면 qnaNo를 1부터 시작 --> 1부터 시작하면 안적어도됌
	if(rs1.next()) {
		qnaNo = rs1.getInt("max(qna_no)") + 1;
	}
	System.out.println(qnaNo+"<---qnaNo");
	
	// qnaDate : sql문에서 now()함수를 사용

	PreparedStatement stmt2 = conn.prepareStatement("insert into qna(qna_no, qna_title, qna_content, qna_user, qna_pw, qna_ip, qna_date) values(?, ?, ?, ?, ?, ?, now())");
	stmt2.setInt(1, qnaNo);
	stmt2.setString(2, qnaTitle);
	stmt2.setString(3, qnaContent);
	stmt2.setString(4, qnaUser);
	stmt2.setString(5, qnaPw);
	stmt2.setString(6, qnaIp);
	stmt2.executeUpdate();
	
	response.sendRedirect(request.getContextPath()+"/qna/QnAList.jsp");
%>