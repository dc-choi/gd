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

@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private PostService postService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		request.getRequestDispatcher("/WEB-INF/views/addPost.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String subjectName = request.getParameter("subjectName");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
		System.out.println(memberId + " <-- AddPostServlet.doPost() memberId");
		System.out.println(subjectName + " <-- AddPostServlet.doPost() subjectName");
		System.out.println(postTitle + " <-- AddPostServlet.doPost() postTitle");
		System.out.println(postContent + " <-- AddPostServlet.doPost() postContent");
		
		Post post = new Post();
		post.setMemberId(memberId);
		post.setSubjectName(subjectName);
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
		
		postService = new PostService();
		postService.addPost(post);
		
		response.sendRedirect(request.getContextPath() + "/SelectPostListServlet");
	}
}