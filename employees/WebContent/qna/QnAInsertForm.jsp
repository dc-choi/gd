<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String msg = "";
		if(request.getParameter("ck") != null) {
			msg = "에 빈값이 있습니다.";
		}
	%>
	<div class="container-fluid bg-light">
	<!-- Navigation MainMenu -->
	<div>
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1 class="text-secondary">QnA 입력 폼<%=msg%></h1>
	<form method="post" action="QnAInsertAction.jsp">
		<!-- 제목 -->
		<div class="form-group">
			<label for="qnaTitle">Title: </label> 
			<input type="text" class="form-control" id="qnaTitle" name="qnaTitle">
		</div>
		<!-- 내용 -->
		<div class="form-group">
			<label for="qnaContent">Comment: </label>
			<textarea class="form-control" rows="5" id="qnaContent" name="qnaContent"></textarea>
		</div>
		<!-- 아이디 -->
		<div class="form-group">
			<label for="qnaUser">User: </label> 
			<input type="text" class="form-control" id="qnaUser" name="qnaUser">
		</div>
		<!-- 패스워드 -->
		<div class="form-group">
			<label for="qnaPw">Pw:</label> 
			<input type="password" class="form-control" id="qnaPw" name="qnaPw">
		</div>
		<button type="submit" class="btn btn-secondary">글 입력</button>
	</form>
	</div>
</body>
</html>