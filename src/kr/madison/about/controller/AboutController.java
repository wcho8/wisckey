package kr.madison.about.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.madison.about.service.AboutService;
import kr.madison.about.vo.AboutVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


//About
@Controller
@RequestMapping("/About/*")
public class AboutController {
	
	final private int pageRow=10;
	
	@Autowired
	AboutService aboutService;
	
	public void setAboutService(AboutService aboutService) {
		this.aboutService = aboutService;
	}
	
	//위스키 소개 탭
	@RequestMapping("/introWisckey")
	public ModelAndView introWisckey(@ModelAttribute("paramVO") AboutVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		List<AboutVO> vo = aboutService.listFourNotice(paramVO);
		
		mav.addObject("aboutList", vo);
		mav.setViewName("/about/introWisckey");
		return mav;
	}
	
	//학교소개 탭
	@RequestMapping("/introUniv")
	public ModelAndView introUniv(@ModelAttribute("paramVO") AboutVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		List<AboutVO> vo = aboutService.listFourNotice(paramVO);
		
		mav.addObject("aboutList", vo);
		mav.setViewName("/about/introUniv");
		return mav;
	}
	
	//주요사이트 탭
	@RequestMapping("/otherSites")
	public ModelAndView otherSites(@ModelAttribute("paramVO") AboutVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		List<AboutVO> vo = aboutService.listFourNotice(paramVO);
		
		mav.addObject("aboutList", vo);
		mav.setViewName("/about/otherSites");
		return mav;
	}
	
	//여기서부터 공지사항 탭
	@RequestMapping("/")
	public ModelAndView notice(@ModelAttribute("paramVO") AboutVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		int totalcount = aboutService.findNoticeTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		
		List<AboutVO> vo = aboutService.listNotice(paramVO);
		
		mav.addObject("aboutList", vo);
		mav.addObject("totalCnt", totalcount);
		mav.setViewName("/about/notice");
		return mav;
	}
	
	@RequestMapping("/writeForm")
	public ModelAndView writeForm(@ModelAttribute("paramVO") AboutVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("/about/writeForm");
		return mav;
	}
	
	@RequestMapping("/viewNotice")
	public ModelAndView viewNotice(@ModelAttribute("paramVO") AboutVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		AboutVO vo = aboutService.findAboutContent(paramVO);
		
		if(vo!=null){
			aboutService.modNoticeCount(paramVO);
		}
		mav.addObject("vo", vo);
		mav.setViewName("/about/viewNotice");
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public int addNewNotice(AboutVO paramVO){
		int result = aboutService.addNewNotice(paramVO);
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<AboutVO> listNotice(AboutVO paramVO){
		List<AboutVO> list = new ArrayList<AboutVO>();
		list= aboutService.listNotice(paramVO);
		return list;
	}
	
	@RequestMapping
	@ResponseBody
	public AboutVO findAboutContent(AboutVO paramVO){
		AboutVO vo = aboutService.findAboutContent(paramVO);
		
		return vo;
	}
	
	@RequestMapping
	@ResponseBody
	public int deleteNotice(AboutVO paramVO){
		int result = aboutService.noticeDelete(paramVO);
		
		return result;
	}
	
	
	
}
