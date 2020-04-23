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
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		this.itemDao = new ItemDao();
		List<Item> list = itemDao.selectItemListAll();
		System.out.println(list.size() + " <-- list.size");
	 	request.setAttribute("list", list);
	 	
	 	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/admin/itemList.jsp");
	 	rd.forward(request, response);
	}
}