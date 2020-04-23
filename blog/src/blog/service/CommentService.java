package blog.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import blog.commons.DBUtil;
import blog.dao.CommentDao;
import blog.dao.CommentidDao;
import blog.vo.Comment;

public class CommentService {

	private CommentDao commentDao;
	private CommentidDao commentidDao;

	public void addComment(Comment comment) {
		System.out.println(comment.getPostNo() + " <-- CommentService.addComment comment.getPostNo()");
		System.out.println(comment.getMemberId() + " <-- CommentService.addComment comment.getMemberId()");
		System.out.println(comment.getCommentContent() + " <-- CommentService.addComment comment.getCommentContent()");

		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			commentDao = new CommentDao();
			commentDao.insertComment(conn, comment);
		} catch (Exception e) {
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

	public List<Comment> getCommentListByPostNo(int postNo) {
		System.out.println(postNo + " <-- CommentService.getCommentListByPostNo postNo");

		List<Comment> list = new ArrayList<Comment>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			commentDao = new CommentDao();
			list = commentDao.selectCommentListByPostNo(conn, postNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	// Remove Comment
	public void removeComment(int commentNo, String memberId, int postNo, String commentContent) {
		System.out.println(commentNo + " <-- CommentService.removeComment commentNo");
		System.out.println(memberId + " <-- CommentService.removeComment MemberId");
		System.out.println(postNo + " <-- CommentService.removeComment postNo");
		System.out.println(commentContent + " <-- CommentService.removeComment commentContent");

		Connection conn = null;

		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			Comment c = new Comment();
			c.setCommentNo(commentNo);
			c.setMemberId(memberId);
			c.setPostNo(postNo);
			c.setCommentContent(commentContent);

			commentDao = new CommentDao();
			commentidDao = new CommentidDao();
			int row = commentDao.deleteComment(conn, commentNo);
			if (row == 1) {
				commentidDao.insertCommentid(conn, c);
			}
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// Modify Comment get commentNo
	public List<Comment> getCommentNo(int commentNo) {
		List<Comment> list = new ArrayList<Comment>();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			commentDao = new CommentDao();
			list = commentDao.selectCommentList(conn, commentNo);
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
		return list;
	}

	// Modify Comment
	public void modifyComment(Comment comment) {
		System.out.println(comment.getCommentNo() + " <-- CommentService.modifyComment comment.getCommentNo()");
		System.out.println(comment.getCommentContent() + " <-- CommentService.modifyComment comment.getCommentContent()");

		Connection conn = null;

		try {
			conn = DBUtil.getConnection();

			commentDao = new CommentDao();
			commentDao.updateComment(conn, comment.getCommentNo(), comment.getCommentContent());
		} catch (Exception e) {
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