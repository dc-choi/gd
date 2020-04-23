<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="gd.emp.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateQnAForm</title>
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
	%>
	<div class="container-fluid">
	<!-- Navigation MainMenu -->
	<div>
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1>updateQnAForm</h1>
	<form method="post" action="<%=request.getContextPath()%>/qna/updateQnAction.jsp">
		<input type="hidden" id="qnaNo" name="qnaNo" value="<%=qnaNo%>">
		<div class="form-group">
		<label for="qnaPw">PW :</label>
		<input type="password" id="qnaPw" name="qnaPw">
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
	</div>
</body>
</html>