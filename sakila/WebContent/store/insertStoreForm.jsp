<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	StaffDao staffDao = new StaffDao();
	ArrayList<Staff> staffId = staffDao.selectStaffIdList();
	CityDao cityDao = new CityDao();
	ArrayList<City> cityList = cityDao.selectCityIdList();
%>
        <h1>Insert Store Form</h1>
    		<form method="post" action="<%= request.getContextPath() %>/store/insertStoreFormAction.jsp">
	    		<fieldset>
		       		<legend>STORE ADDRESS</legend>
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
	    			<legend>SELECT MANAGER STAFF</legend>
		    		<div>
		    			staff :
		    			<select name="staffId">
		    			<%
		    				for(Staff s : staffId) {
		    					if(s.getActive() == 1) { // 매니저가 아닌 직원 중에서 선택  0=퇴직, 1=재직, 2=매니저
		    			%>
		    					<option value="<%= s.getStaffId() %>"><%= s.getFirstName() %> <%= s.getLastName() %></option>
		    			<%		
		    					}
		    				}
		    			%>
		    			</select>
					선택할 수 있는 직원이 없다면 <a href="<%= request.getContextPath() %>/staff/insertStaffForm.jsp">직원 생성</a> 하세요.
		    		</div>
	    		</fieldset>    
	       		<br>
       			<button type="submit">매장 추가</button>
      		</form>
    </div>
</body>
</html>
