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

	public Integer chkId(MemberVO paramVO) {
		Integer result = 0;
		try{
			result = getSqlSession().selectOne("Member.chkId", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public Integer chkNickname(MemberVO paramVO) {
		Integer result = 0;
		try{
			result = getSqlSession().selectOne("Member.chkNickname", paramVO);
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
	
	public MemberVO searchById(MemberVO paramVO){
		MemberVO result = new MemberVO();
		try{
			result = getSqlSession().selectOne("Member.searchById", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
}
