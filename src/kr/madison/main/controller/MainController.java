package kr.madison.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MainController {

	@RequestMapping("/")
	public ModelAndView Index() throws Exception{
		ModelAndView mav = null;
		
		mav = new ModelAndView();
		mav.setViewName("/main/index");
		
		return mav;
	}
}
