package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.MemberService;
import blog.service.SubjectService;
import blog.vo.Member;
import blog.vo.Subject;

@WebServlet("/UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private MemberService memberService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		memberService = new MemberService();
		Member member = memberService.getMemberOne(memberId);
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("/WEB-INF/views/updateMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		int memberLevel = Integer.parseInt(request.getParameter("memberLevel"));
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberLevel(memberLevel);
		
		memberService = new MemberService();
		memberService.modifyMemberLevel(member);
		
		response.sendRedirect(request.getContextPath() + "/SelectMemberListServlet");
	}
}