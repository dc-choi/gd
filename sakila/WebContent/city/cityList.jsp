<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
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
	CityDao cityDao = new CityDao();
	ArrayList<CityAndCountry> list = cityDao.selectCityList();

%>
<h3>cityList</h3>
	<form method = "post" action = "<%=request.getContextPath()%>/city/cityList.jsp"> 
		 <table border = "1"  class="wrapper style2 spotlights" >
			<tr>
				<th>cityId</th>
				<th>city</th>
				<th>countryId</th>
				<th>country</th>
				<th>lastUpdate</th>
				<th>추가</th>
			</tr>
	
		<%
		for(CityAndCountry c : list){
		%>
		<tbody>
		<tr>
			<td><%=c.getCity().getCityId() %></td>
			<td><%=c.getCity().getCity() %></td>
			<td><%=c.getCountry().getCountryId() %></td>
			<td><%=c.getCountry().getCountry() %></td>
			<td><%=c.getCountry().getLastUpdate() %></td>
			<td><a href = "<%=request.getContextPath() %>/city/insertCityForm.jsp?countryId=<%=c.getCountry().getCountryId() %>&&city=<%=c.getCity().getCity()%>">추가</a></td>
		</tr>
		</tbody>
		<%
		}
		%>
		</table>
	</form>
	</div>
</body>
</html>
