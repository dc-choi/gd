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

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
	
	private MemberService memberService;
	private SubjectService subjectService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		if (session.getAttribute("loginMember") != null) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		request.getRequestDispatcher("/WEB-INF/views/insertMember.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update" + session.getAttribute("loginMember"));
		if (session.getAttribute("loginMember") != null) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		System.out.println(memberId + " <-- AddMemberServlet.doPost() memberId");
		System.out.println(memberPw + " <-- AddMemberServlet.doPost() memberPw");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		memberService = new MemberService();
		boolean flag = memberService.addMember(member);
		System.out.println(flag + " <-- AddMemberServlet.doPost() flag");
		if (flag) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
		} else {
			response.sendRedirect(request.getContextPath() + "/AddMemberServlet");
			return;
		}
	}
}