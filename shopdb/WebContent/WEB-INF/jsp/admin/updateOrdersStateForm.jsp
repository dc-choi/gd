<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Orders State</title>
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
	<h1>Update Orders State</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<form method="post" action="${pageContext.request.contextPath}/admin/UpdateOrders">
		<div class="form-group">
			ORDERS_ID : 
			<input type="text" class="form-control" name="ordersId" value="${orders.ordersId}" readonly="readonly">
		</div>
		<div class="form-group">
			ITEM_ID : 
			<input type="text" class="form-control" name="itemId" value="${orders.itemId}" readonly="readonly">
		</div>
		<div class="form-group">
			ORDERS_STATE : 
			<select name="ordersState" class="form-control">
				<option value="주문완료">주문완료</option>
				<option value="주문취소">주문취소</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
			</select>
		</div>
		<button type="submit" class="btn btn-primary">UPDATE</button>
	</form>
	<a href="${pageContext.request.contextPath}/admin/OrdersList">BACK</a>
	</div>
</body>
</html>