package kr.madison.tip.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.madison.board.vo.BoardVO;
import kr.madison.tip.service.TipService;
import kr.madison.tip.vo.TipVO;
import kr.madison.util.Util;

@Controller
@RequestMapping("/Tip/*")
public class TipController {
	
	final private int pageRow = 15;
	
	@Autowired
	TipService tipService;
	
	@RequestMapping("/food")	// mapping url
	public ModelAndView tipMain(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		int totalcnt = tipService.findFoodTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcnt, pageRow);
		List<TipVO> vo = tipService.findFoodList(paramVO);
		
		mav.addObject("foodList", vo);
		mav.addObject("totalCnt", totalcnt);
		
		
		mav.setViewName("/tip/food");	// directory to .jsp file
		return mav;
		
	}
	
	@RequestMapping("/foodBoardWrite")
	public ModelAndView foodBoardWrite(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/tip/foodBoardWrite");	// 글쓰기
		
		return mav;
	}
	
	@RequestMapping("/foodBoardView")
	public ModelAndView foodBoardView(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		
		TipVO vo = tipService.findFoodContent(paramVO);
		List<TipVO> replies = tipService.findFoodReply(paramVO);
		int repcount = tipService.getReplyCount(paramVO);
		
		if(vo != null){
			tipService.modFoodCount(paramVO);
		}
		
		
		mav.setViewName("/tip/foodBoardView");	// 글쓰기 
		
		mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);
		
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public TipVO findFoodContent(TipVO paramVO){
		TipVO vo = tipService.findFoodContent(paramVO);
		
		return vo;
	}
	
	@RequestMapping
	@ResponseBody
	public int addFoodData(TipVO paramVO) {
		int result = tipService.addFoodData(paramVO);
		return result;
	}
	

	@RequestMapping
	@ResponseBody
	public int addFoodReply(TipVO paramVO){
		int result = tipService.addFoodReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modFoodCount(TipVO paramVO){
		int result = tipService.modFoodCount(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modFoodLikes(TipVO paramVO){
		int result = tipService.modFoodLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modFoodDislikes(TipVO paramVO){
		int result = tipService.modFoodDislikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modRepLikes(TipVO paramVO){
		int result = tipService.modRepLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modRepDislikes(TipVO paramVO){
		int result = tipService.modRepDislikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<TipVO> findFoodReply(TipVO paramVO){
		List<TipVO> result = tipService.findFoodReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modFoodData(TipVO paramVO){
		int result = tipService.modFoodData(paramVO);
		
		return result;
	}
	

}
