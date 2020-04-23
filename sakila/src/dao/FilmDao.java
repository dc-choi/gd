package dao;
import java.sql.*;
import java.util.*;
import util.*;
import vo.*;

public class FilmDao {
	public ArrayList<Film> selectfilm() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT * FROM film";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Film> list = new ArrayList<Film>();
		while(rs.next()) {
			Film film = new Film();
			film.setFilmId(rs.getInt("film_id"));
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
			list.add(film);
		}
		return list;
	}
	
	public void insertFilm(Film film) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "INSERT INTO film(title, description, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update,language_id)"
				+ "VALUES(?,?,?,?,?,?,?,?,now(),?) ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, film.getTitle());
		stmt.setString(2, film.getDescription());
		stmt.setInt(3, film.getRentalDuration());
		stmt.setInt(4, film.getRentalRate());
		stmt.setInt(5, film.getLength());
		stmt.setInt(6, film.getReplacementCost());
		stmt.setString(7, film.getRating());
		stmt.setString(8, film.getSpecialFeatures());
		stmt.setInt(9, film.getLanguageId());
		stmt.executeUpdate();
		
		
	}
}
