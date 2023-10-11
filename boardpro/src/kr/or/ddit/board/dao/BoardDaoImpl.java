package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class BoardDaoImpl implements IBoardDao {

	private static IBoardDao dao;
	private SqlSession session;
	
	// 자신을 생성하고 리턴
	public static IBoardDao getInstance() {
		if (dao == null) dao = new BoardDaoImpl();

		return dao;
	}
	
	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		List<BoardVO> list = null;
		
		try {
			list = session.selectList("board.selectBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		int count = 0;
		
		try {
			count = session.selectOne("board.getTotalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return count;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.insert("board.insertBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int deleteBoard(int bno) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.delete("board.deleteBoard", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.update("board.updateBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateHit(int bno) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.update("board.updateHit", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

}
