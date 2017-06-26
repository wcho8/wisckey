package kr.madison.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.madison.board.service.BoardService;
import kr.madison.board.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//자유게시판
@Controller
@RequestMapping("/Board/*")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@RequestMapping("/")
	public ModelAndView boardMain(@ModelAttribute("paramVO") BoardVO paramVO){
		ModelAndView mav = new ModelAndView();
		List<BoardVO> vo = boardService.findBoardList(paramVO);
		mav.addObject("boardList", vo);
		mav.setViewName("/board/board");
		return mav;
	}
	
	@RequestMapping("/BoardView")
	public ModelAndView boardView(@ModelAttribute("paramVO") BoardVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		BoardVO vo = boardService.findBoardContent(paramVO);
		
		mav.setViewName("/board/boardView");
		mav.addObject("vo", vo);
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
}
