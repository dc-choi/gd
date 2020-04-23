package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.SubjectService;
import blog.vo.Member;
import blog.vo.Subject;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	
	private SubjectService subjectService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(loginMember + " <-- SelectMemberListServlet.doGet() loginMember");
		
		if(loginMember == null || loginMember.getMemberLevel() > 10) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		request.getRequestDispatcher("/WEB-INF/views/admin.jsp").forward(request, response);
	}
}
