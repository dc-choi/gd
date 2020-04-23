package dao;

import java.sql.*;
import java.util.*;

import util.*;
import vo.*;

public class PaymentDao {

	// currentPage -1또는 최대행보다 넘어가지않게 lastPage를 만든 메소드
	public static int selectTotalCount() throws Exception {
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="SELECT COUNT(*) cnt FROM payment";
		
		PreparedStatement stmt1 = conn.prepareStatement(sql);
		System.out.println(stmt1 + " <-- stmt1");
		ResultSet rs1 = stmt1.executeQuery();
		System.out.println(rs1 + " <-- rs1");

		int totalCount = 0;
		if (rs1.next()) {
			totalCount = rs1.getInt("cnt");
		}
		return totalCount;
	}

	// InventoryList
	public ArrayList<PaymentAndCustomerAndStaffAndRental> SelectPaymentList(String searchWord, int beginRow, int rowPerpage) throws Exception {

		System.out.println(searchWord + " <--searchWord");
		
		System.out.println("ActorDao.selectActorVoByPage");
		System.out.println(beginRow + " <-- beginRow");
		System.out.println(rowPerpage + " <-- rowPerpage");

		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		String sql = "SELECT p.*, c.*, s.*, r.* FROM Payment p INNER JOIN Customer c INNER JOIN Staff s INNER JOIN Rental r "
				+ "ON p.customer_id = c.customer_id AND p.staff_id = s.staff_id AND p.rental_id = r.rental_id WHERE p.payment_id like ? "
				+ "ORDER BY p.payment_id LIMIT ?, ?";

		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + searchWord + "%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerpage);

		ResultSet rs = stmt.executeQuery();
		ArrayList<PaymentAndCustomerAndStaffAndRental> list = new ArrayList<PaymentAndCustomerAndStaffAndRental>();
		while (rs.next()) {
			PaymentAndCustomerAndStaffAndRental pcsr = new PaymentAndCustomerAndStaffAndRental();

			Payment payment = new Payment();
			payment.setPaymentId(rs.getInt("p.payment_id"));
			payment.setCustomerId(rs.getInt("p.customer_id"));
			payment.setStaffId(rs.getInt("p.staff_id"));
			payment.setRentalId(rs.getInt("p.rental_id"));
			payment.setAmount(rs.getDouble("p.amount"));
			payment.setPaymentDate(rs.getString("p.payment_date"));
			payment.setLastUpdate(rs.getString("p.last_update"));

			pcsr.setPayment(payment);

			Customer customer = new Customer();
			customer.setCustomerId(rs.getInt("c.customer_id"));
			customer.setStoreId(rs.getInt("c.store_id"));
			customer.setFirstName(rs.getString("c.first_name"));
			customer.setLastName(rs.getString("c.last_name"));
			customer.setEmail(rs.getString("c.email"));
			customer.setAddressId(rs.getInt("c.address_id"));
			customer.setLastUpdate(rs.getString("c.last_update"));

			pcsr.setCustomer(customer);

			Staff staff = new Staff();
			staff.setStaffId(rs.getInt("s.staff_id"));
			staff.setFirstName(rs.getString("s.first_name"));
			staff.setLastName(rs.getString("s.last_name"));
			staff.setAddressId(rs.getInt("s.address_id"));
			staff.setEmail(rs.getString("s.email"));
			staff.setStoreId(rs.getInt("s.store_id"));
			staff.setLastUpdate(rs.getString("s.last_update"));

			pcsr.setStaff(staff);

			Rental rental = new Rental();
			rental.setRentalId(rs.getInt("r.rental_id"));
			rental.setRentalDate(rs.getString("r.rental_date"));
			rental.setInventoryId(rs.getInt("r.inventory_id"));
			rental.setCustomerId(rs.getInt("r.customer_id"));
			rental.setReturnDate(rs.getString("r.return_date"));
			rental.setStaffId(rs.getInt("r.staff_id"));
			rental.setLastUpdate(rs.getString("r.last_update"));

			pcsr.setRental(rental);

			list.add(pcsr);
		}
		return list;
	}
	
	public void insertPaymentAction(Payment p) throws Exception {
		DBUtil dbUtil = new DBUtil();
		String sql =
		"INSERT INTO payment(customer_id, staff_id, rental_id, amount, payment_date, last_update) VALUES (?, ?, ?, ?, now(), now())"; 
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, p.getCustomerId());
		stmt.setInt(2, p.getStaffId());
		stmt.setInt(3, p.getRentalId());
		stmt.setDouble(4, p.getAmount());
		stmt.executeUpdate();
	}
}