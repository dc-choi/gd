package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import blog.vo.Comment;

public class CommentidDao {
	public void insertCommentid(Connection conn, Comment comment) throws SQLException {
		System.out.println(comment.getPostNo() + " <-- CommentidDao.insertCommentid comment.getPostNo()");
		System.out.println(comment.getMemberId() + " <-- CommentidDao.insertCommentid comment.getMemberId()");
		System.out.println(comment.getCommentContent() + " <-- CommentidDao.insertCommentid comment.getCommentContent()");

		PreparedStatement stmt = null;
		String sql = "INSERT INTO commentid(postno, memberid, cc, commentid_date) VALUE(?, ?, ?, now())";
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
}