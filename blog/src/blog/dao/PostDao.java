package blog.dao;

import java.sql.*;
import java.util.*;

import blog.vo.Post;

public class PostDao {
	
	// Admin Post List + Page
	public List<Post> selectPostListAll(Connection conn, int beginRow, int rowPerPage) throws SQLException {
		System.out.println(beginRow + " <-- PostDao.selectPostListAll beginRow");
		System.out.println(rowPerPage + " <-- PostDao.selectPostListAll rowPerPage");
		
		List<Post> list = new ArrayList<Post>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT post_no, member_id, subject_name, post_title, post_content, post_date FROM post LIMIT ?, ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Post p = new Post();
				p.setPostNo(rs.getInt("post_no"));
				p.setMemberId(rs.getString("member_id"));
				p.setSubjectName(rs.getString("subject_name"));
				p.setPostTitle(rs.getString("post_title"));
				p.setPostContent(rs.getString("post_content"));
				p.setPostDate(rs.getString("post_date"));
				list.add(p);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
		} 
	return list;
	}
	
	// Admin Post List Page Count
	public int selectCountPost(Connection conn) throws SQLException {
		int totalRowCount = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM post";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRowCount = rs.getInt("count(*)");
			}
			System.out.println(totalRowCount + " <-- PostDao.selectCountPost totalRowCount");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			rs.close();
		}
		return totalRowCount;
	}
	
	// Admin Insert Post
	public void insertPost(Connection conn, Post post) throws SQLException {
		System.out.println(post.getMemberId() + " <-- PostDao.insertPost p.getMemberId()");
		System.out.println(post.getSubjectName() + " <-- PostDao.insertPost p.getSubjectName()");
		System.out.println(post.getPostTitle() + " <-- PostDao.insertPost p.getPostTitle()");
		System.out.println(post.getPostContent() + " <-- PostDao.insertPost p.getPostContent()");
		
		PreparedStatement stmt = null;
		String sql = "INSERT INTO post(member_id, subject_name, post_title, post_content, post_date) VALUE(?, ?, ?, ?, now())";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, post.getMemberId());
			stmt.setString(2, post.getSubjectName());
			stmt.setString(3, post.getPostTitle());
			stmt.setString(4, post.getPostContent());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
		}
	}
	
	// Admin Detele Post
	public int deletePost(Connection conn, int postNo) throws SQLException {
		System.out.println(postNo + " <-- PostDao.deletePost postNo");
		
		PreparedStatement stmt = null;
		int row = 0;
		String sql = "DELETE FROM post WHERE post_no = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postNo);
			row = stmt.executeUpdate();
		} finally {
			stmt.close();
		}
		return row;
	}
	
	
	public Post selectPostOne(Connection conn, int postNo) throws SQLException {
		System.out.println(postNo + " <-- PostDao.selectPostListAll postNo");
		
		Post post = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM post WHERE post_no = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postNo);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				post = new Post();
				post.setPostNo(rs.getInt("post_no"));
				post.setMemberId(rs.getString("member_id"));
				post.setSubjectName(rs.getString("subject_name"));
				post.setPostTitle(rs.getString("post_title"));
				post.setPostContent(rs.getString("post_content"));
				post.setPostDate(rs.getString("post_date"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
		} 
	return post;
	}
	
	// Select Post By Subject
	public List<Post> selectPostBySubject(Connection conn, String subjectName, int beginRow, int rowPerPage) throws SQLException {
		System.out.println(subjectName + " <-- PostDao.selectPostBySubject subjectName");
		System.out.println(beginRow + " <-- PostDao.selectPostBySubject beginRow");
		System.out.println(rowPerPage + " <-- PostDao.selectPostBySubject rowPerPage");
		
		List<Post> list = new ArrayList<Post>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT post_no, member_id, subject_name, post_title, post_content, post_date FROM post WHERE subject_name = ? LIMIT ?, ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, subjectName);
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Post p = new Post();
				p.setPostNo(rs.getInt("post_no"));
				p.setMemberId(rs.getString("member_id"));
				p.setSubjectName(rs.getString("subject_name"));
				p.setPostTitle(rs.getString("post_title"));
				p.setPostContent(rs.getString("post_content"));
				p.setPostDate(rs.getString("post_date"));
				list.add(p);
			}
			System.out.println(list.size() + " <-- PostDao.selectPostBySubject list.size()");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
		}
		return list;
	}
	
	// Select Post List Page Count
	public int selectCountUserPost(Connection conn, String subjectName) throws SQLException {
		int totalRowCount = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM post WHERE subject_name = ?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, subjectName);
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRowCount = rs.getInt("count(*)");
			}
			System.out.println(totalRowCount + " <-- PostDao.selectCountUserPost totalRowCount");
		} finally {
			rs.close();
			stmt.close();
		}
		return totalRowCount;
	}
}
