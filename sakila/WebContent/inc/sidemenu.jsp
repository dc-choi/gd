<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Hyperspace by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Hyperspace by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/main.css" />
<noscript>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<div id="wrapper">

		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">


				<h1>SAKILA</h1>
				<ul class="actions">
					<li><a
						href="<%=request.getContextPath()%>/actor/actorList.jsp"
						class="button scrolly">&ensp;&emsp;&emsp;ACTOR&nbsp;&nbsp;&emsp;&emsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/address/addressList.jsp"
						class="button scrolly">&emsp;ADDRESS&emsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/category/categoryList.jsp"
						class="button scrolly">CATEGORY&nbsp;</a></li>
					<li><a href="<%=request.getContextPath()%>/city/cityList.jsp"
						class="button scrolly">&emsp;&emsp;CITY&emsp;&emsp;</a></li>
				</ul>
				<ul class="actions">
					<li><a
						href="<%=request.getContextPath()%>/country/countryList.jsp"
						class="button scrolly">&emsp;&emsp;COUNTRY&emsp;&emsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/customer/customerList.jsp"
						class="button scrolly">&nbsp;CUSTOMER&nbsp;</a></li>
					<li><a href="<%=request.getContextPath()%>/film/filmList.jsp"
						class="button scrolly">&emsp;&emsp;FILM&ensp;&emsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/filmActor/filmActorList.jsp"
						class="button scrolly">FILM_ACTOR</a></li>
				</ul>
				<ul class="actions">
					<li><a
						href="<%=request.getContextPath()%>/filmCategory/filmCategoryList.jsp"
						class="button scrolly">FILM_CATEGORY</a></li>
					<li><a
						href="<%=request.getContextPath()%>/filmText/filmTextList.jsp"
						class="button scrolly">&nbsp;FILM_TEXT&nbsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/inventory/inventoryList.jsp"
						class="button scrolly">INVENTORY</a></li>
					<li><a
						href="<%=request.getContextPath()%>/language/languageList.jsp"
						class="button scrolly">&ensp;LANGUAGE&ensp;</a></li>
				</ul>
				<ul class="actions">
					<li><a
						href="<%=request.getContextPath()%>/payment/paymentList.jsp"
						class="button scrolly">&emsp;&emsp;PAYMENT&emsp;&emsp;&nbsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/rental/rentalList.jsp"
						class="button scrolly">&emsp;&nbsp;RENTAL&nbsp;&emsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/staff/staffList.jsp"
						class="button scrolly">&emsp;&nbsp;STAFF&nbsp;&emsp;</a></li>
					<li><a
						href="<%=request.getContextPath()%>/store/storeList.jsp"
						class="button scrolly">&emsp;&ensp;STORE&ensp;&emsp;</a></li>
				</ul>
			</div>
		</section>

		<!-- Scripts -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/assets/js/jquery.scrollex.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/assets/js/jquery.scrolly.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/browser.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/assets/js/breakpoints.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/util.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	</div>
</body>
</html>