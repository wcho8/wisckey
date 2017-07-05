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

}
