package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/Index", "/admin/Index"})
public class Index extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// System.out.println(req.getAttribute("RloginId") + " <-- RloginId");
		HttpSession session = req.getSession();
		System.out.println(session.getAttribute("SloginId") + " <-- SloginId");
		
		if(session.getAttribute("SloginId") == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		req.getRequestDispatcher("/WEB-INF/jsp/admin/index.jsp").forward(req, resp);
	}
}