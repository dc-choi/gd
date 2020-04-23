package gd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import gd.model.Sample;
import gd.model.SampleDao;

public class SampleService {
	private SampleDao sampleDao;
	
	public List<Sample> getSampleListAll(String searchWord, int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1) * rowPerPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		sampleDao = new SampleDao();
		return sampleDao.selectAll(map);
	}
	public void addSample(Sample s) {
		sampleDao = new SampleDao();
		sampleDao.insertSample(s);
	}
	public void removeSample(int sampleNo) {
		sampleDao = new SampleDao();
		sampleDao.deleteSample(sampleNo);
	}
	public List<Sample> getSampleListOne(int sampleNo) {
		sampleDao = new SampleDao();
		return sampleDao.selectOne(sampleNo);
	}
	public void modifySample(Sample s) {
		sampleDao = new SampleDao();
		sampleDao.updateSample(s);
	}
}