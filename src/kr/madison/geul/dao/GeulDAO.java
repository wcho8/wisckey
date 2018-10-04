package kr.madison.geul.dao;

import java.util.List;

import kr.madison.common.dao.CommonDAO;
import kr.madison.geul.vo.GeulVO;

import org.springframework.stereotype.Repository;

@Repository
public class GeulDAO extends CommonDAO{

	public  List<GeulVO> findGeulList(GeulVO paramVO) {
		return getSqlSession().selectList("Geul.findGeulList", paramVO);
	}

	public List<GeulVO> findGeulTypes(GeulVO paramVO) {
		return getSqlSession().selectList("Geul.findGeulTypes", paramVO);
	}

	public int findGeulTotalCnt(GeulVO paramVO) {
		return getSqlSession().selectOne("Geul.findGeulTotalCnt", paramVO);
	}

	public List<GeulVO> findGeulRepList(GeulVO paramVO) {
		return getSqlSession().selectList("Geul.findGeulRepList", paramVO);
	}

}
