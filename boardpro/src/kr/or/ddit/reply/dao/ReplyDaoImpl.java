package kr.or.ddit.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.reply.vo.ReplyVO;

public class ReplyDaoImpl implements IReplyDao {
	private static IReplyDao dao;
	private SqlSession session;
	
	// 자신을 생성하고 리턴
	public static IReplyDao getInstance() {
		if (dao == null) dao = new ReplyDaoImpl();

		return dao;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.insert("reply.insertReply", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int deleteReply(int rno) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.delete("reply.deleteReply", rno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.delete("reply.updateReply", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		session = MyBatisUtil.getSqlSession();
		List<ReplyVO> list = null;
		
		try {
			list = session.selectList("reply.listReply", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

}
