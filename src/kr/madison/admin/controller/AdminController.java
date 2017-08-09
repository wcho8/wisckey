package kr.madison.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.madison.admin.service.AdminService;
import kr.madison.admin.vo.AdminVO;
import kr.madison.common.controller.CommonController;
import kr.madison.org.vo.OrgVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		List<AdminVO> boardtype = new ArrayList<AdminVO>();
		boardtype = adminService.findBoardTypeList(paramVO);
		
		mav.addObject("boardtypes", boardtype);
		mav.setViewName("admin/manageMenu");
		return mav;
	}
	
	@RequestMapping("/MyOrg")
	public ModelAndView myOrg(AdminVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/myOrg");
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public List<AdminVO> findBoardTypeList(AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();
		
		result = adminService.findBoardTypeList(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<AdminVO> findBoardTypes(AdminVO paramVO){
		List<AdminVO> result = new ArrayList<AdminVO>();

		result = adminService.findBoardTypes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public String addOrgFileData(OrgVO paramVO, HttpServletResponse response, @RequestParam("attach_file")MultipartFile file) {
		String Filename = null;
		byte[] fileData = null;
		String fileType = null;
		long fileSize = 0;
		String result = "Fail";
		String result2 = "FileSizeFail";
		
		MultipartFile mpFile = file;
		if (!mpFile.isEmpty()) {
			Filename = mpFile.getOriginalFilename();
			fileType = mpFile.getContentType();
			try {
				fileData = mpFile.getBytes();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			fileSize = mpFile.getSize();
			if (fileSize > 10485760 ) {
				return result2;
			}
			
			paramVO.setFileContent(fileData);
			int isUpload = adminService.addOrgFileData(paramVO);
			
			if (isUpload > 0) {
				result = "Success";
			} else {
				result = "Fail";
			}
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public void delOrg(OrgVO paramVO){
		adminService.delOrg(paramVO);
	}
}
