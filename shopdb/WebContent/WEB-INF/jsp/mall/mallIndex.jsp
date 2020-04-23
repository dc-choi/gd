<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MALL INDEX</title>
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
	<!-- 
		Item List - item+order - orderAct - orderInfo - myorderList
	-->
	<div class="container">
	<h1>MALL INDEX</h1>
	<table border="1" class="table table-striped">
		<tr>
			<!-- item을 5개까지 출력하고 행바꿈을 한다 -->
			<c:forEach var="item" items="${list}" varStatus="stats">
				<c:if test="${stats.index % 5 == 0 && stat.index !=0}">
					</tr><tr>
				</c:if>
				<td>
					<div>
						<img width="120" height="80"
						src="${pageContext.request.contextPath}/imgs/${item.itemImg}">
					</div>
					<div>
						${stats.count}. <a href="${pageContext.request.contextPath}/mall/InsertOrders?itemId=${item.itemId}">${item.itemName}</a>
					</div>
				</td>
			</c:forEach>
			
			<!-- 빈공간이 깨지지않도록 남은 부분에 값을 넣는다 -->
			<c:if test="${list.size() % 5 != 0}">
				<c:forEach begin="${list.size() % 5}" end="4" step="1">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/mall/MyOrdersList">My Orders List</a>
	</div>
</body>
</html>