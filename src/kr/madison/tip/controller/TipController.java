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
		
		// 8/17
		paramVO.setTypeid(6);
		List<TipVO> tiptypes = tipService.getFrtypes(paramVO);
		try{
		}catch(Exception e){
			
		}
		
		
		mav.setViewName("/tip/foodBoardWrite");	// 글쓰기
		
		mav.addObject("tiptypes", tiptypes);

		
		return mav;
	}
	
	@RequestMapping("/foodBoardView")
	public ModelAndView foodBoardView(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		TipVO vo = tipService.findFoodContent(paramVO);
		
		// 8/17
		//paramVO.setPtypeid(vo.getPtypeid());
		//paramVO.setPtypeid(vo.getPtypeid());
		
		
		List<TipVO> replies = tipService.findFoodReply(paramVO);
		int repcount = tipService.getReplyCount(paramVO);
		
		if(vo != null){
			tipService.modFoodCount(paramVO);
		}
		
		
		
		mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);
		mav.setViewName("/tip/foodBoardView");	// 글쓰기 

		
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
	
	@RequestMapping("/market")	// mapping url
	public ModelAndView tipMarketMain(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		int totalcnt = tipService.findMarketTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcnt, pageRow);
		List<TipVO> vo = tipService.findMarketList(paramVO);
		
		mav.addObject("marketList", vo);
		mav.addObject("totalCnt", totalcnt);
		
		
		mav.setViewName("/tip/market");	// directory to .jsp file
		return mav;
		
	}
	
	@RequestMapping("/marketBoardWrite")
	public ModelAndView marketBoardWrite(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		paramVO.setTypeid(7);
		List<TipVO> markettypes = tipService.getMarketFrtypes(paramVO);
		try{
			
		}catch(Exception e) {
			
		}
		mav.setViewName("/tip/marketBoardWrite");	// 글쓰기
		mav.addObject("markettypes", markettypes);
		return mav;
	}
	
	@RequestMapping("/marketBoardView")
	public ModelAndView marketBoardView(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		
		TipVO vo = tipService.findMarketContent(paramVO);
		
		paramVO.setPtypeid(vo.getPtypeid());
		
		List<TipVO> replies = tipService.findMarketReply(paramVO);
		int repcount = tipService.getMarketReplyCount(paramVO);
		
		if(vo != null){
			tipService.modMarketCount(paramVO);
		}
		
		
		mav.setViewName("/tip/marketBoardView");	// 글쓰기 
		
		mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);
		
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public TipVO findMarketContent(TipVO paramVO){
		TipVO vo = tipService.findMarketContent(paramVO);
		
		return vo;
	}
	
	@RequestMapping
	@ResponseBody
	public int addMarketData(TipVO paramVO) {
		int result = tipService.addMarketData(paramVO);
		return result;
	}
	

	@RequestMapping
	@ResponseBody
	public int addMarketReply(TipVO paramVO){
		int result = tipService.addMarketReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modMarketCount(TipVO paramVO){
		int result = tipService.modMarketCount(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modMarketLikes(TipVO paramVO){
		int result = tipService.modMarketLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modMarketDislikes(TipVO paramVO){
		int result = tipService.modMarketDislikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<TipVO> findMarketReply(TipVO paramVO){
		List<TipVO> result = tipService.findMarketReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modMarketData(TipVO paramVO){
		int result = tipService.modMarketData(paramVO);
		
		return result;
	}

	@RequestMapping
	@ResponseBody
	public int modMarketRepLikes(TipVO paramVO){
		int result = tipService.modMarketRepLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modMarketRepDislikes(TipVO paramVO){
		int result = tipService.modMarketRepDislikes(paramVO);
		
		return result;
	}
}
