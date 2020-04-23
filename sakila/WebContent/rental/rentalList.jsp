<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*"%>
<%@ page import="dao.*" %>
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
        <h1>RENTAL</h1>
        <%
        	//searchWord 메소드
        	String searchWord = "";
        	if(request.getParameter("searchWord") !=null){
        		searchWord = request.getParameter("searchWord");
        	}
        	ArrayList<RentalAndInventoryAndCustomerAndStaff>List = new RentalDao().selectRentalList(searchWord);
        %>
        <!-- 검색창 -->
        <!-- inventoryId로 검색 -->
        <form method = "post" action = "<%=request.getContextPath()%>/rental/rentalList.jsp">
        	<input type = "text" name="searchWord">
        	<button type = "submit">검색</button>
        </form>
        <br>
        	<table border = "1">
        		<thead>
        			<tr>
        				<th>RENTAL ID</th>
        				<th>RENTAL DATE</th>
        				<th>INVENTORY ID</th>
        				<th>CUSTOMER ID</th>
        				<th>RETURN DATE</th>
        				<th>STAFF ID</th>
        				<th>LAST UPDATE</th>
        			</tr>
        		</thead>
        		<tbody>
        			<%
        				for(RentalAndInventoryAndCustomerAndStaff rics : List){
        			%>
        			<tr>
        				<td><%=rics.getRental().getRentalId() %></td>
        				<td><%=rics.getRental().getRentalDate() %></td>
        				<td><%=rics.getRental().getInventoryId() %></td>
        				<td><%=rics.getRental().getCustomerId() %></td>
        				<td><%=rics.getRental().getReturnDate() %></td>
        				<td><%=rics.getRental().getStaffId()%></td>
        				<td><%=rics.getRental().getLastUpdate() %></td>

        			</tr>
        			<%
        				}
        			%>
        		</tbody>
        	</table>
        <div>
            <a href="<%=request.getContextPath()%>/rental/insertRentalForm.jsp">RENTAL 입력</a>
        </div>
    </div>
</body>
</html>


