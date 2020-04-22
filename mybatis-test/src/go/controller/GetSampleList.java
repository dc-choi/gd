package go.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gd.model.Sample;
import gd.model.SampleDao;

@WebServlet("/GetSampleList")
public class GetSampleList extends HttpServlet {
	
	private SampleDao sampleDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		sampleDao = new SampleDao();
		List<Sample> list =  sampleDao.selectAll();
		for(Sample s : list) {
			System.out.println(s.getSampleNo() + s.getSampleName());
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}