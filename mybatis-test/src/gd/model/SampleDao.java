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
	// List�� ���
	public List<Sample> selectAll(Map map) {
		// PreparedStatement + ResultSet
		// mybatis�� JDBC API�� �̿��Ͽ�  ResultSet�� ���� List�� ��ȯ�ȴ�
		return this.getSqlSession().selectList("gd.model.SampleMapper.selectAll", map);
	}
	// Sample �Է�
	// commit�� �ؾ��Ѵ�... ��������
	public void insertSample(Sample s) {
		// PreparedStatement
		SqlSession sqlSession = this.getSqlSession();
		// SampleMapper���� parameterType�� ������Ʈ Ÿ������ �޾ƿ��� ������ 
		sqlSession.insert("gd.model.SampleMapper.insertSample", s);
		sqlSession.commit();
	}
	// Sample ����
	public void deleteSample(int sampleNo) {
		SqlSession sqlSession = this.getSqlSession();
		sqlSession.delete("gd.model.SampleMapper.deleteSample", sampleNo);
		sqlSession.commit();
	}
	// Sample ������ sampleNo �޾ƿ���
	public List<Sample> selectOne(int sampleNo) {
		return this.getSqlSession().selectList("gd.model.SampleMapper.selectOne", sampleNo);
	}
	// Sample ����
	public void updateSample(Sample s) {
		SqlSession sqlSession = this.getSqlSession();
		sqlSession.update("gd.model.SampleMapper.updateSample", s);
		sqlSession.commit();
	}
	// ClassforName + Connection
	private SqlSession getSqlSession() {
		// inputStream��� ������� ����ϴ� ��������
        InputStream inputStream = null;
        try {
        	// inputStream�� mybatis-config.xml�ȿ� �ִ� ������ ����� �������Ѵ�
            inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        } catch (IOException e) {
            System.out.println("mybatis-config.xml���� �� ã��.");
            e.printStackTrace();
        }
        // inputStream�� ����� ������ sqlSessionFactory�� �̿��Ͽ� java�ڵ�� ��ȯ�Ѵ�
        // SqlSessionFactoryBuilder() == ClassforName
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // sqlSession == Connection
        return sqlSessionFactory.openSession();
    }
	/*	��ó���� �����ߴ� �ڵ� 
		
		// inputStream��� ������� ����ϴ� ��������
		InputStream inputStream = null;
		try {
			// inputStream�� mybatis-config.xml�ȿ� �ִ� ������ ����� �������Ѵ�
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			System.out.println(inputStream + " <-- inputStream");
		} catch (IOException e) {
			System.out.println("mybatis-config.xml ������ ��ã��");
			e.printStackTrace();
		}
		// inputStream�� ����� ������ sqlSessionFactory�� �̿��Ͽ� java�ڵ�� ��ȯ�Ѵ�
		// SqlSessionFactoryBuilder() == ClassforName
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		// sqlSession == Connection
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// PreparedStatement + ResultSet
		// mybatis�� JDBC API�� �̿��Ͽ�  ResultSet�� ���� List�� ��ȯ�ȴ�
		List<Sample> list = sqlSession.selectList("gd.model.SampleMapper.selectAll");
		
		return list;
	}
	*/
}