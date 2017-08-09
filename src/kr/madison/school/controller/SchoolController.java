package kr.madison.school.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.madison.school.service.SchoolService;
import kr.madison.school.vo.SchoolVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//School

@Controller
@RequestMapping("/School/*")
public class SchoolController {

	final private int pageRow = 15;
	
	@Autowired
	SchoolService schoolService;
	
	public void setSchoolSerivce(SchoolService schoolService){
		this.schoolService = schoolService;
	}
	
	//족보
	@RequestMapping("/pastWork")
	public ModelAndView pastWork(@ModelAttribute("paramVO") SchoolVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		int totalcount = schoolService.findPastWorkTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		
		List<SchoolVO> vo = schoolService.findPastWorkList(paramVO);
		
		mav.addObject("pastWorkList", vo);
		mav.addObject("totalCnt",totalcount);
		mav.setViewName("/school/pastWork");
		
		return mav;
	}
	@RequestMapping("/pastWorkWrite")
	public ModelAndView writeEmployer(@ModelAttribute("paramVO") SchoolVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/school/pastWorkWrite");
		
		return mav;
	}
	@RequestMapping("/pastWorkView")
	public ModelAndView viewEmployer(@ModelAttribute("paramVO") SchoolVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		SchoolVO vo = schoolService.findPastWorkContent(paramVO);
		
		List<SchoolVO> replies = schoolService.findPastWorkReply(paramVO);
		
		if(vo!=null){
			schoolService.modPastWorkCount(paramVO);
		}
		mav.setViewName("/school/pastWorkView");
		mav.addObject("vo",vo);
		mav.addObject("reps", replies);
		
		return mav;
	}
	
	
	@RequestMapping
	@ResponseBody
	public int addPastWorkData(SchoolVO paramVO){
		int result = schoolService.addPastWorkData(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public int addPastWorkReply(SchoolVO paramVO){
		int result = schoolService.addPastWorkReply(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public int deletePastWork(SchoolVO paramVO){ 
		int result = schoolService.deletePastWork(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public SchoolVO findPastWorkContent(SchoolVO paramVO){
		SchoolVO result = schoolService.findPastWorkContent(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modPastWorkData(SchoolVO paramVO){
		int result = schoolService.modPastWorkData(paramVO);
		
		return result;
	}
	
	
	//학업게시판
	@RequestMapping("/education")
	public ModelAndView education(@ModelAttribute("paramVO") SchoolVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		int totalcount = schoolService.findEducationTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		
		List<SchoolVO> vo = schoolService.findEducationList(paramVO);
		
		mav.addObject("educationList", vo);
		mav.addObject("totalCnt",totalcount);
		mav.setViewName("/school/education");
		
		return mav;
	}
	@RequestMapping("/educationWrite")
	public ModelAndView educationWrite(@ModelAttribute("paramVO") SchoolVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/school/educationWrite");
		
		return mav;
	}
	@RequestMapping("/educationView")
	public ModelAndView educationView(@ModelAttribute("paramVO") SchoolVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		SchoolVO vo = schoolService.findEducationContent(paramVO);
		
		List<SchoolVO> replies = schoolService.findEducationReply(paramVO);
		
		if(vo!=null){
			schoolService.modEducationCount(paramVO);
		}
		mav.setViewName("/school/educationView");
		mav.addObject("vo",vo);
		mav.addObject("reps", replies);
		
		return mav;
	}
	
	
	@RequestMapping
	@ResponseBody
	public int addEducationData(SchoolVO paramVO){
		int result = schoolService.addEducationData(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public int addEducationReply(SchoolVO paramVO){
		int result = schoolService.addEducationReply(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public int deleteEducation(SchoolVO paramVO){ 
		int result = schoolService.deleteEducation(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public SchoolVO findEducationContent(SchoolVO paramVO){
		SchoolVO result = schoolService.findEducationContent(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modEducationData(SchoolVO paramVO){
		int result = schoolService.modEducationData(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modEducationLikes(SchoolVO paramVO){
		int result = schoolService.modEducationLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modEducationDislikes(SchoolVO paramVO){
		int result = schoolService.modEducationDislikes(paramVO);
		
		return result;
	}
}
