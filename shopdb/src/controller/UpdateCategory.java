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

@WebServlet("/admin/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	// Only tomcat RUN
	private CategoryDao categoryDao;
	// UPDATE FORM (MVC)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		// 1. request check
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		System.out.println(categoryId + " <-- UpdateCategory.doGet() categoryId");
		// 2. model throws
		this.categoryDao = new CategoryDao();
		Category category = categoryDao.selectCategoryOne(categoryId);
		// 3. view throws
		request.setAttribute("category", category);
		// view forward
		request.getRequestDispatcher("/WEB-INF/jsp/admin/updateCategoryForm.jsp").forward(request, response);
	}
	// UPDATE ACTION --> (MC)REDIRECT
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		request.setCharacterEncoding("UTF-8");
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
		
		Category category = new Category();
		category.setCategoryId(categoryId);
		category.setCategoryName(categoryName);
		
		this.categoryDao = new CategoryDao();
		this.categoryDao.updateCategory(category);
		
		response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
	}
}