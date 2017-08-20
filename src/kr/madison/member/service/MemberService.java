package kr.madison.member.service;

import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;
import kr.madison.member.dao.MemberDAO;
import kr.madison.member.vo.MemberVO;
import kr.madison.util.Util;

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
}
