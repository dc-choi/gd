<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "dao.*" %>
<%@ page import= "vo.*" %>
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
        StoreDao storeDao = new StoreDao();
        ArrayList<StoreAndStaff> storeAndStaffList = storeDao.selectStoreListAll();
%>
        <h1>Store List</h1>
        <div>
        	<a href="<%= request.getContextPath() %>/store/insertStoreForm.jsp">매장 생성</a>    
        </div>
    		<table border="1">
    			<thead>
    				<tr>
    					<th>store_id</th>
    					<th>manager_staff_id</th>
    					<th>manager_staff_first_name</th>
    					<th>manager_staff_last_name</th>
    				</tr>
    			</thead>
    			<tbody>
<%
    				for(StoreAndStaff s : storeAndStaffList) {
%>
    					<tr>
    						<td><%= s.getStore().getStoreId() %></td>
    						<td><%= s.getStaff().getStaffId()%></td>
    						<td><%= s.getStaff().getFirstName()%></td>
    						<td><%= s.getStaff().getLastName()%></td>
    					</tr>
<%		
    				}
%>
    			</tbody>
    		</table>
        </div>
</body>
</html>
