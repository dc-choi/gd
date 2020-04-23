package model;

import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.*;

public class OrdersDao {
	public ArrayList<OrdersAndItem> selectOrdersListAll(String searchWord) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		if(searchWord == null) {
			searchWord = "";
	    }

		ArrayList<OrdersAndItem> list = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT o.*, i.* FROM orders o "
					+ "INNER JOIN item i ON o.item_id = i.item_id "
					+ "WHERE i.item_name like ? or o.orders_state like ? or o.user_name like ? or o.user_phone like ? or o.user_address like ? ORDER BY o.orders_id");
			stmt.setString(1, "%" + searchWord + "%");
			stmt.setString(2, "%" + searchWord + "%");
			stmt.setString(3, "%" + searchWord + "%");
			stmt.setString(4, "%" + searchWord + "%");
			stmt.setString(5, "%" + searchWord + "%");
			System.out.println(stmt + " <-- OrdersDao.selectorderListAll(searchWord) stmt");
			rs = stmt.executeQuery();

			list = new ArrayList<OrdersAndItem>();
			while (rs.next()) {
				OrdersAndItem oi = new OrdersAndItem();
				
				Orders orders = new Orders();
				orders.setOrdersId(rs.getInt("o.orders_id"));
				orders.setItemId(rs.getInt("o.item_id"));
				orders.setItemCount(rs.getInt("o.item_count"));
				orders.setOrdersDate(rs.getString("o.orders_date"));
				orders.setOrdersPrice(rs.getInt("o.orders_price"));
				orders.setOrdersState(rs.getString("o.orders_state"));
				orders.setUserName(rs.getString("o.user_name"));
				orders.setUserPhone(rs.getString("o.user_phone"));
				orders.setUserAddress(rs.getString("o.user_address"));
				
				oi.setOrders(orders);
				
				Item item = new Item();
				item.setItemName(rs.getString("i.item_name"));
				
				oi.setItem(item);
				
				list.add(oi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return list;
	}

	public Orders selectOrdersOne(int ordersId) {
		System.out.println(ordersId + " <-- OrdersDao.selectOrdersOne(int ordersId)");

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Orders orders = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM orders WHERE orders_id = ?");
			stmt.setInt(1, ordersId);
			rs = stmt.executeQuery();

			orders = new Orders();
			if (rs.next()) {
				orders.setOrdersId(rs.getInt("orders_id"));
				orders.setItemId(rs.getInt("item_id"));
				orders.setItemCount(rs.getInt("item_count"));
				orders.setOrdersDate(rs.getString("orders_date"));
				orders.setOrdersPrice(rs.getInt("orders_price"));
				orders.setOrdersState(rs.getString("orders_state"));
				orders.setUserName(rs.getString("user_name"));
				orders.setUserPhone(rs.getString("user_phone"));
				orders.setUserAddress(rs.getString("user_address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return orders;
	}

	// admin update(orders_state)
	public void updateOrdersState(Orders orders) {
		System.out.println(orders + " <-- OrderDao.updateOrdersState(orders)");

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("UPDATE orders SET item_id = ?, orders_state = ? WHERE orders_id = ?");
			stmt.setInt(1, orders.getItemId());
			stmt.setString(2, orders.getOrdersState());
			stmt.setInt(3, orders.getOrdersId());
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("OrdersDao.updateOrdersState() ERROR");
			e.printStackTrace();
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}

	// guest select
	public ArrayList<OrdersAndItem> selectMyOrdersListAll(Orders orders) {
		
		System.out.println(orders + " <-- OrdersDao.selectMyOrdersListOne(orders)");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<OrdersAndItem> list = null;
		
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(
				"SELECT o.*, i.* FROM orders o INNER JOIN item i ON o.item_id = i.item_id WHERE o.user_name like ? and o.user_phone like ? ORDER BY o.orders_id");
			stmt.setString(1, "%" + orders.getUserName() + "%");
			stmt.setString(2, "%" + orders.getUserPhone() + "%");
			System.out.println(stmt + " <-- OrdersDao.selectMyOrdersListOne() stmt");
			rs = stmt.executeQuery();

			list = new ArrayList<OrdersAndItem>();
			while (rs.next()) {
				OrdersAndItem oi = new OrdersAndItem();
				
				Orders orders2 = new Orders(); //이건 앞에서 값을 넘겨줬기 때문에 필요없는 코드다
				orders2.setOrdersId(rs.getInt("o.orders_id"));
				orders2.setItemId(rs.getInt("o.item_id"));
				orders2.setItemCount(rs.getInt("o.item_count"));
				orders2.setOrdersDate(rs.getString("o.orders_date"));
				orders2.setOrdersPrice(rs.getInt("o.orders_price"));
				orders2.setOrdersState(rs.getString("o.orders_state"));
				orders2.setUserName(rs.getString("o.user_name"));
				orders2.setUserPhone(rs.getString("o.user_phone"));
				orders2.setUserAddress(rs.getString("o.user_address"));
				
				oi.setOrders(orders2);
				
				Item item = new Item();
				item.setItemName(rs.getString("i.item_name"));
				
				oi.setItem(item);
				
				list.add(oi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return list;
	}

	// guest insert
	public void insertOrders(Orders orders) {
		System.out.println(orders + " <-- OrderDao.insertOrders(orders)");

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO orders(item_id, item_count, orders_date, orders_price, user_name, user_phone, user_address) VALUES(?, ?, now(), ?, ?, ? ,?)");
			stmt.setInt(1, orders.getItemId());
			stmt.setInt(2, orders.getItemCount());
			stmt.setInt(3, orders.getOrdersPrice());
			stmt.setString(4, orders.getUserName());
			stmt.setString(5, orders.getUserPhone());
			stmt.setString(6, orders.getUserAddress());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 예외메시지 출력바람
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}

	// guest update
	public void updateOrders(Orders orders) {

	}
}