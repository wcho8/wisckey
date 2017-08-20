package kr.madison.main.dao;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.main.vo.MainVO;
import kr.madison.member.vo.MemberVO;
import kr.madison.org.vo.OrgVO;
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

	public List<OrgVO> findOrgBoardList(MainVO paramVO) {
		return getSqlSession().selectList("Main.findOrgBoardList", paramVO);
	}

	//Q&A
	public int addQnABoardData(MainVO paramVO) {
		getSqlSession().insert("Main.addQnABoardData", paramVO);
		System.out.println("addQnABoardData in DAO");
		return paramVO.getBrdid();
	}
	public int deleteQnABoard(MainVO paramVO) {
		getSqlSession().delete("Main.deleteQnABoardReply", paramVO);
		return getSqlSession().delete("Main.deleteQnABoard",paramVO);
	}

	public int modQnABoardContent(MainVO paramVO) {
		return getSqlSession().update("Main.modQnABoardContent",paramVO);
	}

	public MainVO findQnABoardContent(MainVO paramVO) {
		return getSqlSession().selectOne("Main.findQnABoardContent",paramVO);
	}

	public int findQnABoardTotalCnt(MainVO paramVO) {
		return getSqlSession().selectOne("Main.findQnABoardTotalCnt", paramVO);
	}

	public List<MainVO> findQnABoardList(MainVO paramVO) {
		return getSqlSession().selectList("Main.findQnABoardList",paramVO);
	}

	public List<MainVO> findQnABoardReply(MainVO paramVO) {
		return getSqlSession().selectList("Main.findQnABoardReply", paramVO); 
	}
	
	public int modQnABoardCount(MainVO paramVO) {
		return getSqlSession().update("Main.modQnABoardCount",paramVO);
	}

	public int addQnABoardReply(MainVO paramVO) {
		return getSqlSession().insert("Main.addQnABoardReply", paramVO);
	}

}
