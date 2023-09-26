package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

/*
 * dao 객체 얻어오기 - 생성자에서 한번만
 * 싱글톤을 위한 자신의 객체 생성해서 리턴
 */
public class BuyerServiceImpl implements IBuyerService {
	
	private IBuyerDao dao;
	private static IBuyerService service;
	
	private BuyerServiceImpl() {
		dao = BuyerDaoImpl.getDao();
	}
	
	public static IBuyerService getService() {
		if(service == null) service = new BuyerServiceImpl();
		
		return service;
	}
	

	@Override
	public List<BuyerVO> selectName() {
		return dao.selectName();
	}

	@Override
	public BuyerVO selectById(String id) {
		return dao.selectById(id);
	}

}
