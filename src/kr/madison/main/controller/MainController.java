package kr.madison.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.controller.CommonController;
import kr.madison.main.service.MainService;
import kr.madison.main.vo.MainVO;
import kr.madison.member.vo.MemberVO;
import kr.madison.school.vo.SchoolVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/*")
public class MainController extends CommonController{
	
	final private int pageRow = 15;
	
	@Autowired
	MainService mainService;

	@RequestMapping("/")
	public ModelAndView Index() throws Exception{
		ModelAndView mav = null;
		
		mav = new ModelAndView();
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	@RequestMapping("/NeedLogin")
	public ModelAndView needLogin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common/needLogin");
		
		return mav;
	}
	

	//FAQ
	@RequestMapping("/FAQ")
	public ModelAndView FAQ(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/FAQ");
		
		return mav;
	}
	
	//Q&A
	@RequestMapping("/Q&A")
	public ModelAndView QnA(@ModelAttribute("paramVO") MainVO paramVO, HttpServletRequest res ){
		ModelAndView mav = new ModelAndView();
		
		int totalcount = mainService.findQnABoardTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		List<MainVO> vo = mainService.findQnABoardList(paramVO);
		
		mav.addObject("QnAList", vo);
		mav.addObject("totalcount", totalcount);
		
		mav.setViewName("/main/Q&A");
		
		return mav;
	}
	
	@RequestMapping("/Q&AWrite")
	public ModelAndView QnAWrite(@ModelAttribute("paramVO") MainVO paramVO, HttpServletRequest res ){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/Q&AWrite"); 
		
		return mav;
	}
	
	@RequestMapping("/Q&AView")
	public ModelAndView QnAView(@ModelAttribute("paramVO") MainVO paramVO, HttpServletRequest res ){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/Q&AView");
		
		MainVO vo = mainService.findQnABoardContent(paramVO);
		
		List<MainVO> replies = mainService.findQnABoardReply(paramVO);
		
		if(vo!=null){
			mainService.modQnABoardCount(paramVO);
		}
		
		mav.addObject("reps", replies);
		mav.addObject("vo", vo);
		return mav;
	}
	@RequestMapping
	@ResponseBody
	public int addQnABoardReply(MainVO paramVO){
		int result = mainService.addQnABoardReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int addQnABoardData(MainVO paramVO){
		int result = mainService.addQnABoardData(paramVO);
		System.out.println("addQnABoardData in Controller");
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int deleteQnABoard(MainVO paramVO){
		int result = mainService.deleteQnABoard(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modQnABoardData(MainVO paramVO){
		int result = mainService.modQnABoardContent(paramVO);
		
		return result;
	}
	@RequestMapping
	@ResponseBody
	public MainVO findQnABoardContent(MainVO paramVO){
		MainVO result = mainService.findQnABoardContent(paramVO);
		
		return result;
	}
	
	@RequestMapping("/findTopBoardList")
	@ResponseBody
	public List<BoardVO> findTopBoardList(MainVO paramVO){
		List<BoardVO> result = new ArrayList<BoardVO>();
		
		result = mainService.findTopBoardList(paramVO);
		return result;
	}
	
	@RequestMapping("/findRecentNoticeList")
	@ResponseBody
	public List<AboutVO> findRecentNoticeList(MainVO paramVO){
		List<AboutVO> result = new ArrayList<AboutVO>();
		
		result = mainService.findRecentNoticeList(paramVO);
		return result;
	}
	
	@RequestMapping("/findEmployerList")
	@ResponseBody
	public List<CareerVO> findEmployerList(MainVO paramVO){
		List<CareerVO> result = new ArrayList<CareerVO>();
		
		result = mainService.findEmployerList(paramVO);
		return result;
	}
	
	@RequestMapping("/findEducationList")
	@ResponseBody
	public List<SchoolVO> findEducationList(MainVO paramVO){
		List<SchoolVO> result = new ArrayList<SchoolVO>();
		
		result = mainService.findEducationList(paramVO);
		return result;
	}
	
}
