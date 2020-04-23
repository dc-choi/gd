package dao;
import java.sql.*;
import java.util.*;
import vo.*;
public class ActorDao {
	
	public void deleteActor(int actorId) throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila", "root", "java1234");
		PreparedStatement stmt = conn.prepareStatement("delete FROM actor where actor_id=?");
		stmt.setInt(1, actorId);
		stmt.executeUpdate();
	}
	public int selectTotalCount() throws Exception {
		//SELECT COUNT(*) FROM actor 필요
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila", "root", "java1234");
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM actor");
		ResultSet rs = stmt.executeQuery();
		int totalCount = 0;
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		return totalCount;
	}
	public ArrayList<Actor> selectActorByPage(int beginRow, int rowPerPage) throws Exception{
		System.out.println(beginRow +"/1/class");
		System.out.println(rowPerPage + "/2/class");
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila", "root", "java1234");
		PreparedStatement stmt = conn.prepareStatement("select * from actor limit ?,?");
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);		
		ResultSet rs = stmt.executeQuery();
		//ResultSet -> Arraylist 로 변경
		ArrayList<Actor> list = new ArrayList<Actor>();
		while(rs.next()) {
			Actor actor = new Actor();
			actor.setActorId(rs.getInt("actor_id"));
			actor.setFirstName(rs.getString("first_name"));
			actor.setLastName(rs.getString("last_name"));
			actor.setLastUpdate(rs.getString("last_update"));
			list.add(actor);
		}
		return list;
	}
	
	public void insertActor(Actor actor) throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila","root","java1234");
		PreparedStatement stmt = conn.prepareStatement("insert into actor( first_name, last_name, last_update) values (?,?, now())");
		stmt.setString(1, actor.getFirstName());
		stmt.setString(2, actor.getLastName());
		stmt.executeQuery();
	}
}
