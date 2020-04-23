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


	<h1>actorInsertForm</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/actor/actorInsertAction.jsp">
	<table border = "1">
	<tr>	
	<td>
	<div>
	firstName:
	<input type = "text" name = "firstName">
	</div>
	</td>
	<td>
	<div>
	lastName:
	<input type = "text" name = "lastName">
	</div>
	</td>
	</table>
	</form>
	<div>
	<button type = "submit" name = "submit">전송</button>
	</div>
	</div>
</body>
</html>
