package kr.madison.admin.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.admin.dao.AdminDAO;
import kr.madison.admin.vo.AdminVO;
import kr.madison.common.service.CommonService;
import kr.madison.org.vo.OrgVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService extends CommonService{
	@Autowired
	AdminDAO adminDAO;
	
	public List<AdminVO> findBoardType(int btype, AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();
		
		switch(btype){
		case 1:
			result = adminDAO.findEmpBoardTypes(paramVO);
			break;
		case 2:
			result = adminDAO.findFreeBoardTypes(paramVO);
			break;
		case 3:
			result = adminDAO.findSchoolBoardTypes(paramVO);
			break;
		case 4:
			result = adminDAO.findRestBoardTypes(paramVO);
			break;
		case 5:
			result = adminDAO.findSaleBoardTypes(paramVO);
			break;
		}
		
		return result;
	}
	public List<AdminVO> findBoardTypeList(AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();
		
		result = adminDAO.findBoardTypeList(paramVO);
		
		return result;
	}
	
}
