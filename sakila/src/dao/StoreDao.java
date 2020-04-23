package dao;

import java.sql.*;
import java.util.*;
import util.*;
import vo.*;


public class StoreDao {
	public int insertStoreFormAction(Staff staff, int addressId) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "INSERT INTO store(manager_staff_id, address_id, last_update) VALUES (?, ?, now())";
		PreparedStatement stmt = conn.prepareStatement(sql ,Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, staff.getStaffId());
		stmt.setInt(2, addressId);
		stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		int storeId = 0;
		if(rs.next()) {
			storeId = rs.getInt(1);
		}
		return storeId;
	}
	
	public ArrayList<StoreAndStaff> selectStoreListAll() throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT so.*, st.* FROM store so INNER JOIN staff st ON so.store_id = st.store_id ORDER BY so.store_id ASC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<StoreAndStaff> list = new ArrayList<StoreAndStaff>();
		while(rs.next()) {
			Store so = new Store();
			so.setStoreId(rs.getInt("so.store_id"));
			Staff st = new Staff();
			st.setStaffId(rs.getInt("st.staff_id"));
			st.setFirstName(rs.getString("st.first_name"));
			st.setLastName(rs.getString("st.last_name"));
			StoreAndStaff sAS = new StoreAndStaff();
			sAS.setStore(so);
			sAS.setStaff(st);
			list.add(sAS);
		}
		return list;
	}
	
	public ArrayList<Integer> selectStoreIdList() throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT store_id FROM store ORDER BY store_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Integer> list = new ArrayList<Integer>();
		while(rs.next()) {
			list.add(rs.getInt("store_id"));
		}
		return list;
	}
}
