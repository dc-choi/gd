<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item List</title>
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
	<h1>Item List</h1>
	<h3>${SloginId}님 반갑습니다.</h3>
	<a href="${pageContext.request.contextPath}/admin/AdminLogout">Logout</a><br><br>
	<a href="${pageContext.request.contextPath}/admin/InsertItem">Insert Item</a>
	<c:if test="${list == null}">
		상품이 없습니다
	</c:if>
	<c:if test="${list != null}">
		<table border="1" class="table table-striped">
			<thead>
				<tr>
					<th>item_id</th>
					<th>category_id</th>
					<th>item_name</th>
					<th>item_price</th>
					<th>item_contents</th>
					<th>item_img</th>
					<th>UPDATE</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.itemId}</td>
						<td>${i.categoryId}</td>
						<td>${i.itemName}</td>
						<td>${i.itemPrice}</td>
						<td>${i.itemContents}</td>
						<td><img width="120" height="80" src="${pageContext.request.contextPath}/imgs/${i.itemImg}"></td>
						<td><a href="${pageContext.request.contextPath}/admin/UpdateItem?itemId=${i.itemId}">UPDATE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<a href="${pageContext.request.contextPath}/Index">BACK</a>
	</div>
</body>
</html>