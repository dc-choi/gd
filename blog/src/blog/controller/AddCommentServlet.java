package blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.CommentService;
import blog.vo.Comment;
import blog.vo.Member;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
	
	private CommentService commentService;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// session check
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
			return;
		}
		// request & session = comment
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String memberId = loginMember.getMemberId();
		String commentContent = request.getParameter("commentContent");
		
		System.out.println(postNo + " <-- AddCommentServlet.doPost() postNo");
		System.out.println(memberId + " <-- AddCommentServlet.doPost() memberId");
		System.out.println(commentContent + " <-- AddCommentServlet.doPost() commentContent");
		
		Comment comment = new Comment();
		comment.setPostNo(postNo);
		comment.setMemberId(memberId);
		comment.setCommentContent(commentContent);
		
		// service È£Ãâ
		commentService = new CommentService();
		commentService.addComment(comment);
		
		// redirct
		response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
	}
}