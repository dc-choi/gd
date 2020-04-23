<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
		ArrayList<City> cityList = cityDao.selectCityIdList();
		StoreDao storeDao = new StoreDao();
		ArrayList<Integer> storeId = storeDao.selectStoreIdList();
	%>
	<h1>Insert Customer Form</h1>
		<form method="post" action="<%= request.getContextPath() %>/customer/insertCustomerFormAction.jsp">
			<fieldset>
				<legend>ADDRESS</legend>
					<div>
						address :
						<input type="text" name="address">
					</div>
					<div>
						address2 :
						<input type="text" name="address2">
					</div>
					<div>
						district :
						<input type="text" name="district">
					</div>
					<div>
						city_id :
						<select name="cityId">
							<%
								for(City c : cityList) {
							%>
									<option value="<%= c.getCityId() %>">
										<%= c.getCity() %>
									</option>
							<%		
								}
							%>
						</select>
					</div>
					<div>
						postal_code :
						<input type="text" name="postalCode">
					</div>
					<div>
						phone :
						<input type="text" name="phone">
					</div>
				</fieldset>
				<br>
				<fieldset>
					<legend>CUSTOMER</legend>
						<div>
							store_id :
							<select name="storeId">
							<%
								for(Integer s : storeId) {
							%>
									<option value="<%= s %>"><%= s %></option>
							<% 		
								}
							%>
							</select>
						</div>
						<div>
							first_name :
							<input type="text" name="firstName">
						</div>
						<div>
							last_name :
							<input type="text" name="lastName">
						</div>
						<div>
							email :
							<input type="text" name="email">
						</div>
						<!-- active -->
							<input type="hidden" name="active" value=1>
				</fieldset>
				<br>
				<button type="submit">추가</button>
			</form>
	</div>
</body>
</html>