<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
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
			CityDao cityDao = new CityDao();
			ArrayList<City> cityIdList = cityDao.selectCityIdList();
		%>
		<h3>ADDRESS INSERT FORM</h3>
		<form method="post"	action="<%=request.getContextPath()%>/address/insertAddressAction.jsp">
			<div>
				ADDRESS ID : <input type="text" name="addressId">
			</div>
			<div>
				ADDRESS : <input type="text" name="address">
			</div>
			<div>
				ADDRESS 2 : <input type="text" name="address2">
			</div>
			<div>
				DISTRICT : <input type="text" name="district">
			</div>
			<div>
				CITY ID : 
				<select name="cityId">
					<%
						for (City c : cityIdList) {
					%>
					<option value="<%=c.getCityId()%>"><%=c.getCity()%></option>
					<%
						}
					%>
				</select>
			</div>
			<div>
				POSTAL CODE : <input type="text" name="postalcode">
			</div>
			<div>
				PHONE : <input type="text" name="phone">
			</div>
			
		</form>
		<div>
		<button type="submit">INSERT</button>
		</div>
	</div>
</body>
</html>
