package blog.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import blog.commons.DBUtil;
import blog.dao.SubjectDao;
import blog.vo.Subject;

public class SubjectService {
	
	private SubjectDao subjectDao;
	
	public List<Subject> getSubjectListAll() {
		
		Connection conn = null;
		List<Subject> list = null;
		
		try {
			conn = DBUtil.getConnection();
			System.out.println(conn + " <-- SubjectService.getSubjectListAll()");
			
			subjectDao = new SubjectDao();
			 list = subjectDao.selectSubjectListAll(conn);

			
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.close(null, null, conn);
		}
		return list;
	}
}