package dao;

import java.sql.*;
import java.util.*;
import util.*;
import vo.*;
public class StaffDao {
	public void updateStaffActiveAndStoreId(int storeId, int staffId) throws Exception {
		DBUtil dbUtil = new DBUtil();
		String sql = "UPDATE staff SET active=2, store_id=? WHERE staff_id=?";
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, storeId);
		stmt.setInt(2, staffId);
		stmt.executeUpdate();
	}
	
	public ArrayList<StaffAndAddressAndStore> selectStaffListAll() throws Exception{
		DBUtil dbUtil = new DBUtil();
		String sql = "SELECT st.*, ad.*, so.* FROM staff st INNER JOIN address ad INNER JOIN store so ON st.address_id = ad.address_id AND st.store_id = so.store_id ORDER BY staff_id ASC";
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<StaffAndAddressAndStore> list = new ArrayList<StaffAndAddressAndStore>();
		while(rs.next()) {
			StaffAndAddressAndStore sAS = new StaffAndAddressAndStore();
			Staff st = new Staff();
			st.setStaffId(rs.getInt("st.staff_id"));
			st.setFirstName(rs.getString("first_name"));
			st.setLastName(rs.getString("st.last_name"));
			st.setEmail(rs.getString("st.email"));
			st.setActive(rs.getInt("st.active"));
			st.setUserName(rs.getString("st.username"));
			st.setPassword(rs.getString("st.password"));
			st.setLastUpdate(rs.getString("st.last_update"));
			Address ad = new Address();
			ad.setAddressId(rs.getInt("ad.address_id"));
			ad.setPhone(rs.getString("ad.phone"));
			Store so = new Store();
			so.setStoreId(rs.getInt("so.store_id"));
			
			sAS.setStaff(st);
			sAS.setAddress(ad);
			sAS.setStore(so);
			
			list.add(sAS);
		}
		return list;
	}
	
	
	public void insertStaffFormAction(Staff staff) throws Exception {
		DBUtil dbUtil = new DBUtil();
		String sql = "INSERT INTO staff(first_name, last_name, address_id, email, store_id, active, username, password, last_update) VALUES (?, ?, ?, ?, ?, ?, ?, ?, now())";
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, staff.getFirstName());
		stmt.setString(2, staff.getLastName());
		stmt.setInt(3, staff.getAddressId());
		stmt.setString(4, staff.getEmail());
		stmt.setInt(5, staff.getStoreId());
		stmt.setInt(6, staff.getActive());
		stmt.setString(7, staff.getUserName());
		stmt.setString(8, staff.getPassword());
		stmt.executeUpdate();
	}
	
	public ArrayList<Staff> selectStaffIdList() throws Exception{
		DBUtil dbUtil = new DBUtil();
		String sql = "SELECT staff_id, first_name, last_name, active FROM staff";
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<Staff> list = new ArrayList<Staff>();
		while(rs.next()) {
			Staff staff = new Staff();
			staff.setStaffId(rs.getInt("staff_id"));
			staff.setFirstName(rs.getString("first_name"));
			staff.setLastName(rs.getString("last_name"));
			staff.setActive(rs.getInt("active"));
			list.add(staff);
		}
		return list;
	}
	public ArrayList<Integer> selectStaffIdListAll() throws Exception{
	      DBUtil dbutil = new DBUtil();
	      Connection conn = dbutil.getConnection();
	      String sql = "SELECT staff_id FROM staff";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      ArrayList<Integer> list = new ArrayList<Integer>();
	      while(rs.next()) {
	         list.add(rs.getInt("staff_id"));
	      }
	      return list;
	   }
}
