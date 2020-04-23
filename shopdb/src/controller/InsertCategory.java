package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.*;
import model.*;

@WebServlet("/admin/InsertCategory")
public class InsertCategory extends HttpServlet {
	
	// get����� ��� -> �Է���
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			resp.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		request.getRequestDispatcher("/WEB-INF/jsp/admin/insertCategoryForm.jsp").forward(request, resp);
	}
	
	// post����� ��� -> �Է�
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		// 1. ��û�м� (�ּҺм�, request�м�)
		request.setCharacterEncoding("UTF-8");
		
		String categoryName = request.getParameter("categoryName");
		
		System.out.println(categoryName + " <--InsertCategory.doPost() categoryName");
		
		Category category = new Category();
		category.setCategoryName(categoryName);
		// 2. �� ȣ��
		CategoryDao categoryDao = new CategoryDao();
		categoryDao.insertCategory(category);
		// 3. �� ���� or �ٸ� ��Ʈ�ѷ��� �����̷�Ʈ
		response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
	}
}