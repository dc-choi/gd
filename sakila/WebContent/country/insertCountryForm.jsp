<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Hyperspace by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
      <noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/noscript.css" /></noscript>
   </head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

<!-- Intro -->

<h3>InsertCountryForm</h3>
<form method = "post" action = "<%=request.getContextPath() %>/country/insertCountryAction.jsp">

	<div>
	Country Id:
	<input type = "text" name = "countryId">
	</div>
	<div>
	Country :
	<input type = "text" name = "country">
	</div>
	<button type = "submit">전송</button>
</form>
</div>
</body>
</html>
