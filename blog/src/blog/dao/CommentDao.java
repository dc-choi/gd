package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import blog.vo.Comment;

public class CommentDao {
	public void insertComment(Connection conn, Comment comment) throws SQLException {
		System.out.println(comment.getPostNo() + " <-- CommentDao.insertComment comment.getPostNo()");
		System.out.println(comment.getMemberId() + " <-- CommentDao.insertComment comment.getMemberId()");
		System.out.println(comment.getCommentContent() + " <-- CommentDao.insertComment comment.getCommentContent()");

		PreparedStatement stmt = null;
		String sql = "INSERT INTO comment(post_no, member_id, comment_content, comment_date) VALUE(?, ?, ?, now())";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, comment.getPostNo());
			stmt.setString(2, comment.getMemberId());
			stmt.setString(3, comment.getCommentContent());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
		}
	}

	public List<Comment> selectCommentListByPostNo(Connection conn, int postNo) throws SQLException {

		List<Comment> list = new ArrayList<Comment>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM comment WHERE post_no = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postNo);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				c.setCommentNo(rs.getInt("comment_no"));
				c.setPostNo(rs.getInt("post_no"));
				c.setMemberId(rs.getString("member_id"));
				c.setCommentContent(rs.getString("comment_content"));
				c.setCommentDate(rs.getString("comment_date"));
				list.add(c);
			}
		} finally {
			rs.close();
			stmt.close();
		}
		return list;
	}

	// Delete Comment
	public int deleteComment(Connection conn, int commentNo) throws SQLException {
		System.out.println(commentNo + " <-- CommentDao.deleteComment commentNo");
		
		PreparedStatement stmt = null;
		int row = 0;
		String sql = "DELETE FROM comment WHERE comment_no = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, commentNo);
			row = stmt.executeUpdate();
		} finally {
			stmt.close();
		}
		return row;
	}
	
	// Delete Comment 
	public int deleteCommentByPost(Connection conn, int postNo) throws SQLException {
		System.out.println(postNo + " <-- CommentDao.deleteCommentByPost postNo");
		
		PreparedStatement stmt = null;
		int row = 0;
		String sql = "DELETE FROM comment WHERE post_no = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, postNo);
			row = stmt.executeUpdate();
		} finally {
			stmt.close();
		}
		return row;
	}
	
	// Update CommentList By CommentNo
	public List<Comment> selectCommentList(Connection conn, int commentNo) throws SQLException {

		List<Comment> list = new ArrayList<Comment>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM comment WHERE comment_no = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, commentNo);
			rs = stmt.executeQuery();
			if(rs.next()) {
				Comment c = new Comment();
				c.setCommentNo(rs.getInt("comment_no"));
				c.setPostNo(rs.getInt("post_no"));
				c.setMemberId(rs.getString("member_id"));
				c.setCommentContent(rs.getString("comment_content"));
				c.setCommentDate(rs.getString("comment_date"));
				list.add(c);
			}
		} finally {
			rs.close();
			stmt.close();
		}
		return list;
	}

	// Update Comment
	public void updateComment(Connection conn, int commentNo, String commentContent) throws SQLException {
		System.out.println(commentNo + " <-- CommentDao.deleteComment commentNo");
		System.out.println(commentContent + " <-- CommentDao.deleteComment commentContent");
		
		PreparedStatement stmt = null;
		String sql = "UPDATE comment SET comment_content = ? WHERE comment_no = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, commentContent);
			stmt.setInt(2, commentNo);
			stmt.executeUpdate();
		} finally {
			stmt.close();
		}
	}
}