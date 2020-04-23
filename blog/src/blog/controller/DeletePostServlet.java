package blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.PostService;
import blog.vo.Member;
import blog.vo.Post;

@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {
	
	private PostService postService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		Member loginMember = ((Member)(session.getAttribute("loginMember")));
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String memberId = request.getParameter("memberId");
		String subjectName = request.getParameter("subjectName");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
		System.out.println(postNo + " <-- DeletePostServlet.doGet() postNo");
		System.out.println(memberId + " <-- DeletePostServlet.doGet() memberId");
		System.out.println(subjectName + " <-- DeletePostServlet.doGet() subjectName");
		System.out.println(postTitle + " <-- DeletePostServlet.doGet() postTitle");
		System.out.println(postContent + " <-- DeletePostServlet.doGet() postContent");
		
		Post post = new Post();
		post.setPostNo(postNo);
		post.setMemberId(memberId);
		post.setSubjectName(subjectName);
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
		
		if (loginMember.getMemberLevel() < 1 || loginMember.getMemberId().equals(memberId)) {
			postService = new PostService();
			postService.removePost(postNo, post);
		} else {
			response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
			return;
		}
		response.sendRedirect(request.getContextPath() + "/AdminServlet");
	}
}