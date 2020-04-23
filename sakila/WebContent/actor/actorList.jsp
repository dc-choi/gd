<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>

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
   int currentPage = 1;
   if(request.getParameter("currentPage") !=null) {
      currentPage = Integer.parseInt(request.getParameter("currentPage"));
   }
   int rowPerPage = 10;   

   int beginRow = (currentPage -1) * rowPerPage;
%>
<!-- 컨트롤 로직이 필요함 (메서드 호출 결과값 (model) 가지고 와야함 -->
<%
   ActorDao actorDao = new ActorDao();
   ArrayList<Actor> list = actorDao.selectActorByPage(beginRow, rowPerPage);
%>





   
<!-- 뷰 로직  -->
   <h1>ACTOR LIST</h1>
   <table border = "1"  class="wrapper style2 spotlights" >
   <thead>
   <tr>
   <td>
   <div>
   <a href ="<%=request.getContextPath() %>/actor/actorInsertForm.jsp">추가</a>
   </div>
   </td>
   </tr>
   <tr>
      <th>actorId</th>
      <th>firstName</th>
      <th>lastName</th>
      <th>lastUpdate</th>
   </tr>
   </thead>   
   <tbody>
      <%
      for(Actor a : list) {
      %>
      <tr>
         <td><%=a.getActorId() %></td>
         <td><%=a.getFirstName() %></td>
         <td><%=a.getLastName() %></td>
         <td><%=a.getLastUpdate() %></td>
      </tr>
   <%
      }
   %>
   </tbody>
   
   </table>
   </div>
   <!-- 페이지 로직을 구성 -->
   
   <%
    if(currentPage >1) {
   %>
   <a href = "<%=request.getContextPath()%>/actor/actorlist.jsp?currentPage=<%=currentPage-1%>">이전</a>
   <%
    }
%>
<%
   int totalCount = actorDao.selectTotalCount();
   int lastPage = totalCount / rowPerPage;
   if (totalCount % rowPerPage !=0){
      lastPage+=1;
   }
   %>
<%
   if(currentPage < lastPage){
   %>
   <a href = "<%=request.getContextPath()%>/actor/actorlist.jsp?currentPage=<%=currentPage+1%>">다음</a>
   <%
    }
   %>
 
   


</body>
</html>