package kr.madison.admin.controller;

import java.util.ArrayList;
import java.util.List;

import kr.madison.admin.service.AdminService;
import kr.madison.admin.vo.AdminVO;
import kr.madison.common.controller.CommonController;
import kr.madison.common.vo.CommonVO;
import kr.madison.common.vo.GridVO;
import kr.madison.org.vo.OrgVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Admin/*")
public class AdminController extends CommonController{
	@Autowired
	public AdminService adminService;
	
	@RequestMapping("/ManageOrg")
	public ModelAndView manageOrg(AdminVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/manageOrg");
		
		return mav;
	}
	
	@RequestMapping("/ManageMenu")
	public ModelAndView manageMenu(AdminVO paramVO){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/manageMenu");
		
		return mav;
	}
	
	@RequestMapping("/FindBoardType/{btype}")
	@ResponseBody
	public List<AdminVO> findBoardType(@PathVariable("btype") int btype, AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();
		
		result = adminService.findBoardType(btype, paramVO);
		
		return result;
	}
	
	@RequestMapping("/findOrgList")
	@ResponseBody
	public GridVO findOrgList(AdminVO paramVO){
		GridVO grid = new GridVO();
		List<OrgVO> result = adminService.findOrgList(paramVO);
		int recordCount = 20;
		grid.bindPaging(recordCount, paramVO);
		grid.bindData(result);
		
		return grid;
	}
}
