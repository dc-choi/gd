package gd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gd.model.Sample;
import gd.service.SampleService;

@WebServlet("/AddSample")
public class AddSample extends HttpServlet {
	SampleService sampleService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/addSample.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String sampleName = request.getParameter("sampleName");
		
		Sample s = new Sample();
		s.setSampleName(sampleName);
		
		sampleService = new SampleService();
		sampleService.addSample(s);
		
		response.sendRedirect(request.getContextPath() + "/GetSampleList");
	}
}