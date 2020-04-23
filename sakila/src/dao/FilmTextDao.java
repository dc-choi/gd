package dao;

import java.sql.*;
import java.util.*;
import util.*;
import vo.*;

public class FilmTextDao {
	public ArrayList<FilmText> selectfilmText() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT * FROM film_text";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<FilmText> list = new ArrayList<FilmText>();
		while(rs.next()) {
			FilmText filmText = new FilmText();
			filmText.setDescription(rs.getString("description"));
			filmText.setFilmId(rs.getInt("film_id"));
			filmText.setTitle(rs.getString("title"));
			list.add(filmText);
		}
		return list;
	}
}
