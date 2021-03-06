package kr.madison.admin.dao;

import java.util.List;

import kr.madison.admin.vo.AdminVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.org.vo.OrgVO;

import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO extends CommonDAO{
	
	public List<AdminVO> findEmpBoardTypes(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findEmpBoardTypes", paramVO);
	}
	
	public List<AdminVO> findRestBoardTypes(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findRestBoardTypes", paramVO);
	}
	
	public List<AdminVO> findSaleBoardTypes(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findSaleBoardTypes", paramVO);
	}
	
	public List<AdminVO> findFreeBoardTypes(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findFreeBoardTypes", paramVO);
	}
	
	public List<AdminVO> findSchoolBoardTypes(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findSchoolBoardTypes", paramVO);
	}
	public List<AdminVO> findBoardTypeList(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findBoardTypeList", paramVO);
	}

	public Integer addOrgFileData(OrgVO paramVO) {
		return getSqlSession().update("Admin.addOrgFileData", paramVO);
	}
	
	public void delOrg(OrgVO paramVO){
		getSqlSession().delete("Admin.delOrg", paramVO);
	}
	public List<AdminVO> findBoardTypes(AdminVO paramVO){
		return getSqlSession().selectList("Admin.findBoardTypes", paramVO);
	}
	
	public int addMenu(AdminVO paramVO){
		return getSqlSession().insert("Admin.addMenu", paramVO);
	}
	
	public int editMenu(AdminVO paramVO){
		return getSqlSession().update("Admin.editMenu", paramVO);
	}
}
