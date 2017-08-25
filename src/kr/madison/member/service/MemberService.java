package kr.madison.member.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;
import kr.madison.member.dao.MemberDAO;
import kr.madison.member.vo.MemberVO;
import kr.madison.util.Util;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService extends CommonService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	protected SessionVO session;
	
	public int addNewMember(MemberVO paramVO){
		int result = 0;
		if(paramVO.getBirthdate() == null || paramVO.getBirthdate().equals("")){
			paramVO.setBirthdate(null);
		}
		try{
			paramVO.setPasswd(Util.encryptSHA256(paramVO.getPasswd()));
			
			result = memberDAO.addNewMember(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public Integer chkId(MemberVO paramVO) {
		Integer result = 0;
		try{
			result = memberDAO.chkId(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public Integer chkNickname(MemberVO paramVO) {
		Integer result = 0;
		try{
			result = memberDAO.chkNickname(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public MemberVO findMemberData(MemberVO paramVO) {
		paramVO.setUserno(session.getUserno());
		MemberVO result = memberDAO.findMemberData(paramVO);
		return result;
	}

	public int memberEdit(MemberVO paramVO) {
		paramVO.setUserno(session.getUserno());
		memberDAO.memberEdit(paramVO);
		return paramVO.getUserno();
		
	}

	public int modPasswdEdit(MemberVO paramVO) {
		paramVO.setUserno(session.getUserno());
		try{
			paramVO.setPasswd(Util.encryptSHA256(paramVO.getPasswd()));
		}catch(Exception e){
			e.printStackTrace();
		}
		int result = memberDAO.modPasswdEdit(paramVO);
		
		return result;
	}
	
	public MemberVO searchById(MemberVO paramVO) {
		MemberVO result = new MemberVO();
		try{
			result = memberDAO.searchById(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public int findPW(MemberVO paramVO) {
		int result = 0;
		
		try{
			paramVO.setPasswd(Util.encryptSHA256(paramVO.getPasswd()));

			String pw = paramVO.getPasswd();
			MemberVO vo = memberDAO.findPW(paramVO);
			
			if(pw.equals(vo.getPasswd()) || Util.encryptSHA256(vo.getPasswd()).equals(pw)){
				result = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public MemberVO findID(MemberVO paramVO) {
		paramVO.setKorname(paramVO.getKorname());
		MemberVO vo = memberDAO.findID(paramVO);
		if(vo == null){
			return null;
		}
		
		return vo;
	}
	
	public String forgotPassword(MemberVO paramVO) throws Exception{
		MemberVO vo = memberDAO.forgotPassword(paramVO);
		String result = "";
		String newPasswd = "";
		int length = 6 + (int)(Math.random()*14); //비밀번호 길이: min 6 max 20
		if(vo.getUserno() != null && vo.getUserno() != 0){
			newPasswd = RandomStringUtils.randomAlphanumeric(length);
			vo.setPasswd(Util.encryptSHA256(newPasswd));
			memberDAO.modPasswdEdit(vo); 
			vo.setPasswd(newPasswd);
			result = sendMail(vo);
		}
		
		return result;
	}
	
	public String sendMail(MemberVO paramVO) throws AddressException, MessagingException{
		String result = "";
		String from = "uwwisckey@gmail.com";
		String to = paramVO.getEmail();
		
		String subject="[WISCKEY]임시 비밀번호 발급";
		String body= "임시 비밀번호 발송입니다.";
		body += "<br/>비밀번호: " + paramVO.getPasswd();
		body += "<div style='font-size:15px;color:green'>감사합니다</div>";
		
		String SMTP_USERNAME="AKIAI6OGSH2GA5B4DODA";
		String SMTP_PASSWORD="AnkzKmV/28Zs474SwX7vyrbmHb8ZZSZ5HUwBS9iQL4dg";
		
		String host = "email-smtp.us-west-2.amazonaws.com";
		int port = 25;
		
		// Create a Properties object to contain connection configuration information.
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
        msg.setHeader("content-type", "text/html");
        msg.setSubject(subject);
        msg.setContent(body, "text/html; charset=utf-8"); 
            
        // Create a transport.        
        Transport transport = session.getTransport();
                    
        // Send the message.
        try
        {
            // Connect to Amazon SES using the SMTP username and password you specified above.
            transport.connect(host, SMTP_USERNAME, SMTP_PASSWORD);
        	
            // Send the email.
            transport.sendMessage(msg, msg.getAllRecipients());
            result = "success";
        }
        catch (Exception ex) {
        	ex.printStackTrace();
        	result = "Fail";
        }
        finally
        {
            // Close and terminate the connection.
            transport.close();        	
        }
        return result;
	}
}
