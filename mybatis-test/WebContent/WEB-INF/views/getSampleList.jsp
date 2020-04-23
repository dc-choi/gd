<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h1>Sample List</h1>
		<div>
			<a class="btn btn-info" href="${pageContext.request.contextPath}/AddSample">add sample</a>
		</div>
		<table class="table">
			<tr>
				<th>sample_no</th>
				<th>sample_name</th>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr>
					<td>${l.sampleNo}</td>
					<td>${l.sampleName}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>