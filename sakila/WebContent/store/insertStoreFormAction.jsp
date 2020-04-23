<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	Address address = new Address();
	address.setAddress(request.getParameter("address"));
	address.setAddress2(request.getParameter("address2"));
	address.setDistrict(request.getParameter("district"));
	address.setCityId(Integer.parseInt(request.getParameter("cityId")));
	address.setPostalCode(request.getParameter("postalCode"));
	address.setPhone(request.getParameter("phone"));
	
	AddressDao addressDao = new AddressDao();
	int addressId = addressDao.insertAddressAndSelectKey(address); 
	
	Staff staff = new Staff(); 
	/*
	 매장을 생성할 때 매장의 주소와 매니저를 지정하게 하였다. 
	 매니저는 각 매장당 1명만 배치할 수 있다(데이터베이스상에서 중복허용이 안됨)
	 매니저는 기존에 재직 중인 직원들 중에서 선택할 수 있으며 이미 매니저인 사람은 당연히 선택 못하게 하였다.
	 기존 직원 중 한 명이 매니저가 된다면 active(2)와 store_id(새로 만든 매장)도 바뀌어야 한다 (active 0=퇴직, 1=재직, 2=매니저를 뜻함)
	*/
	try {
		staff.setStaffId(Integer.parseInt(request.getParameter("staffId")));
		StoreDao store = new StoreDao();
		int storeId = store.insertStoreFormAction(staff, addressId);

		StaffDao staffUpdate = new StaffDao();
		staffUpdate.updateStaffActiveAndStoreId(storeId, staff.getStaffId());
		response.sendRedirect(request.getContextPath()+"/store/storeList.jsp");
	} catch(Exception e) { // 에러발생시 폼으로 다시 돌아감
		response.sendRedirect(request.getContextPath()+"/store/insertStoreForm.jsp");
	}
%>