package dao;
import java.sql.*;
import java.util.*;
import vo.*;
import util.DBUtil;

public class RentalDao {
	//rentalList.jsp
	public ArrayList<RentalAndInventoryAndCustomerAndStaff> selectRentalList(String searchWord) throws Exception{
		System.out.println(searchWord+"<--searchWord");
		//db硫붿냼�뱶 �뿰寃�
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//荑쇰━ 以�鍮�
		String sql = 
		"SELECT r.*, i.*, c.*,s.* FROM rental r INNER JOIN inventory i INNER JOIN customer c INNER JOIN staff s ON r.staff_id = s.staff_id AND r.customer_id = c.customer_id AND r.inventory_id = i.inventory_id WHERE r.inventory_id like ? ORDER BY c.customer_id";
		//荑쇰━ �떎�뻾
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,"%"+searchWord+"%");
		ResultSet rs = stmt.executeQuery();
		
		//ArrayList
		ArrayList<RentalAndInventoryAndCustomerAndStaff>list = new ArrayList<RentalAndInventoryAndCustomerAndStaff>();
		while(rs.next()) {
			RentalAndInventoryAndCustomerAndStaff rics = new RentalAndInventoryAndCustomerAndStaff();
			
			Rental rental = new Rental();
			rental.setRentalId(rs.getInt("rental_id"));
			rental.setRentalDate(rs.getString("rental_date"));
			rental.setInventoryId(rs.getInt("inventory_id"));
			rental.setCustomerId(rs.getInt("customer_id"));
			rental.setReturnDate(rs.getString("return_date"));
			rental.setStaffId(rs.getInt("staff_id"));
			rental.setLastUpdate(rs.getString("last_update"));
			
			rics.setRental(rental);
			
			Inventory inventory = new Inventory();
			inventory.setInventoryId(rs.getInt("inventory_id"));
			inventory.setFilmId(rs.getInt("film_id"));
			inventory.setStoreId(rs.getInt("store_id"));
			inventory.setLastUpdate(rs.getString("last_update"));
			
			rics.setInventory(inventory);
			
			Customer customer = new Customer();
			customer.setCustomerId(rs.getInt("customer_id"));
			customer.setStoreId(rs.getInt("store_id"));
			customer.setFirstName(rs.getString("first_name"));
			customer.setLastName(rs.getString("last_name"));
			customer.setEmail(rs.getString("email"));
			customer.setAddressId(rs.getInt("address_id"));
			customer.setActive(rs.getInt("active"));
			customer.setCreateDate(rs.getString("create_date"));
			customer.setLastUpdate(rs.getString("last_update"));
			
			rics.setCustomer(customer);
			
			Staff staff = new Staff();
			staff.setStaffId(rs.getInt("staff_id"));
			staff.setFirstName(rs.getString("first_name"));
			staff.setLastName(rs.getString("last_name"));
			staff.setEmail(rs.getString("email"));
			staff.setStoreId(rs.getInt("store_Id"));
			staff.setActive(rs.getInt("active"));
			staff.setUserName(rs.getString("username"));
			staff.setPassword("password");
			staff.setLastUpdate("last_update");
			
			rics.setStaff(staff);
			
			list.add(rics);
		}
		return list;
	}
	
	//insertRental.jsp
	public void insertRental(Rental rental) throws Exception{
		System.out.println(rental+"<--rental");
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "INSERT INTO rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_Update) VALUES(?, ?, ?, ?, ?, ?, now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, rental.getRentalId());
		stmt.setString(2, rental.getRentalDate());
		stmt.setInt(3, rental.getInventoryId());
		stmt.setInt(4, rental.getCustomerId());
		stmt.setString(5, rental.getReturnDate());
		stmt.setInt(6, rental.getStaffId());
		
		stmt.execute();	
	}
	public ArrayList<Integer> selectRentalIdListAll() throws Exception{
	      DBUtil dbutil = new DBUtil();
	      Connection conn = dbutil.getConnection();
	      String sql = "SELECT rental_id FROM rental";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      ArrayList<Integer> list = new ArrayList<Integer>();
	      while(rs.next()) {
	         list.add(rs.getInt("rental_id"));
	      }
	      return list;
	   }
	
}


