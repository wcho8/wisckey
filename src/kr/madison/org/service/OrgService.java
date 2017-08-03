package kr.madison.org.service;

import java.util.List;

import kr.madison.admin.vo.AdminVO;
import kr.madison.common.service.CommonService;
import kr.madison.org.dao.OrgDAO;
import kr.madison.org.vo.OrgVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrgService extends CommonService{

	@Autowired
	OrgDAO orgDAO;
	
	public List<OrgVO> findOrgListData(OrgVO paramVO){
		return orgDAO.findOrgListData(paramVO);
	}
	
	public List<OrgVO> findOrgList(OrgVO paramVO){
		return orgDAO.findOrgList(paramVO);
	}

	public int getOrgCount(OrgVO paramVO) {
		return orgDAO.getOrgCount(paramVO);
	}
	
	public OrgVO getOrgData(OrgVO paramVO){
		return orgDAO.getOrgData(paramVO);
	}
	
	public int addOrgData(OrgVO paramVO){
		return orgDAO.addOrgData(paramVO);
	}
	
	public int editOrgData(OrgVO paramVO){
		return orgDAO.editOrgData(paramVO);
	}
	
	public List<OrgVO> findOrgBoardList(OrgVO paramVO){
		return orgDAO.findOrgBoardList(paramVO);
	}
	
	public int findOrgBoardTotalCnt(OrgVO paramVO){
		return orgDAO.findOrgBoardTotalCnt(paramVO);
	}
}
