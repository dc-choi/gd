package gd.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SampleDao {	
	// List�� ���
	public List<Sample> selectAll() {
		// PreparedStatement + ResultSet
		// mybatis�� JDBC API�� �̿��Ͽ�  ResultSet�� ���� List�� ��ȯ�ȴ�
		return this.getSqlSession().selectList("gd.model.SampleMapper.selectAll");
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