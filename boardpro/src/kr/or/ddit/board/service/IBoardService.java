package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;

public interface IBoardService {
	
	// 리스트 가져오기 - 한 페이지당 3개씩
	public List<BoardVO> selectBoardList(Map<String, Object> map);
	
	// 전체 글 개수 구하기
	public int getTotalCount(Map<String, Object> map);
	
	// 저장
	public int insertBoard(BoardVO vo);
	
	// 삭제
	public int deleteBoard(int bno);
	
	// 수정
	public int updateBoard(BoardVO vo);
	
	// 조회수 증가
	public int updateHit(int bno);
	
	// 페이지별 정보구하기 - start, end, 총페이지수
	public PageVO pageInfo(int page, String stype, String sword);
	
}
