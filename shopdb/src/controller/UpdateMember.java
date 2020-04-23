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

@WebServlet("/admin/UpdateMember")
public class UpdateMember extends HttpServlet {
	
	// Only tomcat RUN
	private MemberDao memberDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		// 1. request check
		String memberId = request.getParameter("memberId");
		System.out.println(memberId + " <-- UpdateMember.doGet() memberId");
		// 2. model throws
		this.memberDao = new MemberDao();
		Member member = memberDao.selectMemberOne(memberId);
		// 3. view throws
		request.setAttribute("member", member);
		// view forward
		request.getRequestDispatcher("/WEB-INF/jsp/admin/updateMemberForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // ������ �޼ҵ��� ������Ÿ���� void�� �����߱⶧���� null�̳� 0�� �ڿ� ������� �ʴ´�
		}
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberPwC = request.getParameter("memberPwC");
		
		System.out.println(memberId + " <-- UpdateMember.doPost() memberId");
		System.out.println(memberPw + " <-- UpdateMember.doPost() memberPw");
		System.out.println(memberPwC + " <-- UpdateMember.doPost() memberPwC");
		
		if (!memberPw.equals(memberPwC)) {
			response.sendRedirect(request.getContextPath() + "/admin/UpdateMember");
			return;
		}
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		this.memberDao = new MemberDao();
		this.memberDao.updateMember(member);
		
		response.sendRedirect(request.getContextPath() + "/admin/MemberList");
	}
}