package kr.madison.about.controller;

import java.util.List;

import kr.madison.about.service.AboutService;
import kr.madison.about.vo.AboutVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


//About
@Controller
@RequestMapping("/About/*")
public class AboutController {
	
	@Autowired
	AboutService aboutService;
	
	public void setAboutService(AboutService aboutService) {
		this.aboutService = aboutService;
	}
	
	@RequestMapping("/introWisckey")
	public ModelAndView introWisckey(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/about/introWisckey");
		return mav;
	}
	
	@RequestMapping("/introUniv")
	public ModelAndView introUniv(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/about/introUniv");
		return mav;
	}
	
	@RequestMapping("/notice")
	public ModelAndView notice(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/about/notice");
		return mav;
	}
	
	@RequestMapping("/otherSites")
	public ModelAndView otherSites(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/about/otherSites");
		return mav;
	}
	
	@RequestMapping("/writeForm")
	public String writeForm(){
		return "/about/writeForm";
	}
	
	@RequestMapping("/viewNotice")
	public ModelAndView viewNotice(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/about/viewNotice");
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public int addNewNotice(AboutVO paramVO){
		int result = 0;
		try{
			result = aboutService.addNewNotice(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<AboutVO> listNotice(AboutVO paramVO){
		List<AboutVO> list = null;
		try{
			list = aboutService.listNotice(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	
}
