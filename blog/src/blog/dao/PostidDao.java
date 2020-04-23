package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import blog.vo.Post;

public class PostidDao {
	// Admin Insert Post
	public int insertPostid(Connection conn, Post post) throws SQLException {
		System.out.println(post.getMemberId() + " <-- PostDao.insertPost p.getMemberId()");
		System.out.println(post.getSubjectName() + " <-- PostDao.insertPost p.getSubjectName()");
		System.out.println(post.getPostTitle() + " <-- PostDao.insertPost p.getPostTitle()");
		System.out.println(post.getPostContent() + " <-- PostDao.insertPost p.getPostContent()");

		PreparedStatement stmt = null;
		int row = 0;
		String sql = "INSERT INTO postid(memberid, subjectname, posttitle, postcontent, postid_date) VALUE(?, ?, ?, ?, now())";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, post.getMemberId());
			stmt.setString(2, post.getSubjectName());
			stmt.setString(3, post.getPostTitle());
			stmt.setString(4, post.getPostContent());
			row = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
		}
		return row;
	}
}