package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import vo.*;

@WebServlet("/admin/MemberList")
public class MemberList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));

		if (session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}

		// 1) request �м�
		System.out.println(request.getRemoteAddr());

		// 2) model ȣ��
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> list = memberDao.selectMemberListAll();
		System.out.println(list.size()); // 3
		request.setAttribute("list", list);

		// 3) view ����
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/admin/memberList.jsp");
		rd.forward(request, response);
	}
}