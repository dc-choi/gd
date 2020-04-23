<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category Update</title>
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
	<h1>Category Update</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<form method="post" action="${pageContext.request.contextPath}/admin/UpdateCategory">
		<div class="form-group">
			CATEGORY ID : 
			<input type="text" class="form-control" name="categoryId" value="${category.categoryId}" readonly="readonly">
		</div>
		<div class="form-group">
			CATEGORY NAME : 
			<input type="text" class="form-control" name="categoryName" value="${category.categoryName}">
		</div>
		<button type="submit" class="btn btn-primary">UPDATE</button>
	</form>
	<a href="${pageContext.request.contextPath}/admin/CategoryList">BACK</a>
	</div>
</body>
</html>