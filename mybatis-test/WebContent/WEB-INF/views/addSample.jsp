<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- javascript AND jQuery -->
<script>
// $뒤 (document) jQuery객체이다
$(document).ready(function(){
	// form check
	$("#btn").click(function(){
		if($("#sampleName").val().length<4) {
			alert("이름을 4자이상 입력해주세요");
			return;
		}
		$("#form").submit();
	})
})
</script>
</head>
<!-- EL AND JSTL -->
<body>
	<form id="form" method="post" action="${pageContext.request.contextPath}/AddSample">
		<div class="form-group">
			<label for="sampleName">sample name : </label>
			<input type="text" class="form-control" id="sampleName" name="sampleName" placeholder="4자이상">
		</div>
		<div>
			<button type="button" class="btn btn-info" id="btn">add sample</button>
		</div>
	</form>
</body>
</html>