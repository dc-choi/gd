<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	
	Actor actor = new Actor();
	actor.setFirstName(firstName);
	actor.setLastName(lastName);
	
	ActorDao actorDao = new ActorDao();
	actorDao.insertActor(actor);
	response.sendRedirect(request.getContextPath()+"/actor/actorList.jsp");
	
%>
</body>
</html>
