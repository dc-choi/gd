package dao;
import java.sql.*;
import java.util.*;
import util.*;
import vo.*;
public class CountryDao {
   public void insertCountry(Country country) throws Exception{
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      String sql = "insert into country(country_id, country, last_update) values (?,?, now())";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setInt(1, country.getCountryId());
      stmt.setString(2,  country.getCountry());
      stmt.executeQuery();
      
   }
   
   public ArrayList<Country> selectCountryListAll(String searchWord)throws Exception{
      System.out.println(searchWord + "<--searchWord/Dao");
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      String sql = "select * from country where country like ?";      
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, "%"+searchWord+"%");
      ResultSet rs = stmt.executeQuery();
      ArrayList<Country> list = new ArrayList<Country>();
      while (rs.next()) {
         Country country = new Country();
         country.setCountryId(rs.getInt("country_id"));
         country.setCountry(rs.getString("country"));
         country.setLastUpdate(rs.getString("last_update"));
         list.add(country);
         
      }
      return list;
   }
}