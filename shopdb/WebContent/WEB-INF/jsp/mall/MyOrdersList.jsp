<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order List</title>
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
	<h1>My Order List</h1>
	<c:if test="${list == null}">
		주문 내역이 없습니다.
	</c:if>
	<c:if test="${list != null}">
		<table border="1" class="table table-striped">
			<thead>
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
					<th>ORDER CANCEL</th>
				</tr>
			</thead>
			<tbody>
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
					<td><a href="${pageContext.request.contextPath}/mall/MyUpdateOrders?ordersId=${o.getOrders().ordersId}">ORDER CANCEL</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
	<a href="${pageContext.request.contextPath}/mall/MallIndex">BACK</a>
	</div>
</body>
</html>