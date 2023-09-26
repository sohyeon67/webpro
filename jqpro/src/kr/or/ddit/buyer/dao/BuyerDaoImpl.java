package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

/*
 * SqlSession 객체 얻기
 * 싱글톤을 위한 자신의 객체 생성해서 리턴하기
 * 
 */
public class BuyerDaoImpl implements IBuyerDao {
	
	private SqlSession sqlSession;
	
	private static IBuyerDao dao;
	
	private BuyerDaoImpl() {}
	
	public static IBuyerDao getDao() {
		if(dao == null) dao = new BuyerDaoImpl();
		
		return dao;
	}

	@Override
	public List<BuyerVO> selectName() {
		sqlSession = MyBatisUtil.getSqlSession();
		List<BuyerVO> list = null;
		
		try {
			list = sqlSession.selectList("buyer.selectName");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		sqlSession = MyBatisUtil.getSqlSession();
		BuyerVO vo = null;
		
		try {
			vo = sqlSession.selectOne("buyer.selectById", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return vo;
	}

}
