package kr.madison.main.dao;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.main.vo.MainVO;
import kr.madison.school.vo.SchoolVO;

import org.springframework.stereotype.Repository;

@Repository
public class MainDAO extends CommonDAO{

	public List<BoardVO> findTopBoardList(MainVO paramVO){
		return getSqlSession().selectList("Main.findTopBoardList", paramVO);
	}
	
	public List<AboutVO> findRecentNoticeList(MainVO paramVO){
		return getSqlSession().selectList("Main.findRecentNoticeList", paramVO);
	}

	public List<CareerVO> findEmployerList(MainVO paramVO) {
		return getSqlSession().selectList("Main.findEmployerList", paramVO);
	}

	public List<SchoolVO> findEducationList(MainVO paramVO) {
		return getSqlSession().selectList("Main.findEducationList", paramVO);
	}
}
