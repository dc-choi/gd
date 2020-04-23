<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Orders</title>
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
	<!-- item 상세화면 -->
	<div class="container">
	<table border="1" class="table table-striped">
		<tr>
			<td>item_id</td>
			<td>${item.itemId}</td>
		</tr>
		<tr>
			<td>category_id</td>
			<td>${item.categoryId}</td>
		</tr>
		<tr>
			<td>item_name</td>
			<td>${item.itemName}</td>
		</tr>
		<tr>
			<td>item_price</td>
			<td>${item.itemPrice}</td>
		</tr>
		<tr>
			<td>item_contents</td>
			<td>${item.itemContents}</td>
		</tr>
		<tr>
			<td>item_img</td>
			<td>
			<img width="120" height="80" src="${pageContext.request.contextPath}/imgs/${item.itemImg}">
			</td>
		</tr>
	</table>
	<br>
	<!-- 주문 form -->
	<form method="post" action="${pageContext.request.contextPath}/mall/InsertOrders">
		<input type="hidden" name="itemId" value="${item.itemId}">
		<input type="hidden" name="itemPrice" value="${item.itemPrice}">
		<div class="form-group">
			item_count : 
			<input type="text" class="form-control" name="itemCount" value="1">
		</div>
		<div class="form-group">
			user_name : 
			<input type="text" class="form-control" name="userName" value="홍길동">
		</div>
		<div class="form-group">
			user_phone : 
			<input type="text" class="form-control" name="userPhone" value="010-1234-5678">
		</div>
		<div class="form-group">
			user_address : 
			<input type="text" class="form-control" name="userAddress" value="한양시 중앙시장구 1길 1-1 길동이네">
		</div>
		<button type="submit" class="btn btn-primary">Insert</button>
	</form>
	<a href="${pageContext.request.contextPath}/mall/MallIndex">BACK</a>
	</div>
</body>
</html>