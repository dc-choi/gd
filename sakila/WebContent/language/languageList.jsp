<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
     <h1>LANGUAGE LIST</h1>
     <%
        String searchword = "";
        if(request.getParameter("searchword")!=null){
           searchword = request.getParameter("searchword");
        }
         LanguageDao languageDao = new LanguageDao();
         ArrayList<Language> list = languageDao.selectLanguageListAll(searchword);
     %>
     <form method="post" action="<%=request.getContextPath()%>/language/languageList.jsp">
        <input type="text" name="searchword">
        <button type="submit">검색</button>
     </form>
     <br>
     <table border = "1"  >
     <thead>
        <tr>
           <th>language_id</th>
           <th>name</th>
           <th>last_update</th>
           <th>language 입력</th>
        </tr>
     </thead>
     <tbody>
        <%
           for(Language l: list){
        %>   
           <tr>
              <td><%=l.getLanguageId()%></td>
              <td><%=l.getName()%></td>
              <td><%=l.getLastUpdate()%></td>
              <td><a href="<%=request.getContextPath()%>/language/insertLanguageForm.jsp?languageId=<%=l.getLanguageId()%>">LANGUAGE 입력</a></td>
           </tr>   
        <%   
           }
        %>
     </tbody>
     </table>