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

@WebServlet("/admin/CategoryList")
public class CategoryList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // controller ����
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		 // 1) request �м�
		 	System.out.println(request.getRemoteAddr());
		 	
		 // 2) model ȣ��
		 	CategoryDao categoryDao = new CategoryDao();
		 	ArrayList<Category> list = categoryDao.selectCategoryListAll();
		 	System.out.println(list.size()); // 3
		 	request.setAttribute("list", list);
		 	
		 // 3) view ����
		 	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/admin/categoryList.jsp");
		 	rd.forward(request, response);
	}
}