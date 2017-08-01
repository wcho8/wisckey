package kr.madison.member.controller;
 
import javax.servlet.http.HttpServletRequest;

import kr.madison.common.controller.CommonController;
import kr.madison.member.service.MemberService;
import kr.madison.member.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	//개인정보 보기
	@RequestMapping("/memberView")
	public ModelAndView memberView(@ModelAttribute("paramVO") MemberVO paramVO,HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = memberService.findMemberData(paramVO);
		mav.addObject("memberInfo", vo);
		mav.setViewName("/member/memberView");
		
		return mav;
	}
	//개인정보 수정
	@RequestMapping("/memberEdit")
	public ModelAndView memberEdit(@ModelAttribute("paramVO") MemberVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberEdit");
	//	int result = memberService.memberEdit(paramVO);
		return mav;
	}
	
	
	@RequestMapping
	@ResponseBody
	public MemberVO findMemberData(MemberVO paramVO){
		MemberVO vo = memberService.findMemberData(paramVO);
		return vo;
	}
	
	@RequestMapping
	@ResponseBody
	public int modMemberData(MemberVO paramVO){
		int result = memberService.memberEdit(paramVO);
		return result;
	}
	@RequestMapping
	@ResponseBody
	public int modPasswdEdit(MemberVO paramVO){
		int result = memberService.modPasswdEdit(paramVO);
		return result;
	}
	
	
}
