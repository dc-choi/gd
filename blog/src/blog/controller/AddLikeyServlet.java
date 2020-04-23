package blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.service.LikeyService;
import blog.vo.Likey;
import blog.vo.Member;

@WebServlet("/AddLikeyServlet")
public class AddLikeyServlet extends HttpServlet {
	
	private LikeyService likeyService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		int likeyCk = Integer.parseInt(request.getParameter("likeyCk"));
		String memberId = loginMember.getMemberId();
		
		System.out.println(postNo + " <-- AddLikeyServlet.doGet() postNo");
		System.out.println(memberId + " <-- AddLikeyServlet.doGet() memberId");
		
		Likey likey = new Likey();
		likey.setPostNo(postNo);
		likey.setMemberId(memberId);
		likey.setLikeyCk(likeyCk);
		
		likeyService = new LikeyService();
		likeyService.addLikey(likey);
		
		response.sendRedirect(request.getContextPath() + "/SelectPostOneServlet?postNo=" + postNo);
	}
}
