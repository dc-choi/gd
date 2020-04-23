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

@WebServlet("/admin/InsertMember")
public class InsertMember extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		request.getRequestDispatcher("/WEB-INF/jsp/admin/insertMemberForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		// 1. ��û�м� (�ּҺм�, request�м�)
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberPwC = request.getParameter("memberPwC");
		
		System.out.println(memberId + " <--InsertMember.doPost() memberId");
		System.out.println(memberPw + " <--InsertMember.doPost() memberPw");
		System.out.println(memberPwC + " <--InsertMember.doPost() memberPwC");
		
		if (!memberPw.equals(memberPwC)) {
			response.sendRedirect(request.getContextPath() + "/admin/InsertMember");
			return;
		}
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		// 2. �� ȣ��
		MemberDao memberDao = new MemberDao();
		memberDao.insertMember(member);
		// 3. �� ���� or �ٸ� ��Ʈ�ѷ��� �����̷�Ʈ
		response.sendRedirect(request.getContextPath() + "/admin/MemberList");
	}
}