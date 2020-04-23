<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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


<%
	LanguageDao languageDao = new LanguageDao();
	ArrayList<Language> languageList = languageDao.selectLanguageIdListAll();
%>

		<h1>INSERT FILM</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/film/insertFilmAction.jsp">
			<fieldset>
				<div>
					title : <input type="text" name="title">
				</div>
				<div>
					description : <input type="text" name="description">
				</div>
				<div>
					releaseYear : <input type="text" name="releaseYear">
				</div>
				<div>
					languageId : 
				<select name="languageId" >
        			<%
        				for(Language c : languageList){
        			%>
        				<option value="<%=c.getLanguageId() %>">
        					<%=c.getLanguageId() %>
        				</option>
        			<%	
        				}
        			%>
        				
        		</select>
				</div>
				<div>
					retalDuration : <input type="text" name="retalDuration">
				</div>
				<div>
					rentalRate : <input type="text" name="rentalRate">
				</div>
				<div>
					length : <input type="text" name="length">
				</div>
				<div>
					replacementCost : <input type="text" name="replacementCost">
				</div>
				<div>
					rating : <input type="text" name="rating">
				</div>
				<div>
					specialFeatures : <input type="text" name="specialFeatures">
				</div>
			</fieldset>
			<button type="submit">입력</button>
		</form>
	</div>
</body>
</html>