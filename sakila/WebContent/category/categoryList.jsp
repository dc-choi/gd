<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>

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
<!-- CategoryDao 클래스 값 가져오기 -->
<%
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> list = categoryDao.selectCategoryAll();

%>

	<h1>CategoryList</h1>
	<table border = "1"  class="wrapper style2 spotlights" ><a href = "<%=request.getContextPath() %>/category/categoryInsertForm.jsp" >리스트 추가</a>
		<thead>
		<tr>
			<th>CategoryId</th>
			<th>name</th>
			<th>lastUpdate</th>
			
		</tr>
		</thead>
		<tbody>
			<%
			for(Category c : list){
			%>
			<tr>
			<td><%=c.getCategoryId() %></td>			
			<td><%=c.getName() %></td>		
			<td><%=c.getLastUpdate() %></td>
			
			
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>
