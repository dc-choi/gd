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
<script>
$(document).ready(function(){
	$("#searchBtn").click(function(){
		if($("#searchWord").val().length == 0) {
			alert("검색어를 입력하세요");
			return;
		}
		$("#searchForm").submit();
	})
})
</script>
</head>
<body>
	<div class="container">
		<h1>Sample List</h1>
		<br>
		<div>
			<a class="btn btn-info" href="${pageContext.request.contextPath}/AddSample">add sample</a>
		</div>
		<br>
		<table class="table">
			<tr>
				<th>sample_no</th>
				<th>sample_name</th>
				<th>UPDATE</th>
				<th>DELETE</th>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr>
					<td>${l.sampleNo}</td>
					<td>${l.sampleName}</td>
					<td><a class="btn btn-info" href="${pageContext.request.contextPath}/ModifySample?sampleNo=${l.sampleNo}">UPDATE</a></td>
					<td><a class="btn btn-info" href="${pageContext.request.contextPath}/RemoveSample?sampleNo=${l.sampleNo}">DELETE</a></td>
				</tr>
			</c:forEach>
		</table>
		<form id="searchForm" method="get" action="${pageContext.request.contextPath}/GetSampleList">
			<input type="text" name="searchWord" id="searchWord">
			<button type="button" class="btn btn-info" id="searchBtn">Search</button>
		</form>
	</div>
</body>
</html>