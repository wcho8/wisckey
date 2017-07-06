package kr.madison.board.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import kr.madison.board.dao.BoardDAO;
import kr.madison.board.vo.BoardVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardService extends CommonService{

	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	protected SessionVO session;
	
	public int findBoardTotalCnt(BoardVO paramVO){
		int result = 0;
		result = boardDAO.findBoardTotalCnt(paramVO);
		
		return result;
	}
	
	public List<BoardVO> findBoardList(BoardVO paramVO){
		List<BoardVO> results = new ArrayList<BoardVO>();
		
		results = boardDAO.findBoardList(paramVO);

		return results;
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

	public int addBoardReply(BoardVO paramVO){
		paramVO.setUserno(session.getUserno());
		int result = boardDAO.addBoardReply(paramVO);
		
		return result;
	}
	
	public int modBoardCount(BoardVO paramVO){
		int result = boardDAO.modBoardCount(paramVO);
		
		return result;
	}
	
	public int modBoardLikes(BoardVO paramVO){
		int result = boardDAO.modBoardLikes(paramVO);
		
		return result;
	}
	
	public int modBoardDislikes(BoardVO paramVO){
		int result = boardDAO.modBoardDislikes(paramVO);
		
		return result;
	}
	
	public int modRepLikes(BoardVO paramVO){
		int result = boardDAO.modRepLikes(paramVO);
		
		return result;
	}
	
	public int modRepDislikes(BoardVO paramVO){
		int result = boardDAO.modRepDislikes(paramVO);
		
		return result;
	}
	
	public int getReplyCount(BoardVO paramVO){
		int result = boardDAO.getReplyCount(paramVO);
		
		return result;
	}
	
	public List<BoardVO> findBoardReply(BoardVO paramVO){
		List<BoardVO> result = boardDAO.findBoardReply(paramVO);
		
		return result;
	}
}
