package dao;

import java.sql.*;
import java.util.*;
import util.*;
import vo.*;

public class FilmActorDao {
	public ArrayList<FilmActor> selectfilmActor() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT * FROM film_actor";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<FilmActor> list = new ArrayList<FilmActor>();
		while(rs.next()) {
			FilmActor filmActor = new FilmActor();
			filmActor.setActorId(rs.getInt("actor_id"));
			filmActor.setFilmId(rs.getInt("film_id"));
			filmActor.setLastUpdate(rs.getString("last_update"));
			list.add(filmActor);
		}
		return list;
	}
}
