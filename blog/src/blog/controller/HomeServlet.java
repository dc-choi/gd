package blog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.service.SubjectService;
import blog.vo.Subject;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	
	// private SubjectDao subjectDao;
	private SubjectService subjectService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		subjectService = new SubjectService();
		List<Subject> subjectList = subjectService.getSubjectListAll();
		request.setAttribute("subjectList", subjectList);
		
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
}