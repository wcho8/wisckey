package kr.madison.career.controller;

import kr.madison.career.service.CareerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/Career/*")
public class CareerController {

	@Autowired
	CareerService careerService;
	
	public void setCareerService(CareerService careerService){
		this.careerService = careerService;
	}
	
	@RequestMapping("/employer")
	public ModelAndView employer(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/career/employer");
		
		return mav;
	}
}
