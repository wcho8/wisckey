package kr.madison.member.service;

import kr.madison.common.service.CommonService;
import kr.madison.member.dao.MemberDAO;
import kr.madison.member.vo.MemberVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService extends CommonService{

	@Autowired
	private MemberDAO memberDAO;
	
	public int addNewMember(MemberVO paramVO){
		int result = 0;
		try{
			paramVO.setPasswd(Util.encryptSHA256(paramVO.getPasswd()));
			
			result = memberDAO.addNewMember(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public int chkId(MemberVO paramVO) {
		int result = 0;
		try{
			result = memberDAO.chkId(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public int chkNickname(MemberVO paramVO) {
		int result = 0;
		try{
			result = memberDAO.chkNickname(paramVO);
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
}
