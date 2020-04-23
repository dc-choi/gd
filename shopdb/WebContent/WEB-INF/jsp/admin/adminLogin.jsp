<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<h1>Admin Login</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/AdminLogin">
		<div class="form-group">
			ID : <input type="text" class="form-control" name="adminId">
		</div>
		<div class="form-group">
			PW : <input type="password" class="form-control" name="adminPw">
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">Login</button>
		</div>
	</form>
	</div>
</body>
</html>