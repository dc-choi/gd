package dao;
import java.sql.*;
import java.util.*;
import util.*;
import vo.*;
public class CustomerDao {
	public ArrayList<CustomerAndStoreAndAddress> selectCustomerListAll() throws Exception {
		DBUtil dbUtil = new DBUtil();
		String sql = "SELECT cu.*, ad.*, so.* FROM customer cu INNER JOIN address ad INNER JOIN store so ON cu.address_id = ad.address_id AND cu.store_id = so.store_id ORDER BY customer_id ASC";
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<CustomerAndStoreAndAddress> list = new ArrayList<CustomerAndStoreAndAddress>();
		while(rs.next()) {
			CustomerAndStoreAndAddress cSA = new CustomerAndStoreAndAddress();
			Customer cu = new Customer();
			cu.setCustomerId(rs.getInt("cu.customer_id"));
			cu.setFirstName(rs.getString("cu.first_name"));
			cu.setLastName(rs.getString("cu.last_name"));
			cu.setEmail(rs.getString("cu.email"));
			cu.setActive(rs.getInt("cu.active"));
			cu.setCreateDate(rs.getString("cu.create_date"));
			cu.setLastUpdate(rs.getString("cu.last_update"));
			Store so = new Store();
			so.setStoreId(rs.getInt("so.store_id"));
			Address ad = new Address();
			ad.setAddressId(rs.getInt("ad.address_id"));
			ad.setAddress(rs.getString("ad.address"));
			ad.setPhone(rs.getString("ad.phone"));
			
			cSA.setCustomer(cu);
			cSA.setStore(so);
			cSA.setAddress(ad);
			list.add(cSA);
		}
		return list;
	}
	
	
	public void insertCustomerFormAction(Customer customer) throws Exception {
		DBUtil dbUtil = new DBUtil();
		String sql ="INSERT INTO customer(store_id, first_name, last_name, email, address_id, active, create_date, last_update) VALUES (?, ?, ?, ?, ?, ?, now(), now())"; 
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, customer.getStoreId());
		stmt.setString(2, customer.getFirstName());
		stmt.setString(3, customer.getLastName());
		stmt.setString(4, customer.getEmail());
		stmt.setInt(5, customer.getAddressId());
		stmt.setInt(6, customer.getActive());
		stmt.executeUpdate();
	}
	public ArrayList<Integer> selectCustomerIdListAll() throws Exception{
	      DBUtil dbutil = new DBUtil();
	      Connection conn = dbutil.getConnection();
	      String sql = "SELECT customer_id FROM customer";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      ArrayList<Integer> list = new ArrayList<Integer>();
	      while(rs.next()) {
	         list.add(rs.getInt("customer_id"));
	      }
	      return list;
	   }
}
