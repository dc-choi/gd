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
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
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
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
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