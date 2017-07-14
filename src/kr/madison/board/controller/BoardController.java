package kr.madison.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.madison.board.service.BoardService;
import kr.madison.board.vo.BoardVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

//자유게시판
@Controller
@RequestMapping("/Board/*")
public class BoardController {
	
	final private int pageRow = 20;
	
	@Autowired
	BoardService boardService;

	@RequestMapping("/")
	public ModelAndView boardMain(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		
		int totalcount = boardService.findBoardTotalCnt(paramVO);
		
		Util.setPaging(paramVO, totalcount, pageRow);
		List<BoardVO> vo = boardService.findBoardList(paramVO);
		
		mav.addObject("boardList", vo);
		mav.addObject("totalCnt", totalcount);
		mav.setViewName("/board/board");
		return mav;
	}
	
	@RequestMapping("/BoardView")
	public ModelAndView boardView(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		BoardVO vo = boardService.findBoardContent(paramVO);
		List<BoardVO> replies = boardService.findBoardReply(paramVO);
		int repcount = boardService.getReplyCount(paramVO);
		
		if(vo != null){
			boardService.modBoardCount(paramVO);
		}
		
		mav.setViewName("/board/boardView");
		mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);
		return mav;
	}
	
	@RequestMapping("/BoardEdit")
	public ModelAndView boardEdit(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/boardEdit");
		return mav;
	}

	@RequestMapping
	@ResponseBody
	public List<BoardVO> findBoardList(BoardVO paramVO){
		List<BoardVO> result = new ArrayList<BoardVO>();
		result = boardService.findBoardList(paramVO);
		
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
	public int modBoardLikes(BoardVO paramVO){
		int result = boardService.modBoardLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modBoardDislikes(BoardVO paramVO){
		int result = boardService.modBoardDislikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modRepLikes(BoardVO paramVO){
		int result = boardService.modRepLikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modRepDislikes(BoardVO paramVO){
		int result = boardService.modRepDislikes(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public List<BoardVO> findBoardReply(BoardVO paramVO){
		List<BoardVO> result = boardService.findBoardReply(paramVO);
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int modBoardData(BoardVO paramVO){
		int result = boardService.modBoardData(paramVO);
		
		return result;
	}
	
}