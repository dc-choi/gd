package gd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gd.model.Sample;
import gd.service.SampleService;

@WebServlet("/ModifySample")
public class ModifySample extends HttpServlet {
	private SampleService sampleService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sampleNo = Integer.parseInt(request.getParameter("sampleNo"));
		
		sampleService = new SampleService();
		List<Sample> list = sampleService.getSampleListOne(sampleNo);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/ModifySample.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int sampleNo = Integer.parseInt(request.getParameter("sampleNo"));
		String sampleName = request.getParameter("sampleName");
		
		Sample s = new Sample();
		s.setSampleNo(sampleNo);
		s.setSampleName(sampleName);
		
		sampleService = new SampleService();
		sampleService.modifySample(s);
		
		response.sendRedirect(request.getContextPath() + "/GetSampleList");
	}
}