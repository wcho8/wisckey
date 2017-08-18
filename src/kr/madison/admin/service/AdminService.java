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
	
	public AdminVO checkTables(AdminVO paramVO){
		String cod_table = "";
		String idname = "";
		switch(paramVO.getPtypeid()){
		case 1:
			cod_table = "cod_freeboard";
			idname = "frid";
			break;
		case 2:
			cod_table = "cod_freeboard";
			idname = "frid";
			break;
		case 3:
			cod_table = "cod_employment";
			idname = "empid";
			break;
		case 4:
			cod_table = "cod_schoolwork";
			idname = "swid";
			break;
		case 5:
			cod_table = "cod_schoolwork";
			idname = "swid";
			break;
		case 6:
			cod_table = "cod_extratips";
			idname = "tipid";
			break;
		case 7:
			cod_table = "cod_extratips";
			idname = "tipid";
			break;
		case 8:
			cod_table = "cod_employment";
			idname = "empid";
			break;
		}
		
		paramVO.setCod_table(cod_table);
		paramVO.setIdname(idname);
		
		return paramVO;
	}
	
	public List<AdminVO> findBoardTypes(AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();
		
		paramVO = checkTables(paramVO);
		
		result = adminDAO.findBoardTypes(paramVO);
		
		return result;
	}
	public List<AdminVO> findBoardTypeList(AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();
		
		result = adminDAO.findBoardTypeList(paramVO);
		
		return result;
	}
	public int addOrgFileData(OrgVO paramVO) {
		Integer result = 0;
		try {
			result = adminDAO.addOrgFileData(paramVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public void delOrg(OrgVO paramVO){
		try{
			adminDAO.delOrg(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int editMenu(AdminVO paramVO){
		int result = 0;
		
		paramVO = checkTables(paramVO);
		
		if(paramVO.getId() != null && paramVO.getId() != 0){
			result = adminDAO.editMenu(paramVO);
		}else{
			result = adminDAO.addMenu(paramVO);
		}
		
		return result;
	}
}
