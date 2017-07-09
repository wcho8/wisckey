package kr.madison.career.dao;

import java.util.List;

import kr.madison.career.vo.CareerVO;
import kr.madison.common.dao.CommonDAO;

import org.springframework.stereotype.Repository;


@Repository
public class CareerDAO extends CommonDAO{

	public List<CareerVO> findEmployerList(CareerVO paramVO) {
		return getSqlSession().selectList("Career.findEmployerList", paramVO);
	}

	public int addEmployerData(CareerVO paramVO) {
		getSqlSession().insert("Career.addEmployerData", paramVO);
		return paramVO.getBrdid();
	}

	public CareerVO findEmployerContent(CareerVO paramVO) {
		return getSqlSession().selectOne("Career.findEmployerContent", paramVO);
	}

	public int modEmployerCount(CareerVO paramVO) {
		return getSqlSession().update("Career.modEmployerCount", paramVO);
	}

	public int findEmployerTotalCnt(CareerVO paramVO) {
		return getSqlSession().selectOne("Career.findEmployerTotalCnt", paramVO);
	}
	
	public int addEmployerReply(CareerVO paramVO) {
		return getSqlSession().insert("Career.addEmployerReply", paramVO); 
	}

	public List<CareerVO> findEmployerReply(CareerVO paramVO) {
		return getSqlSession().selectList("Career.findEmployerReply", paramVO);
	}
	//여기서부터 취업게시판
	public int addEmployBoardData(CareerVO paramVO) {
		getSqlSession().insert("Career.addEmployBoardData", paramVO);
		return paramVO.getBrdid();
	}

	public CareerVO findEmployBoardContent(CareerVO paramVO) {
		return getSqlSession().selectOne("Career.findEmployBoardContent", paramVO);
	}

	public List<CareerVO> findEmployBoardList(CareerVO paramVO) {
		return getSqlSession().selectList("Career.findEmployBoardList",paramVO);
	}

	public int findEmployBoardTotalCnt(CareerVO paramVO) {
		return getSqlSession().selectOne("Career.findEmployBoardTotalCnt", paramVO);
	}

	public int modBoardCount(CareerVO paramVO) {
		return getSqlSession().update("Career.modBoardCount", paramVO);
	}

	public int addEmployBoardReply(CareerVO paramVO) {
		getSqlSession().insert("Career.addEmployBoardReply", paramVO);
		
		return paramVO.getRepid();
	}

	public List<CareerVO> findBoardReply(CareerVO paramVO) {
		return getSqlSession().selectList("Career.findBoardReply", paramVO);
	}


	

}
