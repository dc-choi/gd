package blog.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import blog.commons.DBUtil;
import blog.dao.CommentDao;
import blog.dao.LikeyDao;
import blog.dao.PostDao;
import blog.dao.PostidDao;
import blog.vo.Post;

public class PostService {
	
	private PostDao	postDao;
	
	// Admin Post List Service
	public Map<String, Object> getPostListAll(int currentPage, int rowPerPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Connection conn = null;
		List<Post> list = new ArrayList<Post>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		try {
			conn = DBUtil.getConnection();
			postDao = new PostDao();
			list = postDao.selectPostListAll(conn, beginRow, rowPerPage);
			System.out.println(list.size() + " <-- PostService.getPostListAll list.size()");
			
			int totalCount = postDao.selectCountPost(conn);
			System.out.println(totalCount + " <-- PostService.getPostListAll totalCount");
			int lastPage = totalCount / rowPerPage;
			System.out.println(lastPage + " <-- PostService.getPostListAll lastPage");
			
			if(totalCount % rowPerPage != 0) {
				lastPage += 1;
			}
			
			map.put("list", list);
			map.put("lastPage", lastPage);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	// Admin Post Insert
	public void addPost(Post post) {
		System.out.println(post.getMemberId() + " <-- PostService.addPost post.getMemberId()");
		System.out.println(post.getSubjectName() + " <-- PostService.addPost post.getSubjectName()");
		System.out.println(post.getPostTitle() + " <-- PostService.addPost post.getPostTitle()");
		System.out.println(post.getPostContent() + " <-- PostService.addPost post.getPostContent()");
		
		postDao = new PostDao();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			postDao.insertPost(conn, post);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Select Post
	public Post getPostOne(int postNo) {
		System.out.println(postNo + " <-- PostService.getPostOne postNo");
		
		Connection conn = null;
		Post post = null;
		
		try {
			conn = DBUtil.getConnection();
			postDao= new PostDao();
			post = postDao.selectPostOne(conn, postNo);
			System.out.println(post.getPostNo() + " <-- PostService.getPostOne post.getPostNo()");
			System.out.println(post.getMemberId() + " <-- PostService.getPostOne post.getMemberId()");
			System.out.println(post.getSubjectName() + " <-- PostService.getPostOne post.getSubjectName()");
			System.out.println(post.getPostTitle() + " <-- PostService.getPostOne post.getPostTitle()");
			System.out.println(post.getPostContent() + " <-- PostService.getPostOne post.getPostContent()");
			System.out.println(post.getPostDate() + " <-- PostService.getPostOne post.getPostDate()");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return post;
	}
	
	// Select Post of subjectName
	public Map<String, Object> getPostBySubjectList(String subjectName, int currentPage, int rowPerPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Connection conn = null;
		List<Post> list = new ArrayList<Post>();
		int beginRow = (currentPage-1) * rowPerPage;
		System.out.println(beginRow + " <-- PostService.getPostBySubjectList beginRow");
		
		try {
			conn = DBUtil.getConnection();
			postDao= new PostDao();
			list = postDao.selectPostBySubject(conn, subjectName, beginRow, rowPerPage);
			System.out.println(list.size() + " <-- PostService.getPostBySubjectList list.size()");
			
			int totalRowCount = postDao.selectCountUserPost(conn, subjectName);
			System.out.println(totalRowCount + " <-- PostService.getPostBySubjectList totalRowCount");
			int lastPage = totalRowCount / rowPerPage;
			System.out.println(lastPage + " <-- PostService.getPostBySubjectList lastPage");
			
			map.put("list", list);
			map.put("lastPage", lastPage);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public void removePost(int postNo, Post post) {
		
		Connection conn = null;
		
		try {
			try {
				conn = DBUtil.getConnection();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn.setAutoCommit(false);
			CommentDao commentDao = new CommentDao();
			PostidDao postidDao = new PostidDao();
			LikeyDao likeyDao = new LikeyDao();
			postDao = new PostDao();
			int row = commentDao.deleteCommentByPost(conn, postNo);
			int row2 = 0;
			int row3 = 0;
			System.out.println(row + " <-- row");
			
			if(row == 1) {
				row2 = likeyDao.deleteLikeyByPost(conn, postNo);
				// postDao.deletePost(conn, postNo);
			}
			System.out.println(row2 + " <-- row2");
			
			if(row2 == 1) {
				row3 = postDao.deletePost(conn, postNo);
				// postidDao.insertPostid(conn, post);
			}
			System.out.println(row3 + " <-- row3");
			
			if(row3 == 1) {
				postidDao.insertPostid(conn, post);
			}
			conn.commit();
		} catch(SQLException e) {
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
}