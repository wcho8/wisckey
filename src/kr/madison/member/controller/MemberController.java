package kr.madison.member.controller;
 
import kr.madison.common.controller.CommonController;
import kr.madison.member.service.MemberService;
import kr.madison.member.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/Member/*")
@Controller
public class MemberController extends CommonController{
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	public ModelAndView memberJoin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoin");
		
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public int addMember(MemberVO paramVO){
		int result = 0;
		try{
			result = memberService.addNewMember(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int chkId(MemberVO paramVO){
		int result = 0;
		try{
			result = memberService.chkId(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int chkNickname(MemberVO paramVO){
		int result = 0;
		try{
			result = memberService.chkNickname(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public MemberVO searchById(MemberVO paramVO){
		MemberVO result = new MemberVO();
		try{
			result = memberService.searchById(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
}
