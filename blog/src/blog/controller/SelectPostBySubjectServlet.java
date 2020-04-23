package blog.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.PostService;
import blog.service.SubjectService;
import blog.vo.Subject;

@WebServlet("/SelectPostBySubjectServlet")
public class SelectPostBySubjectServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private PostService postService;
	private final int rowPerPage = 2;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		String subjectName = request.getParameter("subjectName");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println(currentPage + " <-- SelectMemberListServlet.doGet() currentPage");
		System.out.println(rowPerPage + " <-- SelectMemberListServlet.doGet() rowPerPage");
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		postService = new PostService();
		Map<String, Object> map = postService.getPostBySubjectList(subjectName, currentPage, rowPerPage);
		request.setAttribute("subjectName", subjectName);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("postList", map.get("list"));
		request.setAttribute("lastPage", map.get("lastPage"));
		
		request.getRequestDispatcher("/WEB-INF/views/selectPostByList.jsp").forward(request, response);
	}
}
