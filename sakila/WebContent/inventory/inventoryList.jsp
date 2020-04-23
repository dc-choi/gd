<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      <style>
    body {
        padding: 0;
        margin: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background-position: 0 0;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        position: relative;
        overflow-y: auto;
    }
  
    
    #section {
        margin-left: 300px;
        background: white;
    }
</style>
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
		String searchWord = "";
		if (request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		
		ArrayList<InventoryAndStoreAndFilm> list = new InventoryDao().SelectInventory(searchWord);
	%>

		<h1>INVENTORY List</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/inventory/inventoryList.jsp">
			<div>
				SEARCH VIDIO : <input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
		<a href="<%=request.getContextPath()%>/inventory/insertInventoryForm.jsp">INSERT INVENTORY</a>
		<table border = "1"  class="wrapper style2 spotlights" >
			<thead>
				<tr>
					<th>INVENTORY ID</th>
					<th>FILM ID</th>
					<th>TITLE</th>
					<th>DESCRIPTION</th>
					<th>RELEASE YEAR</th>
					<th>LANGUAGE ID</th>
					<th>ORIGINAL LANGUAGE ID</th>
					<th>RENTAL DURATION</th>
					<th>RENTAL RATE</th>
					<th>LENGTH</th>
					<th>REPLACEMENT COST</th>
					<th>RATING</th>
					<th>SPECIAL FEATURES</th>
					<th>STORE ID</th>
					<th>MANAGER STAFF ID</th>
				</tr>

			</thead>
			<tbody>
				<%
					for (InventoryAndStoreAndFilm isf : list) {
				%>
				<tr>
					<td><%=isf.getInventory().getInventoryId()%></td>
					<td><%=isf.getInventory().getFilmId()%></td>
					<td><%=isf.getFilm().getTitle()%></td>
					<td><%=isf.getFilm().getDescription()%></td>
					<td><%=isf.getFilm().getReleaseYear()%></td>
					<td><%=isf.getFilm().getLanguageId()%></td>
					<td><%=isf.getFilm().getOriginalLanguageId()%></td>
					<td><%=isf.getFilm().getRentalDuration()%></td>
					<td><%=isf.getFilm().getRentalRate()%></td>
					<td><%=isf.getFilm().getLength()%></td>
					<td><%=isf.getFilm().getReplacementCost()%></td>
					<td><%=isf.getFilm().getRating()%></td>
					<td><%=isf.getFilm().getSpecialFeatures()%></td>
					<td><%=isf.getInventory().getStoreId()%></td>
					<td><%=isf.getStore().getManagerStaffId()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			/*
			 City city = new City();
			 int cityId = city.getCityId();
			 System.out.println(cityId);
			 city = new AddressDao().selectCityId(cityId);
			 System.out.println(city);
			*/
		%>
		<a href="<%=request.getContextPath()%>/address/insertAddressForm.jsp">ADDRESS
			INSERT</a>
	</div>
</body>
</html>
