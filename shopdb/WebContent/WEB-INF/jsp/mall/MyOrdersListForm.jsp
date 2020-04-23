<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order List Form</title>
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
	<h1>My Order List Form</h1>
	<form method="post" action="${pageContext.request.contextPath}/mall/MyOrdersList">
		<div class="form-group">
			user_name : 
			<input type="text" class="form-control" name="userName">
		</div>
		<div class="form-group">
			user_phone : 
			<input type="text" class="form-control" name="userPhone">
		</div>
		<div class="form-group">
			user_address : 
			<input type="text" class="form-control" name="userAddress">
		</div>
		<button type="submit" class="btn btn-primary">FIND</button>
	</form>
	<a href="${pageContext.request.contextPath}/mall/MallIndex">BACK</a>
	</div>
</body>
</html>