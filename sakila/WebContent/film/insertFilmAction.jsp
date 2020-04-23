<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String releaseYear = request.getParameter("releaseYear");
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	int rentalDuration = Integer.parseInt(request.getParameter("retalDuration"));
	int rentalRate = Integer.parseInt(request.getParameter("rentalRate"));
	int length = Integer.parseInt(request.getParameter("length"));
	int replacementCost = Integer.parseInt(request.getParameter("replacementCost"));
	String rating = request.getParameter("rating");
	String specialFeatures = request.getParameter("specialFeatures");
	
	Film film = new Film();

	
	film.setTitle(title);
	film.setDescription(description);
	film.setReleaseYear(releaseYear);
	film.setLanguageId(languageId);
	film.setRentalDuration(rentalDuration);
	film.setRentalRate(rentalRate);
	film.setLength(length);
	film.setReplacementCost(replacementCost);
	film.setRating(rating);
	film.setSpecialFeatures(specialFeatures);
	
	
	FilmDao filmDao = new FilmDao();
	filmDao.insertFilm(film);
	
	response.sendRedirect(request.getContextPath() + "/film/filmList.jsp");
	
	
%>