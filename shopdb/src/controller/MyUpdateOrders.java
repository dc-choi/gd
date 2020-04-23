package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import vo.*;

@WebServlet("/mall/MyUpdateOrders")
public class MyUpdateOrders extends HttpServlet {
	
	// Only tomcat RUN
	private OrdersDao ordersDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. request check
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		System.out.println(ordersId + " <-- UpdateOrders.doGet() ordersId");

		// 2. model throws
		this.ordersDao = new OrdersDao();
		Orders orders = ordersDao.selectOrdersOne(ordersId);

		// 3. view throws
		request.setAttribute("orders", orders);

		// 4. view forward
		request.getRequestDispatcher("/WEB-INF/jsp/mall/updateOrdersForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. request check
		request.setCharacterEncoding("UTF-8");
				
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		String ordersState = request.getParameter("ordersState");
				
		System.out.println(ordersId + " <-- UpdateOrders.doPost() ordersId");
		System.out.println(itemId + " <-- UpdateOrders.doPost() itemId");
		System.out.println(ordersState + " <-- UpdateOrders.doPost() ordersState");
				
		// 2. model throws
				
		Orders orders = new Orders();
		orders.setOrdersId(ordersId);
		orders.setItemId(itemId);
		orders.setOrdersState(ordersState);
				
		this.ordersDao = new OrdersDao();
		this.ordersDao.updateOrdersState(orders);

		response.sendRedirect(request.getContextPath() + "/mall/MyOrdersList");
	}
}