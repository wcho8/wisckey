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
	public void sendMail(MemberVO paramVO) throws AddressException, MessagingException{
		String from = "no-reply@uwisckey.com";
		String to = "wjcho@infrasoft.co.kr";
		
		String body= "This is the test mail from wisckey.";
		String subject="Test Email";
		
		String SMTP_USERNAME="AKIAJMY2ALJAMTFR5MTA";
		String SMTP_PASSWORD="AibEIGym7dmJU+KB7Ak2iQJEd7Nfu3NFBFn1AXceEY8q";
		
		String host = "email-smtp.us-west-2.amazonaws.com";
		int port = 25;
		
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtps");
		props.put("mail.smtp.port", port);
		// Set properties indicating that we want to use STARTTLS to encrypt the connection.
    	// The SMTP session will begin on an unencrypted connection, and then the client
        // will issue a STARTTLS command to upgrade to an encrypted connection.
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.starttls.required", "true");

        // Create a Session object to represent a mail session with the specified properties. 
    	Session session = Session.getDefaultInstance(props);

        // Create a message with the specified information. 
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject(subject);
        msg.setContent(body,"text/plain");
            
        // Create a transport.        
        Transport transport = session.getTransport();
                    
        // Send the message.
        try
        {
            System.out.println("Attempting to send an email through the Amazon SES SMTP interface...");
            
            // Connect to Amazon SES using the SMTP username and password you specified above.
            transport.connect(host, SMTP_USERNAME, SMTP_PASSWORD);
        	
            // Send the email.
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Email sent!");
        }
        catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
        }
        finally
        {
            // Close and terminate the connection.
            transport.close();        	
        }
	}
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
	
	
