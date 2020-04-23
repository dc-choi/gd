package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.CommentService;
import blog.service.SubjectService;
import blog.vo.Comment;
import blog.vo.Member;
import blog.vo.Subject;

@WebServlet("/UpdateCommentServlet")
public class UpdateCommentServlet extends HttpServlet {
	
	private CommentService commentService;
	private SubjectService subjectService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		Member loginMember = ((Member)(session.getAttribute("loginMember")));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String memberId = request.getParameter("memberId");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		if (loginMember.getMemberLevel() < 1 || loginMember.getMemberId().equals(memberId)) {
			
			subjectService = new SubjectService();
			List<Subject> subjectList = subjectService.getSubjectListAll();
			request.setAttribute("subjectList", subjectList);
			
			commentService = new CommentService();
			List<Comment> commentList = commentService.getCommentNo(commentNo);
			request.setAttribute("commentList", commentList);
			
			request.getRequestDispatcher("/WEB-INF/views/updateComment.jsp?postNo=" + postNo).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String commentContent = request.getParameter("commentContent");
		
		Comment c = new Comment();
		c.setCommentNo(commentNo);
		c.setCommentContent(commentContent);
		
		commentService = new CommentService();
		commentService.modifyComment(c);
		
		response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
	}
}