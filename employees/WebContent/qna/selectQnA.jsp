<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="gd.emp.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		System.out.println(qnaNo + "<-- qnaNo");
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		PreparedStatement stmt1 = conn.prepareStatement(
				"select qna_no, qna_title, qna_content, qna_user, qna_date from qna where qna_no=?");
		stmt1.setInt(1, qnaNo);
		System.out.println(stmt1 + "<-- stmt1");
		
		ResultSet rs1 = stmt1.executeQuery();
		System.out.println(rs1 + "<-- rs1");
		
		Qna qna = new Qna();
		if(rs1.next()) {
			qna.qnaNo = rs1.getInt("qna_no");
			qna.qnaTitle = rs1.getString("qna_title");
			qna.qnaContent = rs1.getString("qna_content");
			qna.qnaUser = rs1.getString("qna_user");
			qna.qnaDate = rs1.getString("qna_date");
		}
	%>
	<div class="container-fluid">
	<!-- Navigation MainMenu -->
	<div>
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
		<h1>상세보기</h1>
		<table class="table table-dark">
			<tr>
				<td>qnaTitle</td>
				<td><%=qna.qnaTitle%></td>
			</tr>
			<tr>
				<td>qnaContent</td>
				<td><%=qna.qnaContent%></td>
			</tr>
			<tr>
				<td>qnaUser</td>
				<td><%=qna.qnaUser%></td>
			</tr>
			<tr>
				<td>qnaDate</td>
				<td><%=qna.qnaDate.substring(0, 10)%></td>
			</tr>
		</table>
		<div>
			<a href="<%=request.getContextPath()%>/qna/updateQnAForm.jsp?qnaNo=<%=qna.qnaNo%>">수정</a>
			<a href="<%=request.getContextPath()%>/qna/deleteQnAForm.jsp?qnaNo=<%=qna.qnaNo%>">삭제</a>
		</div>
		<br>
		<form method="post" action="<%=request.getContextPath()%>/qna/insertCommentAction.jsp">
			<input type="hidden" class="form-control" id="qnaNo" name="qnaNo" value="<%=qna.qnaNo%>">
			<div class="form-group">
			<label for="commentPw">PW :</label>
			<input type="password" class="form-control" id="CommentPw" name="CommentPw">
			</div>
			<div class="form-group">
			<label for="Comment">Comment :</label>
			<textarea class="form-control" rows="5" id="Comment" name="Comment"></textarea>
			</div>
			<button type="submit" class="btn btn-secondary">Submit</button>
		</form>
		<%
			// select comment_no, comment from comment;
			// where qna_no = ?;
			// limit ?, ?
		%>
	</div>
</body>
</html>