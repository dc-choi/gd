package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import vo.*;

@WebServlet("/admin/MemberList")
public class MemberList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("session update --> " + session.getAttribute("SloginId"));

		if (session.getAttribute("SloginId") == null) {
			response.sendRedirect(request.getContextPath() + "/admin/AdminLogin");
			return; // 위에서 메소드의 데이터타입을 void로 설정했기때문에 null이나 0이 뒤에 선언되지 않는다
		}

		// 1) request 분석
		System.out.println(request.getRemoteAddr());

		// 2) model 호출
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> list = memberDao.selectMemberListAll();
		System.out.println(list.size()); // 3
		request.setAttribute("list", list);

		// 3) view 연결
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/admin/memberList.jsp");
		rd.forward(request, response);
	}
}