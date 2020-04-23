package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import vo.*;

@WebServlet("/mall/MyOrdersList")
public class MyOrdersList extends HttpServlet {
	// 이름 + 전화번호를 입력하는 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) request 분석
		System.out.println(request.getRemoteAddr());
		
		// 2) view 연결
		request.getRequestDispatcher("/WEB-INF/jsp/mall/MyOrdersListForm.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userAddress = request.getParameter("userAddress");
		
		System.out.println(userName + " <--InsertOrders.doPost() userName");
		System.out.println(userPhone + " <--InsertOrders.doPost() userPhone");
		System.out.println(userAddress + " <--InsertOrders.doPost() userAddress");
		
		Orders orders = new Orders();
		orders.setUserName(userName);
		orders.setUserPhone(userPhone);
		orders.setUserAddress(userAddress);
		
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndItem> list = ordersDao.selectMyOrdersListAll(orders);
		
		System.out.println(list.size() + " <-- MyOrdersList.list.size()");
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/mall/MyOrdersList.jsp");
		rd.forward(request, response);
	}
}