<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Item</title>
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
	<h1>Update Item</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<form method="post" action="${pageContext.request.contextPath}/admin/UpdateItem">
		<div class="form-group">
			ITEM ID : 
			<input type="text" class="form-control" name="itemId" value="${item.itemId}" readonly="readonly">
		</div>
		<div class="form-group">
			CATEGORY NAME : 
			<select name="categoryId" class="form-control">
				<c:forEach var="i" items="${list}">
					<option value="${i.categoryId}">${i.categoryName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			ITEM NAME : 
			<input type="text" class="form-control" name="itemName" value="${item.itemName}">
		</div>
		<div class="form-group">
			ITEM PRICE : 
			<input type="text" class="form-control" name="itemPrice" value="${item.itemPrice}">
		</div>
		<div class="form-group">
			ITEM CONTENTS : 
			<textarea rows="9" cols="20" class="form-control" name="itemContents">${item.itemContents}</textarea>
		</div>
		<div class="form-group">
			ITEM_IMG : 
			<input type="text" class="form-control" name="itemImg" value="${item.itemImg}">
		</div>
		<button type="submit" class="btn btn-primary">UPDATE</button>
	</form>
	<a href="${pageContext.request.contextPath}/admin/ItemList">BACK</a>
	</div>
</body>
</html>