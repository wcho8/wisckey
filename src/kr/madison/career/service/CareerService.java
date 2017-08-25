package kr.madison.career.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.board.vo.BoardVO;
import kr.madison.career.dao.CareerDAO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareerService extends CommonService{
	
	@Autowired
	CareerDAO careerDAO;
	
	@Autowired
	protected SessionVO session;

	public List<CareerVO> findCareerList(CareerVO paramVO) {
		List<CareerVO> result = new ArrayList<CareerVO>();
		
		result = careerDAO.findEmployerList(paramVO);
		return result;
	}

	public int addEmployerData(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.addEmployerData(paramVO);
		
		return result;
	}

	public CareerVO findEmployerContent(CareerVO paramVO) {
		CareerVO result = careerDAO.findEmployerContent(paramVO);
		
		return result;
	}

	public int modEmployerCount(CareerVO paramVO) {
		int result = careerDAO.modEmployerCount(paramVO);
		
		return result;
		
	}

	public int findEmployerTotalCnt(CareerVO paramVO) {
		int result = 0;
		result = careerDAO.findEmployerTotalCnt(paramVO);
		return result;
	}
	
	public int addEmployerReply(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.addEmployerReply(paramVO);
		
		return result;
	}

	public List<CareerVO> findEmployerReply(CareerVO paramVO) {
		List<CareerVO> result = new ArrayList<CareerVO>();
		result = careerDAO.findEmployerReply(paramVO);
		
		return result;
	}
	
	public int deleteEmployer(CareerVO paramVO) {
		int result = careerDAO.deleteEmployer(paramVO);
		
		return result;
	}

	public int modEmployerData(CareerVO paramVO) {
		careerDAO.modEmployerData(paramVO);
		return paramVO.getBrdid();
	}

	public int deleteEmployerReply(CareerVO paramVO) {
		int result = careerDAO.deleteEmployerReply(paramVO);
		
		return result;
	}

	public int modEmployerReply(CareerVO paramVO) {
		careerDAO.modEmployerReply(paramVO);
		return paramVO.getRepid();
	}

	public CareerVO findReplyContent(CareerVO paramVO) {
		CareerVO result = careerDAO.findReplyContent(paramVO);
		return result;
	}


	
	
	//여기서부터 취업게시판
	public int addEmployBoardData(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.addEmployBoardData(paramVO);
		return result;
	}

	public CareerVO findEmployBoardContent(CareerVO paramVO) {
		CareerVO result = careerDAO.findEmployBoardContent(paramVO);
		return result;
	}

	public List<CareerVO> findEmployBoardList(CareerVO paramVO) {
		List<CareerVO> result = new ArrayList<CareerVO>();
		result = careerDAO.findEmployBoardList(paramVO);
		return result;
	}

	public int findEmployBoardTotalCnt(CareerVO paramVO) {
		int result = careerDAO.findEmployBoardTotalCnt(paramVO);
		
		return result;
	}

	public int modBoardCount(CareerVO paramVO) {
		int result = careerDAO.modBoardCount(paramVO);
		
		return result;
	}

	public int addEmployBoardReply(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.addEmployBoardReply(paramVO);
		
		return result;
	}

	public List<CareerVO> findBoardReply(CareerVO paramVO) {
		List<CareerVO> result = new ArrayList<CareerVO>();
		result = careerDAO.findBoardReply(paramVO);
		
		return result;
	}

	public int deleteEmployBoard(CareerVO paramVO) {
		int result = careerDAO.deleteEmployBoard(paramVO);
		return result;
	}


	public int modEmployBoardData(CareerVO paramVO) {
		careerDAO.modEmployBoardData(paramVO);
		return paramVO.getBrdid();
	}

	public List<CareerVO> getEmptypes(CareerVO paramVO) {
		List<CareerVO> result = careerDAO.getEmptypes(paramVO);
		
		return result;
	}

	public int modEmployBoardLikes(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		CareerVO test = careerDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setLikes(1);
			result = careerDAO.addEmployLikes(paramVO);
		}
		else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getLikes() == 0){
				result = careerDAO.modEmployLikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}

	public int modRepLikes(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		CareerVO test = careerDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepLikes(1);
			result = careerDAO.addEmployRepLikes(paramVO);
		}
		else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepLikes() == 0){
				result = careerDAO.modRepLikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}

	public int modRepDislikes(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		CareerVO test = careerDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepDislikes(1);
			result = careerDAO.addEmployRepLikes(paramVO);
		}
		else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepDislikes() == 0){
				result = careerDAO.modRepDislikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}

	public int undoEmployBoardLikes(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.undoEmployBoardLikes(paramVO);
		return result;
	}

	public int undoEmployBoardRepLikes(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.undoEmployBoardRepLikes(paramVO);
		return result;
	}
	public int undoEmployBoardRepDislikes(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = careerDAO.undoEmployBoardRepDislikes(paramVO);
		return result;
	}



	
}
