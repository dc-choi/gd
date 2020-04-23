<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List</title>
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
	<h1>Category List</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/InsertCategory">Insert Category</a>
	<table border='1' class="table table-striped">
		<tr>
			<th>category_id</th>
			<th>category_name</th>
			<th>UPDATE</th>
		</tr>
		<c:forEach var="c" items="${list}"> <!-- request.getAttribute("list")와 같음 -->
			<tr>
				<!-- getter setter가 있지않으면 jstl이 인식을 못함 -->
				<td>${c.categoryId}</td>
				<td>${c.categoryName}</td>
				<td><a href="${pageContext.request.contextPath}/admin/UpdateCategory?categoryId=${c.categoryId}">UPDATE</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/Index">BACK</a>
	</div>
</body>
</html>