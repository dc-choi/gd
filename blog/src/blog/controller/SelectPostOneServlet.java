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

import blog.service.CommentService;
import blog.service.LikeyService;
import blog.service.PostService;
import blog.service.SubjectService;
import blog.vo.Comment;
import blog.vo.Post;
import blog.vo.Subject;

@WebServlet("/SelectPostOneServlet")
public class SelectPostOneServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private PostService postService;
	private CommentService commentService;
	private LikeyService likeyService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		postService = new PostService();
		Post post = postService.getPostOne(postNo);
		request.setAttribute("post", post);
		
		commentService = new CommentService();
		List<Comment> commentList = commentService.getCommentListByPostNo(postNo);
		request.setAttribute("commentList", commentList);
		
		likeyService = new LikeyService();
		Map<String, Integer> map = likeyService.getLikeyCount(postNo);
		request.setAttribute("map", map);
		
		request.getRequestDispatcher("/WEB-INF/views/selectPostOne.jsp").forward(request, response);
	}
}
