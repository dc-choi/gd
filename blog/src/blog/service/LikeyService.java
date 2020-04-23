package blog.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import blog.commons.DBUtil;
import blog.dao.LikeyDao;
import blog.vo.Likey;

public class LikeyService {
	private LikeyDao likeyDao;
	
	public Map<String, Integer> getLikeyCount(int postNo) {
		Connection conn = null;
		Map<String, Integer> map = null;
		try {
			conn = DBUtil.getConnection();
			likeyDao = new LikeyDao();
			map = likeyDao.selectLikeyCount(conn, postNo);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public void addLikey(Likey likey) {
		Connection conn = null;
		likeyDao = new LikeyDao();
		
		try {
			conn = DBUtil.getConnection();
			if(likeyDao.isInsertLikey(conn, likey)) {
				likeyDao.insertLikey(conn, likey);
				System.out.println("���ƿ�!");
			} else {
				System.out.println("�̹� �����ؼ� �ȵſ�!(�ι� ������ ������~)");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}