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
	
	// get방식의 경우 -> 입력폼
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			resp.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		request.getRequestDispatcher("/WEB-INF/jsp/admin/insertCategoryForm.jsp").forward(request, resp);
	}
	
	// post방식의 경우 -> 입력
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		// 1. 요청분석 (주소분석, request분석)
		request.setCharacterEncoding("UTF-8");
		
		String categoryName = request.getParameter("categoryName");
		
		System.out.println(categoryName + " <--InsertCategory.doPost() categoryName");
		
		Category category = new Category();
		category.setCategoryName(categoryName);
		// 2. 모델 호출
		CategoryDao categoryDao = new CategoryDao();
		categoryDao.insertCategory(category);
		// 3. 뷰 연결 or 다른 컨트롤러를 리다이렉트
		response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
	}
}