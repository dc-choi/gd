package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.*;
import blog.vo.*;

@WebServlet("/DeleteMemberServlet")
public class DeleteMemberServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private MemberService memberService;
	
	// Å»Åð Æû
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
		
		request.getRequestDispatcher("/WEB-INF/views/deleteMember.jsp").forward(request, response);
	}
	// Å»Åð ¾×¼Ç
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// member Å×ÀÌºí »èÁ¦ + memberid Å×ÀÌºí ÀÔ·Â
		memberService = new MemberService();
		Member member = (Member)(request.getSession().getAttribute("loginMember"));
		System.out.println("DeleteMemberServlet session debug --> " + (request.getSession().getAttribute("loginMember")));
		member.setMemberPw(request.getParameter("memberPw"));
		System.out.println(member.getMemberPw() + " <-- DeleteMemberServlet.doPost() member.getMemberPw()");
		memberService.removeMember(member);
		
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("·Î±×¾Æ¿ô");
		
		response.sendRedirect(request.getContextPath() + "/LoginServlet");
	}
}