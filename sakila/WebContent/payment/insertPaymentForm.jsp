<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
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
        <h1>Insert Payment</h1>
        <%
	        StaffDao s = new StaffDao();
			ArrayList<Integer> staffIdList = s.selectStaffIdListAll();
			
			RentalDao r = new RentalDao();
    		ArrayList<Integer> rentalIdList = r.selectRentalIdListAll();
    		
    		CustomerDao c = new CustomerDao();
    		ArrayList<Integer> customerIdList = c.selectCustomerIdListAll();
        %>
        <div>
			<form method="post"
			action="<%=request.getContextPath()%>/payment/insertPaymentAction.jsp">
				<fieldset>
					<legend>Payment</legend>
					<div>
						CUSTOMER ID : 
						<select name="customerId">
						<%
							for (Integer cu : customerIdList) {
						%>
						<option value="<%=cu%>"><%=cu%></option>
						<%
							}
						%>
						</select>
					</div>
					<div>
						RENTAL ID :
						<select name="rentalId">
						<%
							for (Integer ren : rentalIdList) {
						%>
						<option value="<%=ren%>"><%=ren%></option>
						<%
							}
						%>
						</select>
					</div>
					<div>
						STAFF ID : 
						<select name="staffId">
						<%
							for (Integer st : staffIdList) {
						%>
						<option value="<%=st%>"><%=st%></option>
						<%
							}
						%>
						</select>
					</div>
					<div>
						AMOUNT : 
						<input type="text" name="amount">
					</div>
				</fieldset>
				<button type="submit">INSERT</button>
			</form>
        </div>
    </div>
</body>
</html>