package kr.or.ddit.board.vo;

public class PageVO {
	private int start;	// 시작 글번호
	private int end;	// 끝 글번호
	private int startPage;	// 시작 페이지 번호
	private int endPage;	// 끝 페이지 번호
	
	private int totalPage;	// 전체 페이지수
	private int totalCount;	// 전체 글개수
	
	private static int perList = 3;
	private static int perPage = 2;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public static int getPerList() {
		return perList;
	}
	public static void setPerList(int perList) {
		PageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		PageVO.perPage = perPage;
	}
	
	
}
