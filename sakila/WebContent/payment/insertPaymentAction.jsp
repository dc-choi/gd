
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println(request.getParameter("customerId") + " <--customerId");
	System.out.println(request.getParameter("rentalId") + " <--rentalId");
	System.out.println(request.getParameter("staffId") + " <--staffId");
	System.out.println(request.getParameter("amount") + " <--amount");
	
	int customerId = Integer.parseInt(request.getParameter("customerId"));
	int rentalId = Integer.parseInt(request.getParameter("rentalId"));
	int staffId = Integer.parseInt(request.getParameter("staffId"));
	double amount = Double.parseDouble(request.getParameter("amount"));
	
	Payment p1 = new Payment();
	p1.setCustomerId(customerId);
	p1.setStaffId(rentalId);
	p1.setRentalId(staffId);
	p1.setAmount(amount);
	
	PaymentDao p2 = new PaymentDao();
	p2.insertPaymentAction(p1);
	
	response.sendRedirect(request.getContextPath() + "/payment/paymentList.jsp");
%>