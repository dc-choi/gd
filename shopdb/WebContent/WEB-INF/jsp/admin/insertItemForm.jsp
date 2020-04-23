<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Item</title>
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
	<h1>Insert Item</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<form method="post" action="${pageContext.request.contextPath}/admin/InsertItem">
		<div class="form-group">
			category_name : 
			<select name="categoryId" class="form-control">
				<c:forEach var="i" items="${list}">
					<option value="${i.categoryId}">${i.categoryName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			item_name : 
			<input type="text" class="form-control" name="itemName">
		</div>
		<div class="form-group">
			item_price : 
			<input type="text" class="form-control" name="itemPrice">
		</div>
		<div class="form-group">
			item_contents : 
			<textarea rows="9" cols="20" class="form-control" name="itemContents"></textarea>
		</div>
		<div class="form-group">
			item_img : 
			<input type="text" class="form-control" name="itemImg" value="noimage.jpg">
		</div>
		<button type="submit" class="btn btn-primary">INSERT ITEM</button>
	</form>
	<a href="${pageContext.request.contextPath}/admin/ItemList">BACK</a>
	</div>
</body>
</html>