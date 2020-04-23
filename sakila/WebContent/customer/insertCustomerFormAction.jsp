<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	AddressDao adDao = new AddressDao();
	Address ad = new Address();
	ad.setAddress(request.getParameter("address"));
	ad.setAddress2(request.getParameter("address2"));
	ad.setDistrict(request.getParameter("district"));
	ad.setCityId(Integer.parseInt(request.getParameter("cityId")));
	ad.setPostalCode(request.getParameter("postalCode"));
	ad.setPhone(request.getParameter("phone"));
	
	int addressId = adDao.insertAddressAndSelectKey(ad);
	
	Customer cu = new Customer();
	cu.setStoreId(Integer.parseInt(request.getParameter("storeId")));
	cu.setFirstName(request.getParameter("firstName"));
	cu.setLastName(request.getParameter("lastName"));
	cu.setAddressId(addressId);
	cu.setEmail(request.getParameter("email"));
	cu.setActive(Integer.parseInt(request.getParameter("active")));
	
	CustomerDao cuDao = new CustomerDao();
	cuDao.insertCustomerFormAction(cu);

	response.sendRedirect(request.getContextPath()+"/customer/customerList.jsp");
%>