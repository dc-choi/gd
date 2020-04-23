package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import vo.*;
import java.util.*;

@WebServlet("/admin/InsertItem")
public class InsertItem extends HttpServlet {
	
	private CategoryDao categoryDao;
	
	// INSERT FORM
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		this.categoryDao = new CategoryDao();
		
		ArrayList<Category> list = this.categoryDao.selectCategoryListAll();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/jsp/admin/insertItemForm.jsp").forward(request, response);
	}
	
	// INSERT ACTION
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		// 1. request �м�
		request.setCharacterEncoding("UTF-8");
		
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String itemName = request.getParameter("itemName");
		int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
		String itemContents = request.getParameter("itemContents");
		String itemImg = request.getParameter("itemImg");
		
		System.out.println(categoryId + " <--InsertItem.doPost() categoryId");
		System.out.println(itemName + " <--InsertItem.doPost() itemName");
		System.out.println(itemPrice + " <--InsertItem.doPost() itemPrice");
		System.out.println(itemContents + " <--InsertItem.doPost() itemContents");
		System.out.println(itemImg + " <--InsertItem.doPost() itemImg");
		
		Item item = new Item();
		item.setCategoryId(categoryId);
		item.setItemName(itemName);
		item.setItemPrice(itemPrice);
		item.setItemContents(itemContents);
		item.setItemImg(itemImg);
		// 2. �� ȣ��
		ItemDao itemDao = new ItemDao();
		itemDao.insertItem(item);
		// 3. �ٸ� ��Ʈ�ѷ� ȣ��
		response.sendRedirect(request.getContextPath() + "/admin/ItemList");
	}
}