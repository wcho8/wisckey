package kr.madison.career.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.madison.career.service.CareerService;
import kr.madison.career.vo.CareerVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Career/*")
public class CareerController {

	final private int pageRow =10;
	
	@Autowired
	CareerService careerService;
	
	public void setCareerService(CareerService careerService){
		this.careerService = careerService;
	}
	
	//취업공고
	@RequestMapping("/")
	public ModelAndView employer(@ModelAttribute("paramVO") CareerVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		int totalcount = careerService.findEmployerTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		
		List<CareerVO> vo = careerService.findCareerList(paramVO);
	
		mav.addObject("careerList", vo);
		mav.addObject("totalCnt", totalcount);
		mav.setViewName("/career/employer");
		
		return mav;
	}
	
	//취업공고 글쓰기
	@RequestMapping("/writeEmployer")
	public ModelAndView writeEmployer(@ModelAttribute("paramVO") CareerVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/career/writeEmployer");
		
		return mav;
	}
	//취업공고 보기
	@RequestMapping("/viewEmployer")
	public ModelAndView viewEmployer(@ModelAttribute("paramVO") CareerVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		CareerVO vo = careerService.findEmployerContent(paramVO);
		
		List<CareerVO> replies = careerService.findEmployerReply(paramVO);
		
		if(vo!=null){
			careerService.modEmployerCount(paramVO);
		}
		mav.setViewName("/career/viewEmployer");
		mav.addObject("vo",vo);
		mav.addObject("reps", replies);
		
		return mav;
	}

	@RequestMapping
	@ResponseBody
	public int addEmployerData(CareerVO paramVO){
		int result = careerService.addEmployerData(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int addEmployerReply(CareerVO paramVO){
		int result = careerService.addEmployerReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int deleteEmployer(CareerVO paramVO){
		int result = careerService.deleteEmployer(paramVO);
		
		return result;
	}
	
	/*
	 * 
	 * 여기서부턴 취업게시판!!!!!!!
	 */

	//취업게시판
	@RequestMapping("/employBoard")
	public ModelAndView employBoard(@ModelAttribute("paramVO") CareerVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		int totalcount = careerService.findEmployBoardTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		List<CareerVO> vo = careerService.findEmployBoardList(paramVO);
		
		mav.addObject("boardList", vo);
		mav.addObject("totalcount", totalcount);
		mav.setViewName("/career/employBoard");
		
		return mav;
	}

	@RequestMapping("/employBoardWrite")
	public ModelAndView employBoardWrite(@ModelAttribute("paramVO") CareerVO paramVO, HttpServletRequest res) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/career/employBoardWrite");
		return mav;
	}
	@RequestMapping("/employBoardView")
	public ModelAndView employBoardView(@ModelAttribute("paramVO") CareerVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		CareerVO vo = careerService.findEmployBoardContent(paramVO);
		
		List<CareerVO> replies = careerService.findBoardReply(paramVO);
		
		if(vo!=null){
			careerService.modBoardCount(paramVO);
		}
		
		mav.addObject("reps", replies);
		mav.addObject("vo", vo);
		mav.setViewName("/career/employBoardView");
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public int addEmployBoardData(CareerVO paramVO){
		int result = careerService.addEmployBoardData(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int addEmployBoardReply(CareerVO paramVO){
		int result = careerService.addEmployBoardReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int deleteEmployBoard(CareerVO paramVO){
		int result = careerService.deleteEmployBoard(paramVO);
		
		return result;
	}
}
