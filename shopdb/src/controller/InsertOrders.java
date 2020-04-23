package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import vo.*;

@WebServlet("/mall/InsertOrders")
public class InsertOrders extends HttpServlet {
	private ItemDao itemDao;
	private OrdersDao ordersDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		System.out.println(itemId + " <-- InsertOrders.doGet() itemId");
		this.itemDao = new ItemDao();
		Item item = itemDao.selectItemOne(itemId);
		
		request.setAttribute("item", item);
		
		request.getRequestDispatcher("/WEB-INF/jsp/mall/insertOrdersForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.get~
		request.setCharacterEncoding("UTF-8");
		
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
		int itemCount = Integer.parseInt(request.getParameter("itemCount"));
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userAddress = request.getParameter("userAddress");
		
		System.out.println(itemId + " <--InsertOrders.doPost() itemId");
		System.out.println(itemPrice + " <--InsertOrders.doPost() itemPrice");
		System.out.println(itemCount + " <--InsertOrders.doPost() itemCount");
		System.out.println(userName + " <--InsertOrders.doPost() userName");
		System.out.println(userPhone + " <--InsertOrders.doPost() userPhone");
		System.out.println(userAddress + " <--InsertOrders.doPost() userAddress");
		
		int ordersPrice = itemPrice * itemCount;
		
		System.out.println(ordersPrice + " <--InsertOrders.doPost() ordersPrice");
		
		Orders orders = new Orders();
		orders.setItemId(itemId);
		orders.setItemCount(itemCount);
		orders.setOrdersPrice(ordersPrice);
		orders.setUserName(userName);
		orders.setUserPhone(userPhone);
		orders.setUserAddress(userAddress);
		
		// orders.set~
		this.ordersDao = new OrdersDao();
		this.ordersDao.insertOrders(orders);
		// redirect
		response.sendRedirect(request.getContextPath() + "/mall/MyOrdersList");
	}
}