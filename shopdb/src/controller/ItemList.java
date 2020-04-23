package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import vo.*;
import java.util.*;

@WebServlet("/admin/ItemList")
public class ItemList extends HttpServlet {
	private ItemDao itemDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getRemoteAddr());
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		this.itemDao = new ItemDao();
		List<Item> list = itemDao.selectItemListAll();
		System.out.println(list.size() + " <-- list.size");
	 	request.setAttribute("list", list);
	 	
	 	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/admin/itemList.jsp");
	 	rd.forward(request, response);
	}
}