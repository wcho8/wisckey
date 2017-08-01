package kr.madison.member.dao;

import kr.madison.common.dao.CommonDAO;
import kr.madison.member.vo.MemberVO;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO extends CommonDAO{

	public int addNewMember(MemberVO paramVO){
		int result = 0;
		try{
			result = getSqlSession().insert("Member.addNewMember", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public int chkId(MemberVO paramVO) {
		int result = 0;
		try{
			result = getSqlSession().insert("Member.chkId", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public int chkNickname(MemberVO paramVO) {
		int result = 0;
		try{
			result = getSqlSession().insert("Member.chkNickname", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public MemberVO findMemberData(MemberVO paramVO) {
		return getSqlSession().selectOne("Member.findMemberData", paramVO);
	}

	public int memberEdit(MemberVO paramVO) {
		return getSqlSession().update("Member.memberEdit", paramVO);
	}

	public int modPasswdEdit(MemberVO paramVO) {
		return getSqlSession().update("Member.modPasswdEdit", paramVO);
	}
}
