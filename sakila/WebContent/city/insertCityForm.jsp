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
<%
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	System.out.println(countryId + "<--insertCityForm/countryId");
	
	String city = request.getParameter("city");
%>
<h3>City 입력</h3>

<form method = "post" action = "<%=request.getContextPath()%>/city/insertCityAction.jsp">

	
	<div>
	city : <input type = "text" name = "city" >
	</div>
	<div>
	country id : <input type = "text" name = "countryId" value = <%=countryId %> readonly = "readonly">
	</div>
	
</form>
<div>

<button type = "submit">시티입력</button>
</div>
</div>
</body>
</html>
