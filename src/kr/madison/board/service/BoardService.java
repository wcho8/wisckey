package kr.madison.board.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.board.dao.BoardDAO;
import kr.madison.board.vo.BoardVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService extends CommonService{

	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	protected SessionVO session;
	
	public List<BoardVO> findBoardList(BoardVO paramVO){
		List<BoardVO> result = new ArrayList<BoardVO>();
		
		result = boardDAO.findBoardList(paramVO);
		
		return result;
	}
	
	public BoardVO findBoardContent(BoardVO paramVO){
		BoardVO result = boardDAO.findBoardContent(paramVO);
		
		return result;
	}
	
	public int addBoardData(BoardVO paramVO){
		paramVO.setUserno(session.getUserno());
		int result = boardDAO.addBoardData(paramVO);
		
		return result;
	}
}
