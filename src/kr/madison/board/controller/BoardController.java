package kr.madison.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.madison.board.service.BoardService;
import kr.madison.board.vo.BoardVO;
import kr.madison.common.vo.GridVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//자유게시판
@Controller
@RequestMapping("/Board/*")
public class BoardController {
	
	final private int pageRow = 15;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/")
	public ModelAndView boardMain(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		
		int totalcnt = boardService.findBoardTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcnt, pageRow);
		List<BoardVO> vo = boardService.findBoardList(paramVO);
		List<BoardVO> frtypes = boardService.getFrtypes(paramVO);
		
		mav.addObject("boardList", vo);
		mav.addObject("totalCnt", totalcnt);
		mav.addObject("frtypes", frtypes);
		mav.setViewName("/board/board");
		return mav;
	}
	
	@RequestMapping("/BoardView")
	public ModelAndView boardView(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		BoardVO vo = boardService.findBoardContent(paramVO);
		
		paramVO.setPtypeid(vo.getPtypeid());
		
		List<BoardVO> replies = boardService.findBoardReply(paramVO);
		int repcount = boardService.getReplyCount(paramVO);
		
		if(vo != null){
			boardService.modBoardCount(paramVO);
		}
		
		mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);
		mav.setViewName("/board/boardView");
		return mav;
	}
	
	@RequestMapping("/BoardEdit")
	public ModelAndView boardEdit(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		paramVO.setTypeid(1);
		List<BoardVO> frtypes = boardService.getFrtypes(paramVO);
		try{
		}catch(Exception e){
			
		}
		
		mav.setViewName("/board/boardEdit");
		mav.addObject("frtypes", frtypes);
		
		return mav;
	}

	@RequestMapping
	@ResponseBody
	public GridVO findBoardList(BoardVO paramVO){
		GridVO result = new GridVO();
		try{
			result.bindPaging(boardService.findBoardTotalCnt(paramVO), paramVO);
			result.bindData(boardService.findBoardList(paramVO));
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public BoardVO findBoardContent(BoardVO paramVO){
		BoardVO vo = boardService.findBoardContent(paramVO);
		
		return vo;
	}
	
	@RequestMapping
	@ResponseBody
	public int addBoardData(BoardVO paramVO){
		int result = boardService.addBoardData(paramVO);
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int addBoardReply(BoardVO paramVO){
		int result = boardService.addBoardReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modBoardCount(BoardVO paramVO){
		int result = boardService.modBoardCount(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public String modBoardLikes(BoardVO paramVO){
		int result = boardService.modBoardLikes(paramVO);
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
	public String modBoardDislikes(BoardVO paramVO){
		int result = boardService.modBoardDislikes(paramVO);
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
	public String modRepLikes(BoardVO paramVO){
		int result = boardService.modRepLikes(paramVO);
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
	public String modRepDislikes(BoardVO paramVO){
		int result = boardService.modRepDislikes(paramVO);
		
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
	public List<BoardVO> findBoardReply(BoardVO paramVO){
		List<BoardVO> result = boardService.findBoardReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<BoardVO> getFrTypes(BoardVO paramVO){
		List<BoardVO> result = boardService.getFrtypes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modBoardData(BoardVO paramVO){
		int result = boardService.modBoardData(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public void delBoardData(BoardVO paramVO){
		boardService.delBoardData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int modBoardReply(BoardVO paramVO){
		return boardService.modBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public void delBoardReply(BoardVO paramVO){
		boardService.delBoardReply(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public BoardVO findBoardReplyData(BoardVO paramVO){
		return boardService.findBoardReplyData(paramVO);
	}
}
