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

@WebServlet("/GetSampleList")
public class GetSampleList extends HttpServlet {
	
	private SampleService sampleService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchWord = request.getParameter("searchWord");
		System.out.println(searchWord + " <-- GetSampleList.doGet().searchWord");
		
		int rowPerPage = 10;
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		sampleService = new SampleService();
		List<Sample> list =  sampleService.getSampleListAll(searchWord, currentPage, rowPerPage);
		/*
		for(Sample s : list) {
			System.out.println(s.getSampleNo() + s.getSampleName());
		}
		*/
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/getSampleList.jsp").forward(request, response);
	}
}