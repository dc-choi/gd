<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	int filmId = Integer.parseInt(request.getParameter("filmId"));
	int storeId = Integer.parseInt(request.getParameter("storeId"));
	
	Inventory i1 = new Inventory();
	i1.setFilmId(filmId);
	i1.setStoreId(storeId);
	
	InventoryDao i2 = new InventoryDao();
	i2.insertInventory(i1);
	
	response.sendRedirect(request.getContextPath() + "/inventory/inventoryList.jsp");
%>