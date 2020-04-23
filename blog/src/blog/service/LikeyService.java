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
				System.out.println("좋아요!");
			} else {
				System.out.println("이미 좋아해서 안돼요!(두번 누르지 마세요~)");
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