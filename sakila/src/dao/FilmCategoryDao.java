package dao;

import java.sql.*;
import java.util.*;
import util.*;
import vo.*;

public class FilmCategoryDao {
	public ArrayList<FilmCategory> selectfilmCategory() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT * FROM film_category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<FilmCategory> list = new ArrayList<FilmCategory>();
		while(rs.next()) {
			FilmCategory filmCategory = new FilmCategory();
			filmCategory.setCategoryId(rs.getInt("category_id"));
			filmCategory.setFilmId(rs.getInt("film_id"));
			filmCategory.setLastUpdate(rs.getString("last_update"));
			list.add(filmCategory);
		}
		return list;
	}
}
