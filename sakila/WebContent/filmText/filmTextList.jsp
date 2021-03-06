<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
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
		<h1>FILMTEXT LIST</h1>
		<table border = "1"  class="wrapper style2 spotlights" >
			<thead>
				<tr>
					<th>FLIMID</th>
					<th>TITLE</th>
					<th>DESCRIPTION</th>
				</tr>
			</thead>
			<tbody>
				<%
					FilmTextDao filmTextDao = new FilmTextDao();
					ArrayList<FilmText> list = filmTextDao.selectfilmText();
					for (FilmText c : list) {
				%>

				<tr>
					<th><%=c.getFilmId()%></th>
					<th><%=c.getTitle()%></th>
					<th><%=c.getDescription()%></th>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<div>
			<a href="<%=request.getContextPath()%>/film/insertFilmTextForm.jsp">filmText
				입력</a>
		</div>
	</div>
</body>
</html>