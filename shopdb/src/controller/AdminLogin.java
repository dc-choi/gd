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

@WebServlet("/admin/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	// login form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/admin/adminLogin.jsp").forward(request, response);
	}
	
	// login action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		final String adminId = request.getParameter("adminId");
		final String adminPw = request.getParameter("adminPw");
		
		Member member = new Member();
		member.setMemberId(adminId);
		member.setMemberPw(adminPw);
		
		MemberDao memberDao = new MemberDao();
		Member reMember = memberDao.login(member);
		
		if (reMember != null) {
			System.out.println("�α��� ����");
			// 1. �α����ߴٴ� ������ ����(����)�ȿ� ���� --> session ����
			// request.setAttribute("RloginId", "admin"); // --> �̰ɷδ� �ٸ� ��Ʈ�ѷ��� �ѱ�������
			HttpSession session = request.getSession();
			session.setAttribute("SloginId", adminId);
			// 2. ������ index ��û
			response.sendRedirect(request.getContextPath() + "/admin/Index");
		} else {
			System.out.println("�α��� ����");
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
		}
	}
}