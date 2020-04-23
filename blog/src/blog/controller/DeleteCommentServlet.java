package blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.CommentService;
import blog.vo.Member;

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {

	private CommentService commentService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		Member loginMember = ((Member)(session.getAttribute("loginMember")));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String memberId = request.getParameter("memberId");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String commentContent = request.getParameter("commentContent");
		
		if (loginMember.getMemberLevel() < 1 || loginMember.getMemberId().equals(memberId)) {
			commentService = new CommentService();
			commentService.removeComment(commentNo, memberId, postNo, commentContent);
		} else {
			response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
			return;
		}
		response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
	}
}