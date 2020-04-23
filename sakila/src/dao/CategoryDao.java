package dao;
import java.util.*;
import java.sql.*;
import vo.*;

public class CategoryDao {
	
	public void updateCategory(Category category) throws Exception {
		System.out.println(category.getCategoryId() +"</1/categoryDao");
		System.out.println(category.getName() +"</2/categoryDao");
		//System.out.println(category.lastUpdate +"</3/categoryDao");
		String sql = "update category set name=?,last_update=now() where category_id=?";
		String driver = "org.mariadb.jdbc.Driver";
		String dbaddr = "jdbc:mariadb://localhost:3306/sakila";
		String dbid = "root";
		String dbpw = "java1234";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);
		//System.out.println(conn + "conn.updateDao");
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeUpdate();
		System.out.println(stmt + "stmt.updateDao");
		
	
		
		
	}
	public void deleteCategory(int categoryId) throws Exception {
		String driver = "org.mariadb.jdbc.Driver";
		String dbaddr = "jdbc:mariadb://localhost:3306/sakila";
		String dbid = "root";
		String dbpw = "java1234";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr, dbid, dbpw);//蹂��닔�궡 肄붾뱶媛� �븘�땲�씪 �긽�닔媛믪쓣 �꽔�뒗嫄� 醫뗭� �븡�쓬
		System.out.println(conn + "conn.deleteDao");
		PreparedStatement stmt = conn.prepareStatement("delete from category where category_id=?");
		System.out.println(stmt+"deleteDao");
		stmt.setInt(1, categoryId);
		int row = stmt.executeUpdate();
		if(row==1) {
			System.out.println(categoryId+"踰� �궘�젣");
		}else{
			System.out.println(categoryId+"踰� �궘�젣�떎�뙣");
		}
	}
	
	public void insertCategory(Category category) throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila", "root", "java1234");
		PreparedStatement stmt = conn.prepareStatement("insert into category(category_id, name, last_update) values (?,?, now())");
													
		stmt.setInt(1, category.getCategoryId());
		stmt.setString(2, category.getName());
		stmt.executeQuery();
		
		
	}
	public Category selectCategoryOne(int categoryId) throws Exception {//throws Exception�� �꽌踰꾩뿰寃� �삤瑜� �빐寃고빐二쇰뒗 硫붿냼�뱶 
		
		
		Class.forName("org.mariadb.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila", "root", "java1234");
		System.out.println(conn);
		
		PreparedStatement stmt = conn.prepareStatement("select * from category where category_id=?");
														
		stmt.setInt(1, categoryId);
		
		ResultSet rs = stmt.executeQuery();
		Category cs = null;
		
		if(rs.next()) {
			cs = new Category();
			cs.setCategoryId(rs.getInt("category_id"));
			cs.setName(rs.getString("name"));
			System.out.println(cs.getCategoryId() + "<-selectDao");
			System.out.println(cs.getName() + "<-selectDao");
			System.out.println(cs.getLastUpdate() + "<-selectDao");
		
		}
		
		return cs;
			
		}
		
		
	
	// select* from category
	public ArrayList<Category> selectCategoryAll() throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila","root","java1234");
		PreparedStatement stmt = conn.prepareStatement("select category_id,name,last_update from category ");
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<Category> list = new ArrayList<Category>();
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setName(rs.getString("name"));
			category.setLastUpdate(rs.getString("last_update"));
			list.add(category);
			
		}
		
		
		return list;
		
	
	}
}


