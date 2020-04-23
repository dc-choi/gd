<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*"%>
<%@ page import = "dao.*"%>
<%
	
	request.setCharacterEncoding("utf-8");
	//categorylist에서 넘긴 categoryId값 가져오기 
	
	//name 변수 선언
	String name = request.getParameter("name");
	System.out.println(name + "/2/");
	//category 클래스값 가져오기
	Category category = new Category();
	category.setName(name);
	//CategoryDao 클래스의 값을 가져옴
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");

%>
