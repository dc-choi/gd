package model;

import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.*;

public class ItemDao {
	public List<Item> selectItemListAll() {

		ArrayList<Item> list = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM item");
			rs = stmt.executeQuery();

			list = new ArrayList<Item>();
			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt("item_id"));
				item.setCategoryId(rs.getInt("category_id"));
				item.setItemName(rs.getString("item_name"));
				item.setItemPrice(rs.getInt("item_price"));
				item.setItemContents(rs.getString("item_contents"));
				item.setItemImg(rs.getString("item_img"));
				list.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return list;
	}

	public void insertItem(Item item) {

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO item(category_id, item_name, item_price, item_contents, item_img) VALUES(?, ?, ?, ?, ?)");
			stmt.setInt(1, item.getCategoryId());
			stmt.setString(2, item.getItemName());
			stmt.setInt(3, item.getItemPrice());
			stmt.setString(4, item.getItemContents());
			stmt.setString(5, item.getItemImg());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 예외메시지 출력바람
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}

	public Item selectItemOne(int itemId) {

		System.out.println(itemId + " <-- ItemDao.selectItemOne(int itemId)");

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Item item = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM item WHERE item_id = ?");
			stmt.setInt(1, itemId);
			rs = stmt.executeQuery();

			item = new Item();
			if (rs.next()) {
				item.setItemId(rs.getInt("item_id"));
				item.setCategoryId(rs.getInt("category_id"));
				item.setItemName(rs.getString("item_name"));
				item.setItemPrice(rs.getInt("item_price"));
				item.setItemContents(rs.getString("item_contents"));
				item.setItemImg(rs.getString("item_img"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return item;
	}

	public void updateItem(Item item) {
		
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("UPDATE item SET category_id = ?, item_name = ?, item_price = ?, item_contents = ?, item_img = ? WHERE item_id = ?");
			stmt.setInt(1, item.getCategoryId());
			stmt.setString(2, item.getItemName());
			stmt.setInt(3, item.getItemPrice());
			stmt.setString(4, item.getItemContents());
			stmt.setString(5, item.getItemImg());
			stmt.setInt(6, item.getItemId());
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("ItemDao.updateItem() ERROR");
			e.printStackTrace();
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}
}