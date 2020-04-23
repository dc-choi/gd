<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	int addressId = Integer.parseInt(request.getParameter("addressId"));
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String district = request.getParameter("district");
	int cityId = Integer.parseInt(request.getParameter("cityId"));
	String postalcode = request.getParameter("postalcode");
	String phone = request.getParameter("phone");
	
	Address a1 = new Address();
	a1.setAddressId(addressId);
	a1.setAddress(address);
	a1.setAddress2(address2);
	a1.setDistrict(district);
	a1.setCityId(cityId);
	a1.setPostalCode(postalcode);
	a1.setPhone(phone);
	
	AddressDao a2 = new AddressDao();
	a2.insertAddress(a1);
	
	response.sendRedirect(request.getContextPath() + "/address/addressList.jsp");
%>
