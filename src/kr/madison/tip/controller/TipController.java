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
	public String modFoodLikes(TipVO paramVO){
		int result = tipService.modFoodLikes(paramVO);
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
	}
	
	@RequestMapping
	@ResponseBody
	public String modFoodDislikes(TipVO paramVO){
		int result = tipService.modFoodDislikes(paramVO);
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
	}
	
	@RequestMapping
	@ResponseBody
	public String modRepLikes(TipVO paramVO){
		int result = tipService.modRepLikes(paramVO);
		
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
	}
	
	@RequestMapping
	@ResponseBody
	public String modRepDislikes(TipVO paramVO){
		int result = tipService.modRepDislikes(paramVO);
		
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
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
	
	@RequestMapping
	@ResponseBody
	public void delFoodBoardData(TipVO paramVO){
		tipService.delFoodBoardData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int modFoodBoardReply(TipVO paramVO){
		return tipService.modFoodBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public void delFoodBoardReply(TipVO paramVO){
		tipService.delFoodBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public TipVO findFoodBoardReplyData(TipVO paramVO){
		return tipService.findFoodBoardReplyData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public List<BoardVO> findFoodCommentList(TipVO paramVO){
		return tipService.findFoodCommentList(paramVO);
	}
	
//	@RequestMapping
//	@ResponseBody
//	public int getCommentCount(TipVO paramVO){
//		return tipService.getCommentCount(paramVO);
//	}
//	
	@RequestMapping
	@ResponseBody
	public int undoFoodBoardLikes(TipVO paramVO){
		return tipService.undoFoodBoardLikes(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int undoFoodBoardDislikes(TipVO paramVO){
		return tipService.undoFoodBoardDislikes(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoFoodBoardRepLikes(TipVO paramVO){
		return tipService.undoFoodBoardRepLikes(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoFoodBoardRepDislikes(TipVO paramVO){
		return tipService.undoFoodBoardRepDislikes(paramVO);
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
	public String modMarketLikes(TipVO paramVO){
		int result = tipService.modMarketLikes(paramVO);
		
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
	}
	
	@RequestMapping
	@ResponseBody
	public String modMarketDislikes(TipVO paramVO){
		int result = tipService.modMarketDislikes(paramVO);
		
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
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
	public String modMarketRepLikes(TipVO paramVO){
		int result = tipService.modMarketRepLikes(paramVO);
		
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
	}
	
	@RequestMapping
	@ResponseBody
	public String modMarketRepDislikes(TipVO paramVO){
		int result = tipService.modMarketRepDislikes(paramVO);
		
		String msg = "";
		if(result == 0){
			msg = "Fail";
		}else{
			msg = "Success";
		}
		
		return msg;
	}
	
	
	// 9/4
	@RequestMapping
	@ResponseBody
	public void delMarketBoardData(TipVO paramVO){
		tipService.delMarketBoardData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int modMarketBoardReply(TipVO paramVO){
		return tipService.modMarketBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public void delMarketBoardReply(TipVO paramVO){
		tipService.delMarketBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public TipVO findMarketBoardReplyData(TipVO paramVO){
		return tipService.findMarketBoardReplyData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public List<TipVO> findMarketCommentList(TipVO paramVO){
		return tipService.findMarketCommentList(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int getMarketCommentCount(TipVO paramVO){
		return tipService.getMarketCommentCount(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int undoMarketBoardLikes(TipVO paramVO){
		return tipService.undoMarketBoardLikes(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int undoMarketBoardDislikes(TipVO paramVO){
		return tipService.undoMarketBoardDislikes(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoMarketBoardRepLikes(TipVO paramVO){
		return tipService.undoMarketBoardRepLikes(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoMarketBoardRepDislikes(TipVO paramVO){
		return tipService.undoMarketBoardRepDislikes(paramVO);
	}
	
		
	
}
