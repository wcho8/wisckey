package kr.madison.org.dao;

import java.util.List;

import kr.madison.common.dao.CommonDAO;
import kr.madison.org.vo.OrgVO;

import org.springframework.stereotype.Repository;

@Repository
public class OrgDAO extends CommonDAO{
	public List<OrgVO> findOrgListData(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgListData", paramVO);
	}
	public List<OrgVO> findOrgList(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgList", paramVO);
	}
	
	public int getOrgCount(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getOrgCount", paramVO);
	}
	
	public OrgVO getOrgData(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getOrgData", paramVO);
	}
	
	public int addOrgData(OrgVO paramVO){
		return getSqlSession().insert("Org.addOrgData", paramVO);
	}
	
	public int editOrgData(OrgVO paramVO){
		return getSqlSession().update("Org.editOrgData", paramVO);
	}
	
	public List<OrgVO> findOrgBoardList(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgBoardList", paramVO);
	}
	
	public int findOrgBoardTotalCnt(OrgVO paramVO){
		return getSqlSession().selectOne("Org.findOrgBoardTotalCnt", paramVO);
	}
}
