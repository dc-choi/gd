package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import vo.*;

@WebServlet("/admin/OrdersList")
public class OrdersList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		// 1) request �м�
		System.out.println(request.getRemoteAddr());
		
		String searchWord = request.getParameter("searchWord");
		
		if (request.getParameter("searchWord") == null) {
			searchWord = "";
		}
		
		System.out.println(searchWord + " <-- OrdersList.doGet() searchWord");
		
		// 2) model ȣ��
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndItem> list = ordersDao.selectOrdersListAll(searchWord);
		System.out.println(list.size() + " <-- list.size()");
		request.setAttribute("list", list);
	 	
		// 3) view ����
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/admin/ordersList.jsp");
		rd.forward(request, response);
	}
}