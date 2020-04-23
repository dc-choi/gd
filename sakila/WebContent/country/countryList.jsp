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
        <h1>COUNTRY LIST</h1>

    <%
    String searchWord = "";
    if(request.getParameter("searchWord")!=null) {
    	searchWord = request.getParameter("searchWord");
    }
	CountryDao countryDao = new CountryDao();
	ArrayList<Country> list = countryDao.selectCountryListAll(searchWord);
	%>
	<form method = "post" action = "<%=request.getContextPath() %>/country/countryList.jsp">
	<input type = "text" name = "searchWord">
	<button type = "submit" name = "submit">찾기</button>	
	</form>
	 <table border = "1"  class="wrapper style2 spotlights" >
		<thead>
			<tr>
				<th>Country ID</th>
				<th>COUNTRY</th>
				<th>LAST UPDATE</th>
				<th>CITY추가</th>				
			</tr>
			<%
			for(Country c : list){
			%>
			<tr>
				<td><%=c.getCountryId() %></td>
				<td><%=c.getCountry() %></td>
				<td><%=c.getLastUpdate() %></td>			
				<td><a href = "<%=request.getContextPath() %>/city/insertCityForm.jsp?countryId=<%=c.getCountryId()%>">추가</a></td>
				
			</tr>
			<%
			}
			%>
	
		</thead>
	</table>
	<div>

	<a href = "<%=request.getContextPath()%>/country/insertCountryForm.jsp">부서추가 </a>
		
		</div>
	</div>
</body>
</html>
