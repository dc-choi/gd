package blog.dao;

import java.sql.*;
import java.util.*;

import blog.commons.*;
import blog.vo.*;

public class SubjectDao {
	// 메뉴띄워주기 위한 model
	public List<Subject> selectSubjectListAll(Connection conn) {
		
		String sql = "SELECT subject_name FROM subject ORDER BY subject_name ASC";
		
		List<Subject> list = new ArrayList<Subject>();
		
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectName(rs.getString("subject_name"));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, null);
		}
		return list;
	}
}