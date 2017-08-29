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
		paramVO.setUserno(session.getUserno());
		BoardVO test = boardDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setLikes(1);
			result = boardDAO.addBoardLikes(paramVO);
		}
		else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getLikes() == 0){
				result = boardDAO.modBoardLikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}
	
	public int modBoardDislikes(BoardVO paramVO){
		paramVO.setUserno(session.getUserno());
		BoardVO test = boardDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setDislikes(1);
			result = boardDAO.addBoardLikes(paramVO);
		}
		else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getDislikes() == 0){
				result = boardDAO.modBoardDislikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}
	
	public int modRepLikes(BoardVO paramVO){
		paramVO.setUserno(session.getUserno());
		BoardVO test = boardDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepLikes(1);
			result = boardDAO.addBoardRepLikes(paramVO);
		}
		else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepLikes() == 0){
				result = boardDAO.modRepLikes(paramVO);
			}else{
				result = 0;
			}
		}
		return result;
	}
	
	public int modRepDislikes(BoardVO paramVO){
		paramVO.setUserno(session.getUserno());
		BoardVO test = boardDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepDislikes(1);
			result = boardDAO.addBoardRepLikes(paramVO);
		}
		else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepDislikes() == 0){
				result = boardDAO.modRepDislikes(paramVO);
			}else{
				result = 0;
			}
		}
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
	
	public int modBoardData(BoardVO paramVO){
		boardDAO.modBoardData(paramVO);
		return paramVO.getBrdid();
	}
	
	public List<BoardVO> getFrtypes(BoardVO paramVO){
		List<BoardVO> result = boardDAO.getFrtypes(paramVO);
		
		return result;
	}
	
	public void delBoardData(BoardVO paramVO){
		boardDAO.delBoardReplyLikes(paramVO);
		boardDAO.delBoardReplyData(paramVO);
		boardDAO.delBoardLikes(paramVO);
		boardDAO.delBoardData(paramVO);
	}
	
	public void delBoardReplyData(BoardVO paramVO){
		boardDAO.delBoardReplyLikes(paramVO);
		boardDAO.delBoardReplyData(paramVO);
	}
	
	public int modBoardReply(BoardVO paramVO){
		return boardDAO.modBoardReply(paramVO);
	}
	
	public void delBoardReply(BoardVO paramVO){
		boardDAO.delBoardReply(paramVO);
	}
	
	public BoardVO findBoardReplyData(BoardVO paramVO){
		return boardDAO.findBoardReplyData(paramVO);
	}
	
	public List<BoardVO> findCommentList(BoardVO paramVO){
		return boardDAO.findCommentList(paramVO);
	}
	
	public int getCommentCount(BoardVO paramVO){
		return boardDAO.getCommentCount(paramVO);
	}
}
