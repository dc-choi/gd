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
	$("#btn").click(function(){
		if($("#sampleName").val().length == 0) {
			alert("이름을 입력해주세요");
			return;
		}
		$("#form").submit();
	})
})
</script>
</head>
<body>
	<div class="container">
	<h1>Modify Sample</h1>
		<form id="form" method="post" action="${pageContext.request.contextPath}/ModifySample">
			<c:forEach var="l" items="${list}">
				<div class="form-group">
					<input type="text" class="form-control" name="sampleNo" id="sampleNo" value="${l.sampleNo}" readonly="readonly">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="sampleName" id="sampleName" value="${l.sampleName}">
				</div>
			</c:forEach>
			<div>
				<button type="button" class="btn btn-info" id="btn">Update</button>
			</div>
		</form>
		<br>
		<a class="btn btn-info" href="${pageContext.request.contextPath}/GetSampleList">Back</a>
	</div>
</body>
</html>