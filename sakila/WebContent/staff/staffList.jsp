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
	StaffDao sDao = new StaffDao();
	ArrayList<StaffAndAddressAndStore> list = sDao.selectStaffListAll();
%>
        <h1>Staff List</h1>
	        <div>
	            <a href="<%=request.getContextPath()%>/staff/insertStaffForm.jsp">직원 생성</a>
	        </div>
        	<table border="1">
        		<thead>
        			<tr>
        				<th>staff_id</th>
        				<th>first_name</th>
        				<th>last_name</th>
        				<th>address_id</th>
        				<th>phone</th>
        				<th>picture</th>
        				<th>email</th>
        				<th>store_id</th>
        				<th>active</th>
        				<th>user_name</th>
        				<th>password</th>
        				<th>last_update</th>
        			</tr>
        		</thead>
        		<tbody>
<%
				for(StaffAndAddressAndStore s : list) {
%>
					<tr>
						<td><%=s.getStaff().getStaffId() %></td>
						<td><%=s.getStaff().getFirstName() %></td>
						<td><%=s.getStaff().getLastName() %></td>
						<td><%=s.getAddress().getAddressId() %></td>
						<td><%=s.getAddress().getPhone() %></td>
						<td><%=s.getStaff().getPicture() %></td>
						<td><%=s.getStaff().getEmail() %></td>
						<td><%=s.getStore().getStoreId() %></td>
						<td><%=s.getStaff().getActive() %></td>
						<td><%=s.getStaff().getUserName() %></td>
						<td><%=s.getStaff().getPassword() %></td>
						<td><%=s.getStaff().getLastUpdate() %></td>
					</tr>
<%						
					}
%>
        		</tbody>
        	
        	</table>
    </div>
</body>
</html>
