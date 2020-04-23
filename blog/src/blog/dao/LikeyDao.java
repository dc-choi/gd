package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import blog.vo.Likey;

public class LikeyDao {
	// likey_ck count
	public Map<String, Integer> selectLikeyCount(Connection conn, int postNo) throws SQLException {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		int count = 0;
		int uncount = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT likey_ck, COUNT(likey_ck) cnt FROM likey WHERE post_no = ? GROUP BY likey_ck";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postNo);
			rs = stmt.executeQuery();
			while(rs.next()) {
				if(rs.getInt("likey_ck") == 0) {
					uncount = rs.getInt("cnt");
				} 
				if(rs.getInt("likey_ck") == 1) {
					count = rs.getInt("cnt");
				}
			}
			map.put("count", count);
			map.put("uncount", uncount);
		} finally {
			rs.close();
			stmt.close();
		}
		return map;
	}
	
	public void insertLikey(Connection conn, Likey likey) throws SQLException {
		String sql = "INSERT INTO likey(post_no, member_id, likey_ck, likey_date) VALUE(?, ?, ?, now())";
		PreparedStatement stmt = null;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, likey.getPostNo());
			stmt.setString(2, likey.getMemberId());
			stmt.setInt(3, likey.getLikeyCk());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
		}
	}
	
	// possible ==> true
	public boolean isInsertLikey(Connection conn, Likey likey) throws SQLException {
		boolean flag = true;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM likey WHERE post_no = ? AND member_id = ? AND likey_ck = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, likey.getPostNo());
			stmt.setString(2, likey.getMemberId());
			stmt.setInt(3, likey.getLikeyCk());
			System.out.println(stmt + " <-- LikeyDao.isInsertLikey stmt");
			rs = stmt.executeQuery();
			System.out.println(rs + " <-- LikeyDao.isInsertLikey rs");
			
			if(rs.next()) {
				flag = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			rs.close();
		}
		System.out.println(flag + " <-- LikeyDao.flag");
		return flag;
	}
	
	public int deleteLikeyByPost(Connection conn, int postNo) throws SQLException {
		System.out.println(postNo + " <-- LikeyDao.deleteLikeyByPost postNo");
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM likey WHERE post_no = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postNo);
			row = stmt.executeUpdate();
		} finally {
			stmt.close();
		}
		return row;
	}
}