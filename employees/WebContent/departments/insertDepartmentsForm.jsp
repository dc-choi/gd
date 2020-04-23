<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body class="bg-light">
	<div class="container-fluid">
		<div>
			<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
		</div>
		<h1 class="text-secondary">부서 입력</h1>
		<form method="post" action="<%=request.getContextPath()%>/departments/insertDepartmentAction.jsp">
			<div class="input-group mb-3">
	    		<input type="text" class="form-control" name="deptName">
	    		<div class="input-group-append">
	      		<input class="btn btn-secondary" type="submit">
				</div>
			</div>
		</form>
	</div>
</body>
</html>