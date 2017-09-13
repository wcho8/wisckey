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
	
	@RequestMapping("/tips")
	public ModelAndView tips(@ModelAttribute("paramVO")TipVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		int totalcnt = tipService.findTipsTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcnt, pageRow);
		List<TipVO> vo = tipService.findTipsList(paramVO);
		
		mav.addObject("tipsList", vo);
		mav.addObject("totalCnt", totalcnt);	
		mav.setViewName("tip/tips");
		
		return mav;
	}
	
	@RequestMapping("/tipsBoardWrite")
	public ModelAndView tipsBoardWrite(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		List<TipVO> tiptypes = tipService.getFrtypes(paramVO);
		
		mav.setViewName("tip/tipsBoardWrite");	// 글쓰기
		
		mav.addObject("tiptypes", tiptypes);

		
		return mav;
	}
	
	@RequestMapping("/tipsBoardView")
	public ModelAndView tipsBoardView(@ModelAttribute("paramVO") TipVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		TipVO vo = tipService.findTipsContent(paramVO);
		
		List<TipVO> replies = tipService.findTipsReply(paramVO);
		int repcount = tipService.getReplyCount(paramVO);
		
		if(vo != null){
			tipService.modTipsCount(paramVO);
		}
		
		mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);
		mav.setViewName("tip/tipsBoardView");	// 글쓰기 

		
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public TipVO findTipsContent(TipVO paramVO){
		TipVO vo = tipService.findTipsContent(paramVO);
		
		return vo;
	}
	@RequestMapping
	@ResponseBody
	public int addTipsData(TipVO paramVO) {
		int result = tipService.addTipsData(paramVO);
		return result;
	}
	

	@RequestMapping
	@ResponseBody
	public int addTipsReply(TipVO paramVO){
		int result = tipService.addTipsReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modTipsCount(TipVO paramVO){
		int result = tipService.modTipsCount(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public String modTipsLikes(TipVO paramVO){
		int result = tipService.modTipsLikes(paramVO);
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
	public String modTipsDislikes(TipVO paramVO){
		int result = tipService.modTipsDislikes(paramVO);
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
	public List<TipVO> findTipsReply(TipVO paramVO){
		List<TipVO> result = tipService.findTipsReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modTipsData(TipVO paramVO){
		int result = tipService.modTipsData(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public void delTipsBoardData(TipVO paramVO){
		tipService.delTipsBoardData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int modTipsBoardReply(TipVO paramVO){
		return tipService.modTipsBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public void delTipsBoardReply(TipVO paramVO){
		tipService.delTipsBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public TipVO findTipsBoardReplyData(TipVO paramVO){
		return tipService.findTipsBoardReplyData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public List<BoardVO> findTipsCommentList(TipVO paramVO){
		return tipService.findTipsCommentList(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoTipsBoardLikes(TipVO paramVO){
		return tipService.undoTipsBoardLikes(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int undoTipsBoardDislikes(TipVO paramVO){
		return tipService.undoTipsBoardDislikes(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoTipsBoardRepLikes(TipVO paramVO){
		return tipService.undoTipsBoardRepLikes(paramVO);
	}
	@RequestMapping
	@ResponseBody
	public int undoTipsBoardRepDislikes(TipVO paramVO){
		return tipService.undoTipsBoardRepDislikes(paramVO);
	}
	
}
