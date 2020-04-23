<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<h3>Rental 입력</h3>
    
    <div id="section">
    	<table>
    		<form method="post" action = "<%=request.getContextPath()%>/rental/insertRentalAction.jsp">
		        <div>
		            RENTAL ID : <input type = "text" name = "rentalId">
		        </div>
		        <div>
		        	RENTAL DATE : <input type = "text" name = "rentalDate">
		        </div>
		        <div>
		        	INVENTORY ID : <input type = "text" name = "inventoryId">
		        </div>
		        <div>
		        	CUSTOMER ID : <input type = "text" name = "customerId">
		        </div>
		        <div>
		        	RETURN DATE : <input type = "text" name = "returnDate">
		        </div>
		        <div>
		        	STAFF ID : <input type = "text" name = "staffId">
		        </div>
		        <button type = "submit">RENTAL 입력</button>
        	</form>
        </table>    
    </div>
   </div>
</body>
</html>


