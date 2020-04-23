<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//인코딩값 맞추기
	request.setCharacterEncoding("utf-8");
	//변수 선언
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	String country = request.getParameter("country");
	//class의 값을 다시 변수에 넣기
	Country country1 = new Country();
	
	country1.setCountryId(countryId);
	country1.setCountry(country);
	
	CountryDao countryDao = new CountryDao();
	
	countryDao.insertCountry(country1);
	
	response.sendRedirect(request.getContextPath() + "/country/countryList.jsp");
%>
</body>
</html>
