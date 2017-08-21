package kr.madison.school.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.madison.board.vo.BoardVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.school.vo.SchoolVO;

@Repository
public class SchoolDAO extends CommonDAO {
	
	
	//족보
	public List<SchoolVO> findPastWorkList(SchoolVO paramVO) {
		return getSqlSession().selectList("School.findPastWorkList",paramVO);
	}

	public int addPastWorkData(SchoolVO paramVO) {
		getSqlSession().insert("School.addPastWorkData", paramVO);
		return paramVO.getBrdid();
	}

	public SchoolVO findPastWorkContent(SchoolVO paramVO) {
		return getSqlSession().selectOne("School.findPastWorkContent", paramVO);
	}

	public int modPastWorkCount(SchoolVO paramVO) {
		return getSqlSession().update("School.modPastWorkCount", paramVO);
	}

	public int findPastWorkTotalCnt(SchoolVO paramVO) {
		return getSqlSession().selectOne("School.findPastWorkTotalCnt", paramVO);
	}

	public int addPastWorkReply(SchoolVO paramVO) {
		return getSqlSession().insert("School.addPastWorkReply", paramVO);
	}

	public List<SchoolVO> findPastWorkReply(SchoolVO paramVO) {
		return getSqlSession().selectList("School.findPastWorkReply", paramVO);
	}

	public int deletePastWork(SchoolVO paramVO) {
		getSqlSession().delete("School.deletePastWorkReply", paramVO);
		return getSqlSession().delete("School.deletePastWork", paramVO);
	}

	public int modPastWorkData(SchoolVO paramVO) {
		return getSqlSession().update("School.modPastWorkData", paramVO);
	}

	
	
	//학업게시판
	public List<SchoolVO> findEducationList(SchoolVO paramVO) {
		return getSqlSession().selectList("School.findEducationList",paramVO);
	}

	public int addEducationData(SchoolVO paramVO) {
		getSqlSession().insert("School.addEducationData", paramVO);
		return paramVO.getBrdid();
	}

	public SchoolVO findEducationContent(SchoolVO paramVO) {
		return getSqlSession().selectOne("School.findEducationContent", paramVO);
	}

	public int modEducationCount(SchoolVO paramVO) {
		return getSqlSession().update("School.modEducationCount", paramVO);

	}

	public int findEducationTotalCnt(SchoolVO paramVO) {
		return getSqlSession().selectOne("School.findEducationTotalCnt", paramVO);

	}

	public int addEducationReply(SchoolVO paramVO) {
		return getSqlSession().insert("School.addEducationReply", paramVO);

	}

	public List<SchoolVO> findEducationReply(SchoolVO paramVO) {
		return getSqlSession().selectList("School.findEducationReply", paramVO);

	}

	public int deleteEducation(SchoolVO paramVO) {
		getSqlSession().delete("School.deleteEducation", paramVO);
		return getSqlSession().delete("School.deleteEducation", paramVO);
	}

	public int modEducationData(SchoolVO paramVO) {
		return getSqlSession().update("School.modEducationData", paramVO);
		
	}

	public int modEducationLikes(SchoolVO paramVO) {
		return getSqlSession().update("School.modEducationLikes", paramVO);
	}
	public int modEducationDislikes(SchoolVO paramVO) {
		return getSqlSession().update("School.modEducationDislikes", paramVO);
	}

	public int modRepLikes(SchoolVO paramVO) {
		return getSqlSession().update("School.modRepLikes", paramVO);
	}

	public int modRepDislikes(SchoolVO paramVO) {
		return getSqlSession().update("School.modRepDisLikes", paramVO);
	}

	public List<SchoolVO> getSwtypes(SchoolVO paramVO) {
		return getSqlSession().selectList("School.getSwtypes", paramVO);
	}

	public SchoolVO checkLikes(SchoolVO paramVO) {
		return getSqlSession().selectOne("School.checkLikes", paramVO);
	}

	public int addEducationLikes(SchoolVO paramVO) {
		return getSqlSession().insert("School.addEducationLikes", paramVO);
	}
	public SchoolVO checkRepLikes(SchoolVO paramVO) {
		return getSqlSession().selectOne("School.checkRepLikes", paramVO);
	}
	
	public int addEducationRepLikes(SchoolVO paramVO){
		return getSqlSession().insert("School.addEducationRepLikes", paramVO);
	}

	

}
