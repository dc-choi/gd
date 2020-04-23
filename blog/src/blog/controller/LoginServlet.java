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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private SubjectService subjectService;
	private MemberService memberService;
	
	// login form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 다시 LoginServlet을 불러와도 로그인을 유지하도록 하는 부분
		// 세션을 받아와서 세션검증
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		// loginMember가 null값이 아닌경우 Get방식으로 HomeServlet을 불러온다
		if(session.getAttribute("loginMember") != null) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}
		
		// 메뉴부분의 subject를 불러오는 부분
		// subjectService라는 객체 생성
		subjectService = new SubjectService();
		// subjectService라는 클래스의 getSubjectListAll() 메소드를 실행하여 List<Subject>라는 데이터 타입을 가진 subjectList 생성
		List<Subject> subjectList = subjectService.getSubjectListAll();
		// subjectList라는 object를 subjectList라는 이름으로 세션을 만들어서 보냄
		request.setAttribute("subjectList", subjectList);
		// /WEB-INF/views/login.jsp로 request, response를 이용하여 포워딩한다
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}
	// login act
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// memberId와 memberPw라는 변수를 request.getParameter로 값을 받아오고 선언함
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		// memberId와 memberPw 검증
		System.out.println(memberId + " <-- LoginServlet.doPost() memberId");
		System.out.println(memberPw + " <-- LoginServlet.doPost() memberPw");
		// Member라는 Vo에서 member 객체 생성
		Member member = new Member();
		// member 객체에  memberId와 memberPw 값 입력
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		// MemberService에서 memberService라는 객체생성
		memberService = new MemberService();
		// returnMember이라는 변수에 객체 memberService에 있는 메소드인 getMemberOne을 member라는 객체에서 값을 받아 입력후 선언함
		Member returnMember = memberService.getMemberOne(member);
		
		// returnMember의 값이 널값을 넘겨올경우 /LoginServlet으로 이동
		if(returnMember == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
		} else { // returnMember의 값이 널값이 아닐경우 /HomeServlet으로 이동
			// 세션 생성
			// HttpSession(세션을 생성하는 클래스)라는 데이터타입을 가진 session 변수에 request.getSession()이라는 메소드를 사용하여 선언함
			HttpSession session = request.getSession();
			// memberId라는 object를 loginMember라는 이름으로 세션을 만들어서 보냄
			session.setAttribute("loginMember", returnMember);
			System.out.println("로그인성공");
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
		}
	}
}