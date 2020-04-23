package dao;

import java.sql.*;
import java.util.*;

import util.*;
import vo.*;

public class InventoryDao {
	// StaffList
	public ArrayList<InventoryAndStoreAndFilm> SelectInventory(String searchWord) throws Exception {

		System.out.println(searchWord + " <--searchWord");

		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		String sql = "SELECT i.*, st.*, f.* FROM inventory i INNER JOIN store st INNER JOIN film f ON i.film_id = f.film_id AND i.store_id = st.store_id "
				+ "WHERE f.title like ? ORDER BY i.inventory_id";

		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + searchWord + "%");

		ResultSet rs = stmt.executeQuery();
		ArrayList<InventoryAndStoreAndFilm> list = new ArrayList<InventoryAndStoreAndFilm>();
		while (rs.next()) {
			InventoryAndStoreAndFilm isf = new InventoryAndStoreAndFilm();

			Inventory inventory = new Inventory();
			inventory.setInventoryId(rs.getInt("inventory_Id"));
			inventory.setFilmId(rs.getInt("film_Id"));
			inventory.setStoreId(rs.getInt("store_Id"));
			inventory.setLastUpdate(rs.getString("last_update"));

			isf.setInventory(inventory);

			Store store = new Store();
			store.setStoreId(rs.getInt("store_id"));
			store.setManagerStaffId(rs.getInt("manager_staff_id"));
			store.setAdressId(rs.getInt("address_id"));
			store.setLastUpdate(rs.getString("last_update"));

			isf.setStore(store);

			Film film = new Film();
			film.setFilmId(rs.getInt("film_Id"));
			film.setTitle(rs.getString("title"));
			film.setDescription(rs.getString("description"));
			film.setReleaseYear(rs.getString("release_year"));
			film.setLanguageId(rs.getInt("language_id"));
			film.setOriginalLanguageId(rs.getInt("original_language_id"));
			film.setRentalDuration(rs.getInt("rental_duration"));
			film.setRentalRate(rs.getInt("rental_rate"));
			film.setLength(rs.getInt("length"));
			film.setReplacementCost(rs.getInt("replacement_cost"));
			film.setRating(rs.getString("rating"));
			film.setSpecialFeatures(rs.getString("special_features"));
			film.setLastUpdate(rs.getString("last_update"));

			isf.setFilm(film);

			list.add(isf);
		}
		return list;
	}

	// insertInventoryAction
	public void insertInventory(Inventory i) throws Exception {
		System.out.println("InventoryDao.insertInventory()");
		System.out.println(i.getFilmId() + " <-- i.getFilmId");
		System.out.println(i.getStoreId() + " <-- i.getStoreId");

		String sql = "INSERT INTO inventory(film_id, store_id, last_update) VALUES(?, ?, now())";

		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, i.getFilmId());
		stmt.setInt(2, i.getStoreId());
		stmt.executeUpdate();
	}
}