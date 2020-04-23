<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN INDEX</title>
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
	<h1>ADMIN INDEX</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<ol>
		<li><a href="${pageContext.request.contextPath}/admin/MemberList">MEMBER LIST</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/CategoryList">CATEGORY LIST</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/ItemList">ITEM LIST</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/OrdersList">ORDER LIST</a></li>
	</ol>
	</div>
</body>
</html>