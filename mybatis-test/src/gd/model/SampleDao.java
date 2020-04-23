package gd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SampleDao {
	// List를 출력
	public List<Sample> selectAll(Map map) {
		// PreparedStatement + ResultSet
		// mybatis가 JDBC API를 이용하여  ResultSet의 값이 List로 변환된다
		return this.getSqlSession().selectList("gd.model.SampleMapper.selectAll", map);
	}
	// Sample 입력
	// commit을 해야한다... ㅋㅋㅋㅋ
	public void insertSample(Sample s) {
		// PreparedStatement
		SqlSession sqlSession = this.getSqlSession();
		// SampleMapper에서 parameterType을 오브젝트 타입으로 받아오기 때문에 
		sqlSession.insert("gd.model.SampleMapper.insertSample", s);
		sqlSession.commit();
	}
	// Sample 삭제
	public void deleteSample(int sampleNo) {
		SqlSession sqlSession = this.getSqlSession();
		sqlSession.delete("gd.model.SampleMapper.deleteSample", sampleNo);
		sqlSession.commit();
	}
	// Sample 수정전 sampleNo 받아오기
	public List<Sample> selectOne(int sampleNo) {
		// List라서 좀 selectOne으로 받아오기가 안됌 하려면 형변환을 해야함
		return this.getSqlSession().selectList("gd.model.SampleMapper.selectOne", sampleNo);
	}
	// Sample 수정
	public void updateSample(Sample s) {
		SqlSession sqlSession = this.getSqlSession();
		sqlSession.update("gd.model.SampleMapper.updateSample", s);
		sqlSession.commit();
	}
	// ClassforName + Connection
	private SqlSession getSqlSession() {
		// inputStream라는 입출력을 담당하는 변수선언
        InputStream inputStream = null;
        try {
        	// inputStream에 mybatis-config.xml안에 있는 설정을 기계어로 컴파일한다
            inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        } catch (IOException e) {
            System.out.println("mybatis-config.xml파일 못 찾음.");
            e.printStackTrace();
        }
        // inputStream은 기계어기 때문에 sqlSessionFactory를 이용하여 java코드로 변환한다
        // SqlSessionFactoryBuilder() == ClassforName
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // sqlSession == Connection
        return sqlSessionFactory.openSession();
    }
	/*	맨처음에 실행했던 코드 
		
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
	*/
}