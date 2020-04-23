<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<% 
	AddressDao addressDao = new AddressDao();
	Address address = new Address();
	address.setAddress(request.getParameter("address"));
	address.setAddress2(request.getParameter("address2"));
	address.setDistrict(request.getParameter("district"));
	address.setCityId(Integer.parseInt(request.getParameter("cityId")));
	address.setPostalCode(request.getParameter("postalCode"));
	address.setPhone(request.getParameter("phone"));
	int addressId = addressDao.insertAddressAndSelectKey(address);
	System.out.println(addressId + "<-- addressId");
	
	StaffDao insertStaffFormAction = new StaffDao();
	Staff staff = new Staff();
	staff.setFirstName(request.getParameter("firstName"));
	staff.setLastName(request.getParameter("lastName"));
	staff.setAddressId(addressId);
	staff.setEmail(request.getParameter("email"));
	staff.setStoreId(Integer.parseInt(request.getParameter("storeId")));
	staff.setActive(Integer.parseInt(request.getParameter("active")));
	staff.setUserName(request.getParameter("userName"));
	staff.setPassword(request.getParameter("password"));
	
	insertStaffFormAction.insertStaffFormAction(staff);
	
	response.sendRedirect(request.getContextPath()+"/staff/staffList.jsp");
%>