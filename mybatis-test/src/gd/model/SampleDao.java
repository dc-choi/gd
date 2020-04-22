package gd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SampleDao {
	public List<Sample> selectAll() {
		// inputStream라는 입출력을 담당하는 변수선언
		InputStream inputStream = null;
		try {
			// inputStream에 mybatis-config.xml안에 있는 설정을 기계어로 컴파일한다
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			System.out.println(inputStream + " <-- inputStream");
		} catch (IOException e) {
			System.out.println("mybatis-config.xml 파일을 못찾음");
			e.printStackTrace();
		}
		// inputStream은 기계어기 때문에 sqlSessionFactory를 이용하여 java코드로 변환한다
		// SqlSessionFactoryBuilder() == ClassforName
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		// sqlSession == Connection
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// PreparedStatement + ResultSet
		// mybatis가 JDBC API를 이용하여  ResultSet의 값이 List로 변환된다
		List<Sample> list = sqlSession.selectList("gd.model.SampleMapper.selectAll");
		
		return list;
	}
}