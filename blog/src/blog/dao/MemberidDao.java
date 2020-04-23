package blog.dao;

import java.sql.*;

public class MemberidDao {
	
	// ¸â¹ö Å»Åð½Ã Å»ÅðÈ¸¿ø Ãß°¡
	public void insertMemberid(Connection conn, String memberid) throws SQLException {
		PreparedStatement stmt = null;
		String sql = "INSERT INTO memberid(memberid, member_date) VALUES(?, now())";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberid);
			stmt.executeUpdate();
		} finally {
			stmt.close();
		}
	}
}