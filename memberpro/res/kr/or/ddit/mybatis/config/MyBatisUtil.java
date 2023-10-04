package kr.or.ddit.mybatis.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	static SqlSessionFactory sqlSessionFactory = null;
	static SqlSession session = null;
	
	static {
		// 1. MyBatis의 환경 설정 파일(mybatis-config.xml)을 읽어와서 처리하여
		// SqlSessionFactory객체 생성한다.
		InputStream in = null;
		
		try {
			// 1-1. 환경 설정 파일을 읽어올 스트림 객체 생성
			in = Resources.getResourceAsStream("kr/or/ddit/mybatis/config/mybatis-config.xml");

			// 1-2. 환경 설정 파일을 읽어와 환경 설정을 완성한 후 SqlSessionFactory객체를 생성한다.
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
		} catch (Exception e) {
			System.out.println("MyBatis 초기화 실패!!!");
			e.printStackTrace();
		} finally {
			if (in != null) try {in.close();} catch (IOException e) {}
		}
	}
	
	// SqlSessionFactory객체의 openSession()메서드를 이용하여 
	//   SQL문을 호출해서 실행할 수 있는 SqlSession객체를 생성한다.
	public static SqlSession getSqlSession() {
		session = sqlSessionFactory.openSession();
		// SqlSession 객체를 얻을 때 openSession(true)와 같이 호출하면 
		// INSERT, UPDATE, DELETE문 실행 시 auto commit을 수행하는 SqlSession 객체를 얻을 수 있다.
		
		return session;
	}
}
