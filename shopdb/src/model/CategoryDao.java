package model;

import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.*;

public class CategoryDao {
	public ArrayList<Category> selectCategoryListAll() {

		ArrayList<Category> list = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM category");
			rs = stmt.executeQuery();

			list = new ArrayList<Category>();
			while (rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("category_id"));
				category.setCategoryName(rs.getString("category_name"));
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return list;
	}

	public void insertCategory(Category category) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("INSERT INTO category(category_name) VALUES(?)");
			stmt.setString(1, category.getCategoryName());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 예외메시지 출력바람
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}

	public Category selectCategoryOne(int categoryId) {
		
		System.out.println(categoryId + " <--CategoryDao.selectCategoryOne(int CatecategoryId)");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Category category = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM category WHERE category_id = ?");
			stmt.setInt(1, categoryId);
			rs = stmt.executeQuery();

			category = new Category();
			if (rs.next()) {
				category.setCategoryId(rs.getInt("category_id"));
				category.setCategoryName(rs.getString("category_name"));
			}
		} catch (Exception e) {
			System.out.println("CategoryDao.selectCategoryOne() ERROR");
			e.printStackTrace();
		} finally {
			DBUtil.close(null, stmt, conn);
		}
		return category;
	}
	
	public void updateCategory(Category category) {
		
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("UPDATE category SET category_name = ? WHERE category_id = ?");
			stmt.setString(1, category.getCategoryName());
			stmt.setInt(2, category.getCategoryId());
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("CategoryDao.updateCategory() ERROR");
			e.printStackTrace();
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}
}