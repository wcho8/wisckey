package kr.madison.admin.controller;

import java.util.List;

import kr.madison.admin.service.AdminService;
import kr.madison.admin.vo.AdminVO;
import kr.madison.common.controller.CommonController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
