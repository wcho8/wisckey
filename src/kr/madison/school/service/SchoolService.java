package kr.madison.school.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.board.vo.BoardVO;
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
		
		String title="";
		for(int i=0; i<result.size(); i++){
			if(result.get(i).title.length()>25){
				title = result.get(i).title.substring(0, 25);
				title +="...";
			}else{
				title = result.get(i).getTitle();
			}
			result.get(i).setTitle(title);
		}
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
		
		String title="";
		for(int i=0; i<result.size(); i++){
			if(result.get(i).title.length()>25){
				title = result.get(i).title.substring(0, 25);
				title +="...";
			}else{
				title = result.get(i).getTitle();
			}
			result.get(i).setTitle(title);
		}
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
		paramVO.setUserno(session.getUserno());
		SchoolVO test = schoolDAO.checkLikes(paramVO);
		int result = 0;
		if(test==null||test.getLid()==null){
			paramVO.setLikes(1);
			result = schoolDAO.addEducationLikes(paramVO);
		}else if(test.getLid()!=0 && test.getLid() != null){
			if(test.getLikes()==0){
				result = schoolDAO.modEducationLikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}
	public int modEducationDislikes(SchoolVO paramVO) {
		int result = schoolDAO.modEducationDislikes(paramVO);
		return result;
	}
	
	public int modRepLikes(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		SchoolVO test = schoolDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepLikes(1);
			result = schoolDAO.addEducationRepLikes(paramVO);
		}
		else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepLikes() == 0){
				result = schoolDAO.modRepLikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}
	public int modRepDislikes(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		SchoolVO test = schoolDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepDislikes(1);
			result = schoolDAO.addEducationRepLikes(paramVO);
		}
		else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepDislikes() == 0){
				result = schoolDAO.modRepDislikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}
	public List<SchoolVO> getSwtypes(SchoolVO paramVO) {
		List<SchoolVO> result = schoolDAO.getSwtypes(paramVO);
		return result;
	}
	public int undoEducationBoardLikes(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.undoEducationBoardLikes(paramVO);
		return result;
	}
	public int undoEducationBoardRepLikes(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.undoEducationBoardRepLikes(paramVO);
		return result;
	}
	public int undoEducationBoardDislikes(SchoolVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = schoolDAO.undoEducationBoardDislikes(paramVO);
		return result;
	}
	

}
