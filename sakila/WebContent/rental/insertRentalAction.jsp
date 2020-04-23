<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.Rental"%>

<%
	//페이지 인코딩
	request.setCharacterEncoding("utf-8");

	int rentalId = Integer.parseInt(request.getParameter("rentalId"));
	System.out.println(rentalId+"<--rentalId");
	String rentalDate = request.getParameter("rentalDate");
	System.out.println(rentalDate+"<--retalDate");
	int customerId = Integer.parseInt(request.getParameter("customerId"));
	System.out.println(customerId+"<--customerId");
	int inventoryId = Integer.parseInt(request.getParameter("inventoryId"));
	System.out.println(inventoryId+"<--inventoryId");
	String returnDate = request.getParameter("returnDate");
	System.out.println(returnDate+"<--returnDate");
	int staffId = Integer.parseInt(request.getParameter("staffId"));
	System.out.println(staffId+"<--staffId");
	
	
	Rental rental = new Rental();
	rental.setRentalId(rentalId);
	rental.setRentalDate(rentalDate);
	rental.setCustomerId(customerId);
	rental.setInventoryId(inventoryId);
	rental.setReturnDate(returnDate);
	rental.setStaffId(staffId);
	
	
	RentalDao rentalDao = new RentalDao();
	rentalDao.insertRental(rental);
	response.sendRedirect(request.getContextPath()+"/rental/rentalList.jsp");
	
%>
