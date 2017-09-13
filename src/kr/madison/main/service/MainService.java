package kr.madison.main.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;
import kr.madison.main.dao.MainDAO;
import kr.madison.main.vo.MainVO;
import kr.madison.org.vo.OrgVO;
import kr.madison.school.vo.SchoolVO;
import kr.madison.tip.vo.TipVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService extends CommonService{
	@Autowired
	MainDAO mainDAO;
	
	@Autowired
	protected SessionVO session;
	
	public List<BoardVO> findTopBoardList(MainVO paramVO){
		return mainDAO.findTopBoardList(paramVO);
	}
	
	public List<AboutVO> findRecentNoticeList(MainVO paramVO){
		return mainDAO.findRecentNoticeList(paramVO);
	}

	public List<CareerVO> findEmployerList(MainVO paramVO) {
		return mainDAO.findEmployerList(paramVO);
	}

	public List<SchoolVO> findEducationList(MainVO paramVO) {
		return mainDAO.findEducationList(paramVO);
	}

	public List<OrgVO> findOrgBoardList(MainVO paramVO) {
		return mainDAO.findOrgBoardList(paramVO);
	}
	
	public List<TipVO> findTipsList(MainVO paramVO){
		return mainDAO.findTipsList(paramVO);
	}
	
	public int addQnABoardData(MainVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = mainDAO.addQnABoardData(paramVO);
		System.out.println("addQnABoardData in Service");
		return result;
	}

	public int deleteQnABoard(MainVO paramVO) {
		int result = mainDAO.deleteQnABoard(paramVO);
		return result;
	}

	public int modQnABoardContent(MainVO paramVO) {
		int result = mainDAO.modQnABoardContent(paramVO);
		return result;
	}

	public MainVO findQnABoardContent(MainVO paramVO) {
		MainVO result = mainDAO.findQnABoardContent(paramVO);
		return result;
	
	}

	public int findQnABoardTotalCnt(MainVO paramVO) {
		int result = mainDAO.findQnABoardTotalCnt(paramVO);
		return result;
	}

	public List<MainVO> findQnABoardList(MainVO paramVO) {
		List<MainVO> result = new ArrayList<MainVO>();
		
		result = mainDAO.findQnABoardList(paramVO);
		return result;
	}

	public List<MainVO> findQnABoardReply(MainVO paramVO) {
		List<MainVO> result = new ArrayList<MainVO>();
		
		result = mainDAO.findQnABoardReply(paramVO);
		return result;
	}

	public int modQnABoardCount(MainVO paramVO) {
		int result = mainDAO.modQnABoardCount(paramVO);
		
		return result;
	}

	public int addQnABoardReply(MainVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = mainDAO.addQnABoardReply(paramVO);
		return result;
	}

}
