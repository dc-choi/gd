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
		
		// �ٽ� LoginServlet�� �ҷ��͵� �α����� �����ϵ��� �ϴ� �κ�
		// ������ �޾ƿͼ� ���ǰ���
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("loginMember"));
		// loginMember�� null���� �ƴѰ�� Get������� HomeServlet�� �ҷ��´�
		if(session.getAttribute("loginMember") != null) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}
		
		// �޴��κ��� subject�� �ҷ����� �κ�
		// subjectService��� ��ü ����
		subjectService = new SubjectService();
		// subjectService��� Ŭ������ getSubjectListAll() �޼ҵ带 �����Ͽ� List<Subject>��� ������ Ÿ���� ���� subjectList ����
		List<Subject> subjectList = subjectService.getSubjectListAll();
		// subjectList��� object�� subjectList��� �̸����� ������ ���� ����
		request.setAttribute("subjectList", subjectList);
		// /WEB-INF/views/login.jsp�� request, response�� �̿��Ͽ� �������Ѵ�
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}
	// login act
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// memberId�� memberPw��� ������ request.getParameter�� ���� �޾ƿ��� ������
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		// memberId�� memberPw ����
		System.out.println(memberId + " <-- LoginServlet.doPost() memberId");
		System.out.println(memberPw + " <-- LoginServlet.doPost() memberPw");
		// Member��� Vo���� member ��ü ����
		Member member = new Member();
		// member ��ü��  memberId�� memberPw �� �Է�
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		// MemberService���� memberService��� ��ü����
		memberService = new MemberService();
		// returnMember�̶�� ������ ��ü memberService�� �ִ� �޼ҵ��� getMemberOne�� member��� ��ü���� ���� �޾� �Է��� ������
		Member returnMember = memberService.getMemberOne(member);
		
		// returnMember�� ���� �ΰ��� �Ѱܿð�� /LoginServlet���� �̵�
		if(returnMember == null) {
			response.sendRedirect(request.getContextPath() + "/LoginServlet");
		} else { // returnMember�� ���� �ΰ��� �ƴҰ�� /HomeServlet���� �̵�
			// ���� ����
			// HttpSession(������ �����ϴ� Ŭ����)��� ������Ÿ���� ���� session ������ request.getSession()�̶�� �޼ҵ带 ����Ͽ� ������
			HttpSession session = request.getSession();
			// memberId��� object�� loginMember��� �̸����� ������ ���� ����
			session.setAttribute("loginMember", returnMember);
			System.out.println("�α��μ���");
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
		}
	}
}