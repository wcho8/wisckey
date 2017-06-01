package kr.madison.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//자유게시판
@Controller
@RequestMapping("/Board/*")
public class BoardController {

	@RequestMapping("/")
	public ModelAndView boardMain(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/board");
		return mav;
	}
	
}
