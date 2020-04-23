<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN Orders List</title>
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
	<h1>ADMIN Orders List</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	
	<form class="form-inline" action="${pageContext.request.contextPath}/admin/OrdersList">
	<input type="text" class="form-control" name="searchWord">
	<button type="submit" class="btn btn-primary">찾기</button>	
	</form><br><br>
	
	<table border="1" class="table table-striped">
		<tr>
			<th>orders_id</th>
			<th>item_id</th>
			<th>item_name</th>
			<th>item_count</th>
			<th>orders_date</th>
			<th>orders_price</th>
			<th>orders_state</th>
			<th>user_name</th>
			<th>user_phone</th>
			<th>user_address</th>
			<th>UPDATE</th>
		</tr>
		<c:forEach var="o" items="${list}">
			<tr>
				<td>${o.getOrders().ordersId}</td>
				<td>${o.getOrders().itemId}</td>
				<td>${o.getItem().itemName}</td>
				<td>${o.getOrders().itemCount}</td>
				<td>${o.getOrders().ordersDate}</td>
				<td>${o.getOrders().ordersPrice}</td>
				<td>${o.getOrders().ordersState}</td>
				<td>${o.getOrders().userName}</td>
				<td>${o.getOrders().userPhone}</td>
				<td>${o.getOrders().userAddress}</td>
				<td><a href="${pageContext.request.contextPath}/admin/UpdateOrders?ordersId=${o.getOrders().ordersId}">UPDATE</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/Index">BACK</a>
	</div>
</body>
</html>