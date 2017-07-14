package kr.madison.main.dao;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.main.vo.MainVO;

import org.springframework.stereotype.Repository;

@Repository
public class MainDAO extends CommonDAO{

	public List<BoardVO> findTopBoardList(MainVO paramVO){
		return getSqlSession().selectList("Main.findTopBoardList", paramVO);
	}
	
	public List<AboutVO> findRecentNoticeList(MainVO paramVO){
		return getSqlSession().selectList("Main.findRecentNoticeList", paramVO);
	}
}
