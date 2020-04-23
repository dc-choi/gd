<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
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
    	<h1>Inventory INSERT</h1>
    	<%
    		StoreDao s = new StoreDao();
    		ArrayList<Integer> storeIdList = s.selectStoreIdList();
    		
    		FilmDao f = new FilmDao();
    		ArrayList<Film> filmIdList = f.selectfilm();
    	%>
    	<div>
    		<form method="post"
    		action="<%=request.getContextPath()%>/inventory/insertInventoryAction.jsp">
    		
    		<fieldset>
    			<legend>INSERT INVENTORY</legend>

    			<div>
					<select name="filmId">
    					<%
							for (Film fi : filmIdList) {
						%>
						<option value="<%=fi.getFilmId()%>"><%=fi.getTitle()%></option>
						<%
							}
						%>
    				</select>
    			</div>
    			<div>
    				<select name="storeId">
    					<%
							for (Integer st : storeIdList) {
						%>
						<option value="<%=st%>"><%=st%></option>
						<%
							}
						%>
    				</select>
    			</div>
    		</fieldset>
    		<button type="submit">INSERT</button>
    		</form>
    	</div>
    </div>
</body>
</html>