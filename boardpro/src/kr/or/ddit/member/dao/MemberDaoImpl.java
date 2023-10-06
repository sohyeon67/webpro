package kr.or.ddit.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

/*
 * Data Access Object
 * SqlSession객체가 필요
 * Singleton을 위한 자신의 객체를 생성해서 리턴하는 메서드 필요
 */

public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao dao;
	private SqlSession session;
	
	// 자신을 생성하고 리턴
	public static IMemberDao getInstance() {
		if (dao == null) dao = new MemberDaoImpl();

		return dao;
	}

	
	@Override
	public MemberVO selectById(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		MemberVO vo = null;
		
		try {
			vo = session.selectOne("member.selectById", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return vo;
	}

}
