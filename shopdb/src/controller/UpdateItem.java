package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import vo.*;

@WebServlet("/admin/UpdateItem")
public class UpdateItem extends HttpServlet {
	// Only tomcat RUN
	private ItemDao itemDao;
	// UPDATE FORM (MVC)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		// 1. request check
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		System.out.println(itemId + " <-- UpdateItem.doGet() itemId");
		
		// 2. model throws
		this.itemDao = new ItemDao();
		Item item = itemDao.selectItemOne(itemId);
		// category_id 값을 받아오기위해서 사용한다
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryListAll();
		
		// 3. view throws
		request.setAttribute("item", item);
		// category_id 값을 받아오기위해서 사용한다
		request.setAttribute("list", list);
		
		// 4. view forward
		request.getRequestDispatcher("/WEB-INF/jsp/admin/updateItemForm.jsp").forward(request, response);
	}
	// UPDATE ACTION --> (MC)REDIRECT
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		// 1. request check
		request.setCharacterEncoding("UTF-8");
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String itemName = request.getParameter("itemName");
		int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
		String itemContents = request.getParameter("itemContents");
		String itemImg = request.getParameter("itemImg");
		
		System.out.println(itemId + " <-- UpdateItem.doPost() itemId");
		System.out.println(categoryId + " <-- UpdateItem.doPost() categoryId");
		System.out.println(itemName + " <-- UpdateItem.doPost() itemName");
		System.out.println(itemPrice + " <-- UpdateItem.doPost() itemPrice");
		System.out.println(itemContents + " <-- UpdateItem.doPost() itemContents");
		System.out.println(itemImg + " <--InsertItem.doPost() itemImg");
		// 2. model throws
		
		Item item = new Item();
		item.setItemId(itemId);
		item.setCategoryId(categoryId);
		item.setItemName(itemName);
		item.setItemPrice(itemPrice);
		item.setItemContents(itemContents);
		item.setItemImg(itemImg);
		
		this.itemDao = new ItemDao();
		this.itemDao.updateItem(item);
		
		response.sendRedirect(request.getContextPath() + "/admin/ItemList");
	}
}