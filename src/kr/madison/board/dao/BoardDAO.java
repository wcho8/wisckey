package kr.madison.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.madison.board.vo.BoardVO;
import kr.madison.common.dao.CommonDAO;

@Repository
public class BoardDAO extends CommonDAO{

	public List<BoardVO> findBoardList(BoardVO paramVO){
		return getSqlSession().selectList("Board.findBoardList", paramVO);
	}
	
	public BoardVO findBoardContent(BoardVO paramVO){
		return getSqlSession().selectOne("Board.findBoardContent", paramVO);
	}
	
	public int addBoardData(BoardVO paramVO){
		return getSqlSession().insert("Board.addBoardData", paramVO);
	}
}
