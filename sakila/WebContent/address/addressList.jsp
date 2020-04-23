<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="util.*"%>
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
   ArrayList<AddressAndCityAndCountry> list = new AddressDao().SelectAddress();
%>
  

      <h1>ADDRESS MANAGEMENT</h1>
       <table border = "1"  class="wrapper style2 spotlights" >
         <thead>
            <tr>
               <th>CITY ID</th>
               <th>COUNTRY</th>
               <th>CITY</th>
               <th>ADDRESS</th>
               <th>ADDRESS2</th>
               <th>POSTAL CODE</th>
            </tr>
            
         </thead>
         <tbody>
            <%
               for(AddressAndCityAndCountry ad : list){
            %>
               <tr>
                  <th><%=ad.getCity().getCityId() %></th>
                  <th><%=ad.getCountry().getCountry() %></th>
                  <th><%=ad.getCity().getCity() %></th>
                  <th><%=ad.getAddress().getAddress() %></th>
                  <th><%=ad.getAddress().getAddress2() %></th>
                  <th><%=ad.getAddress().getPostalCode() %></th>
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
      <a href="<%=request.getContextPath()%>/address/insertAddressForm.jsp">ADDRESS INSERT</a>
    </div>
</body>
</html>
