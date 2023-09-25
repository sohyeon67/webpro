package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {

	// 메소드 선언
	
	// 전체 리스트 가져오기
	public List<MemberVO> selectMember();
	
	// id, pass 검색해서 데이터 가져오기
	public MemberVO selectById(Map<String, Object> map);
	
}
