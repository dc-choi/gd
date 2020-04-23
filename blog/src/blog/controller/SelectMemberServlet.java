package blog.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.*;
import blog.vo.*;

@WebServlet("/SelectMemberServlet")
public class SelectMemberServlet extends HttpServlet {
	
	private MemberService memberService;
	private SubjectService subjectService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		if(session.getAttribute("loginMember") == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		
		// Member�� ����ȯ(cast)�Ͽ� ������Ʈ Ÿ��(������ ������ƮŸ������ �Ѿ�´�)�� session.getAttribute("loginMember")�� MemberŸ������ ��ȯ.
		// ��� ��������δ� StringŸ���� memberId�� Member.getMemberId()�� ���� �ִ´�.
		String memberId = ((Member)(session.getAttribute("loginMember"))).getMemberId();
		memberService = new MemberService();
		Member member = memberService.getMemberOne(memberId);
		System.out.println("member.getMemberId() --> " + member.getMemberId());
		System.out.println("member.getMemberPw() --> " + member.getMemberPw());
		System.out.println("member.getMemberLevel() --> " + member.getMemberLevel());
		System.out.println("member.getMemberDate() --> " + member.getMemberDate());
		// System.out.println(member + " <-- member");
		
		request.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/views/selectMember.jsp").forward(request, response);
	}
}