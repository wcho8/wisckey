package kr.madison.main.service;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.service.CommonService;
import kr.madison.main.dao.MainDAO;
import kr.madison.main.vo.MainVO;
import kr.madison.member.vo.MemberVO;
import kr.madison.school.vo.SchoolVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService extends CommonService{
	@Autowired
	MainDAO mainDAO;
	
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
}
