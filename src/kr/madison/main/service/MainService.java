package kr.madison.main.service;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.common.service.CommonService;
import kr.madison.main.dao.MainDAO;
import kr.madison.main.vo.MainVO;

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
}
