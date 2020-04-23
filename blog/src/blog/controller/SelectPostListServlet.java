package blog.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.*;
import blog.vo.*;

@WebServlet("/SelectPostListServlet")
public class SelectPostListServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private PostService	postService;
	private final int rowPerPage = 5;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(loginMember + " <-- SelectMemberListServlet.doGet() loginMember");
		
		if(loginMember == null || loginMember.getMemberLevel() > 10) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		postService = new PostService();
		Map<String, Object> map = postService.getPostListAll(currentPage, rowPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("postList", map.get("list"));
		request.setAttribute("lastPage", map.get("lastPage"));
		
		
		request.getRequestDispatcher("/WEB-INF/views/postList.jsp").forward(request, response);
	}
}
