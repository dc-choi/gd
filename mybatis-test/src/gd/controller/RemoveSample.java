package gd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gd.service.SampleService;

@WebServlet("/RemoveSample")
public class RemoveSample extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sampleNo = Integer.parseInt(request.getParameter("sampleNo"));
		System.out.println(sampleNo + " <-- RemoveSample.doGet().sampleNo");
		
		SampleService sampleService = new SampleService();
		sampleService.removeSample(sampleNo);
		
		response.sendRedirect(request.getContextPath() + "/GetSampleList");
	}
}