package dao;

import java.sql.*;
import java.util.*;

import vo.*;
import util.*;

public class LanguageDao {
	public ArrayList<Language> selectLanguageIdListAll() throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT language_id, name FROM language";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Language> list = new ArrayList<Language>();
		while(rs.next()) {
			Language lang = new Language();
			lang.setLanguageId(rs.getInt("language_id"));
			lang.setName(rs.getString("name"));
			list.add(lang);
		}
		return list;
	}

		   public ArrayList<Language> selectLanguageListAll(String searchword) throws Exception{
		      DBUtil dbutil = new DBUtil();
		      Connection conn = dbutil.getConnection();
		      String sql = "SELECT * FROM language WHERE name like ?";
		      PreparedStatement stmt = conn.prepareStatement(sql);
		      stmt.setString(1, "%"+searchword+"%");
		      ResultSet rs = stmt.executeQuery();
		      ArrayList<Language> list = new ArrayList<Language>();
		      while(rs.next()) {
		         Language language = new Language();
		         language.setLanguageId(rs.getInt("language_id"));
		         language.setName(rs.getString("name"));
		         language.setLastUpdate(rs.getString("last_update"));
		         list.add(language);
		      }
		      return list;
		   }
}