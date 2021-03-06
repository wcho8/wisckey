package kr.madison.member.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
	
	@RequestMapping("/findID&PW")
	public ModelAndView findIDandPW(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findID&PW");
		
		return mav;
	}
	@RequestMapping
	@ResponseBody
	public Integer addMember(MemberVO paramVO){
		Integer result = 0;
		try{
			result = memberService.addNewMember(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public Integer chkId(MemberVO paramVO){
		Integer result = 0;
		try{
			result = memberService.chkId(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public Integer chkNickname(MemberVO paramVO){
		Integer result = 0;
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
		//memberService.memberEdit(paramVO);
		
		
		return mav;
	}

	//내가 쓴 글
	@RequestMapping("/findEachList")
	@ResponseBody
	public ModelAndView memberGeul(@ModelAttribute("paramVO") MemberVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/member/memberGeul");
		return null;
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
	
	@RequestMapping
	@ResponseBody
	public String forgotPassword(MemberVO paramVO){
		String result = "";
		String path = getServletContext().getRealPath("/WEB-INF/views/mailTemplate");
		try{
			result = memberService.forgotPassword(paramVO, path);
		}catch(Exception e){
			e.printStackTrace();
			result = "Unknown";
		}
		
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public int findPW(MemberVO paramVO){
		int result = memberService.findPW(paramVO);
		return result;
	}
	
	@RequestMapping
	@ResponseBody
	public MemberVO findID(MemberVO paramVO){
		MemberVO vo = memberService.findID(paramVO);
		return vo;
	}
	 

}
	
	
