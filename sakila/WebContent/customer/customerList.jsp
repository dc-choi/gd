<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/main.css" />
      <noscript><link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/noscript.css" /></noscript>
   </head>
<body class="is-preload">

      

      <!-- Wrapper -->
                         <div id="wrapper">

            <!-- Intro -->
               <section id="intro" class="wrapper style1 fullscreen fade-up">
                  <div id="aside">
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include><!-- include는 서버 기술이라서 requset.getContextPath()가 오면 안됨  -->
    </div>
                     </section>

<!-- 페이징 관련 비지니스 로직 -->
<%
        CustomerDao customerDao = new CustomerDao();
        ArrayList<CustomerAndStoreAndAddress> customerList = customerDao.selectCustomerListAll();
%>
        <h1>Customer List</h1>
        <div>
       		<a href="<%=request.getContextPath() %>/customer/insertCustomerForm.jsp">고객 </a>     
        </div>
        <table border = "1"  class="wrapper style2 spotlights" >
        	<thead>
        		<tr>
	        		<th>customer_id</th>
	        		<th>store_id</th>
	        		<th>first_name</th>
	        		<th>last_name</th>
	        		<th>email</th>
	        		<th>address_id</th>
	        		<th>address</th>
	        		<th>phone</th>
	        		<th>active</th>
	        		<th>create_date</th>
	        		<th>last_update</th>
        		</tr>
        	</thead>
        	<tbody>
<%
        		for(CustomerAndStoreAndAddress c : customerList) {
%>
        			<tr>
        				<td><%= c.getCustomer().getCustomerId() %></td>
        				<td><%= c.getStore().getStoreId() %></td>
        				<td><%= c.getCustomer().getFirstName() %></td>
        				<td><%= c.getCustomer().getLastName() %></td>
        				<td><%= c.getCustomer().getEmail() %></td>
        				<td><%= c.getAddress().getAddressId() %></td>
        				<td><%= c.getAddress().getAddress() %></td>
        				<td><%= c.getAddress().getPhone() %></td>
        				<td><%= c.getCustomer().getActive() %></td>
        				<td><%= c.getCustomer().getCreateDate() %></td>
        				<td><%= c.getCustomer().getLastUpdate() %></td>
        			</tr>
<%		
        		}
%>
        	</tbody>
        </table>
    </div>
</body>
</html>
