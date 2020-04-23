<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import = "dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String city = request.getParameter("city");
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	//String country = request.getParameter("country");
	
	Country country1 = new Country();
	country1.setCountryId(countryId);
	
	City city1 = new City();
	city1.setCity(city);
	
	
	CityAndCountry cityAndCountry = new CityAndCountry();
	
	cityAndCountry.setCity(city1);
	cityAndCountry.setCountry(country1);
	
	CityDao cityDao = new CityDao();
	cityDao.insertCityAndSelectKey(cityAndCountry);
	
	response.sendRedirect(request.getContextPath() + "/city/cityList.jsp");
	

%>
<body>

</body>
</html>
