<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
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
               <section id="intro" class="wrapper style1 fade-up">
                  <div id="aside">
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include><!-- include는 서버 기술이라서 requset.getContextPath()가 오면 안됨  -->
    </div>
                     </section>

<!-- 페이징 관련 비지니스 로직 -->
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerpage = 20;
		int beginRow = (currentPage - 1) * rowPerpage;
	
		String searchWord = "";
		if (request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		
		ArrayList<PaymentAndCustomerAndStaffAndRental> list = new PaymentDao().SelectPaymentList(searchWord, beginRow, rowPerpage);
	%>

		<h1>Payment List</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/inventory/inventoryList.jsp">
			<div>
				SEARCH PAYDATE : <input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
		<a href="<%=request.getContextPath()%>/payment/insertPaymentForm.jsp">Insert Payment</a>
		<table border="1">
			<thead>
				<tr>
					<th>PAYMENT ID</th>
					<th>CUSTOMER ID</th>
					<th>FIRST NAME</th>
					<th>LAST NAME</th>
					<th>EMAIL</th>
					<th>STAFF ID</th>
					<th>FIRST NAME</th>
					<th>LAST NAME</th>
					<th>EMAIL</th>
					<th>RENTAL ID</th>
					<th>RENTAL DATE</th>
					<th>INVENTORY ID</th>
					<th>RETURN DATE</th>
					<th>AMOUNT</th>
					<th>PAYMENT DATE</th>
				</tr>

			</thead>
			<tbody>
				<%
					for (PaymentAndCustomerAndStaffAndRental pcsr : list) {
				%>
				<tr>
					<td><%=pcsr.getPayment().getPaymentId()%></td>
					<td><%=pcsr.getPayment().getCustomerId()%></td>
					<td><%=pcsr.getCustomer().getFirstName()%></td>
					<td><%=pcsr.getCustomer().getLastName()%></td>
					<td><%=pcsr.getCustomer().getEmail()%></td>
					<td><%=pcsr.getPayment().getStaffId()%></td>
					<td><%=pcsr.getStaff().getFirstName()%></td>
					<td><%=pcsr.getStaff().getLastName()%></td>
					<td><%=pcsr.getStaff().getEmail()%></td>
					<td><%=pcsr.getPayment().getRentalId()%></td>
					<td><%=pcsr.getRental().getRentalDate()%></td>
					<td><%=pcsr.getRental().getInventoryId()%></td>
					<td><%=pcsr.getRental().getReturnDate()%></td>
					<td><%=pcsr.getPayment().getAmount()%></td>
					<td><%=pcsr.getPayment().getPaymentDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(currentPage > 1) {
		%>
			<a href="<%=request.getContextPath()%>/payment/paymentList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		<%
			}
		%>
		<!-- 마지막 페이지를 구하는 비즈니스 로직 -->
		<%
			int totalCount = PaymentDao.selectTotalCount();
			int lastPage = totalCount / rowPerpage;
			if(totalCount % rowPerpage != 0) {
				lastPage+=1;
			}
			if(currentPage < lastPage) {
		%>
			<a href="<%=request.getContextPath()%>/payment/paymentList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		<%
			}
		%>
	</div>
</body>
</html>