<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
  </style>
</head>
<body class="container-fluid bg-light">
		<!-- Navigation MainMenu -->
	<div>
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1 class="text-secondary">Index</h1>
		<div id="demo" class="carousel slide" data-ride="carousel">
		
		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active bg-secondary"></li>
		    <li data-target="#demo" data-slide-to="1" class="active bg-secondary"></li>
		    <li data-target="#demo" data-slide-to="2" class="active bg-secondary"></li>
		  </ul>
		
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="<%=request.getContextPath()%>/imgs/welcome2.jpg" alt="welcome">
		    </div>
		    <div class="carousel-item">
		      <img src="<%=request.getContextPath()%>/imgs/welcome3.jpg" alt="welcome">
		    </div>
		    <div class="carousel-item">
		      <img src="<%=request.getContextPath()%>/imgs/welcome4.jpg" alt="welcome">
		    </div>
		  </div>
		
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon bg-secondary"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon bg-secondary"></span>
		  </a>
		</div>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
	<!-- <img src="<%=request.getContextPath()%>/imgs/welcome.jpg" width=1000 height=800> -->
</body>
</html>