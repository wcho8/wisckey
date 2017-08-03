package kr.madison.school.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;
import kr.madison.school.dao.SchoolDAO;
import kr.madison.school.vo.SchoolVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SchoolService extends CommonService{

	@Autowired
	SchoolDAO schoolDAO;
	
	@Autowired
	protected SessionVO session;
	
	
	//족보
	public List<SchoolVO> findPastWorkList(SchoolVO paramVO) {
		List<SchoolVO> result = new ArrayList<SchoolVO>();
		
		result = schoolDAO.findPastWorkList(paramVO);
		
		return result;
	}
	public int addPastWorkData(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.addPastWorkData(paramVO);
		
		return result;
		
	}

	public SchoolVO findPastWorkContent(SchoolVO paramVO) {
		SchoolVO result = schoolDAO.findPastWorkContent(paramVO);
		
		return result;
	}
	public int modPastWorkCount(SchoolVO paramVO) {
		int result = schoolDAO.modPastWorkCount(paramVO);
		
		return result;
	}

	public int findPastWorkTotalCnt(SchoolVO paramVO) {
		int result = 0;
		result = schoolDAO.findPastWorkTotalCnt(paramVO);
		
		return result;
	}
	public int addPastWorkReply(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.addPastWorkReply(paramVO);
		
		return result;
	}

	public List<SchoolVO> findPastWorkReply(SchoolVO paramVO) {
		List<SchoolVO> result = new ArrayList<SchoolVO>();
		
		result = schoolDAO.findPastWorkReply(paramVO);
		
		return result;
	}

	public int deletePastWork(SchoolVO paramVO) {
		int result = schoolDAO.deletePastWork(paramVO);
		
		return result;
	}

	public int modPastWorkData(SchoolVO paramVO) {
		schoolDAO.modPastWorkData(paramVO);
		return paramVO.getBrdid();
	}
	
	
	//학업게시판
	public List<SchoolVO> findEducationList(SchoolVO paramVO) {
		List<SchoolVO> result = new ArrayList<SchoolVO>();
		
		result = schoolDAO.findEducationList(paramVO);
		
		return result;
	}
	public int addEducationData(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.addEducationData(paramVO);
		
		return result;
	}
	public SchoolVO findEducationContent(SchoolVO paramVO) {
		SchoolVO result = schoolDAO.findEducationContent(paramVO);
		
		return result;
	}
	public int modEducationCount(SchoolVO paramVO) {
		int result = schoolDAO.modEducationCount(paramVO);
		
		return result;
		
	}
	public int findEducationTotalCnt(SchoolVO paramVO) {
		int result = 0;
		result = schoolDAO.findEducationTotalCnt(paramVO);
		
		return result;
	}
	public int addEducationReply(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.addEducationReply(paramVO);
		
		return result;
	}
	public List<SchoolVO> findEducationReply(SchoolVO paramVO) {
		List<SchoolVO> result = new ArrayList<SchoolVO>();
		
		result = schoolDAO.findEducationReply(paramVO);
		
		return result;
	}
	public int deleteEducation(SchoolVO paramVO) {
		int result = schoolDAO.deleteEducation(paramVO);
		
		return result;
	}
	public int modEducationData(SchoolVO paramVO) {
		schoolDAO.modEducationData(paramVO);
		return paramVO.getBrdid();
	}
	public int modEducationLikes(SchoolVO paramVO) {
		int result = schoolDAO.modEducationLikes(paramVO);
		return result;
	}

}
