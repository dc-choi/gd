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

<h1>CategoryInsertForm</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/category/categoryInsertAction.jsp">
		
		<div>
			name:
			<input type = "text" name = "name">
		</div>
		
	</form>
	<div>
			<button type = "submit" name = "submit">입력</button>
		</div>	
		</div>
</body>
</html>
