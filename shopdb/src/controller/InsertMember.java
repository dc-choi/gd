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
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		request.getRequestDispatcher("/WEB-INF/jsp/admin/insertMemberForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));
		
		if(session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}
		
		// 1. 요청분석 (주소분석, request분석)
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
		// 2. 모델 호출
		MemberDao memberDao = new MemberDao();
		memberDao.insertMember(member);
		// 3. 뷰 연결 or 다른 컨트롤러를 리다이렉트
		response.sendRedirect(request.getContextPath() + "/admin/MemberList");
	}
}