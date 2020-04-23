package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import vo.*;

@WebServlet("/mall/MallIndex")
public class MallIndex extends HttpServlet {

	private ItemDao itemDao; // 1.추상화 2.상속 3.다형성 4.캡슐화
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.itemDao = new ItemDao();
		List<Item> list = itemDao.selectItemListAll();
		System.out.println(list.size() + " <-- MallIndex.list.size");
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/jsp/mall/mallIndex.jsp").forward(request, response);
	}
}