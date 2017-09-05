package kr.madison.tip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.madison.board.vo.BoardVO;
//import kr.madison.board.vo.BoardVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;
import kr.madison.tip.dao.TipDAO;
import kr.madison.tip.vo.TipVO;

@Service
public class TipService extends CommonService{
	
	@Autowired
	TipDAO tipDAO;
	
	@Autowired
	protected SessionVO session;
	
	public int findFoodTotalCnt(TipVO paramVO){
		int result = 0;
		result = tipDAO.findFoodTotalCnt(paramVO);
		
		return result;
	}
	
	public List<TipVO> findFoodList(TipVO paramVO){
		List<TipVO> results = new ArrayList<TipVO>();
		
		results = tipDAO.findFoodList(paramVO);

		return results;
	}
	
	public TipVO findFoodContent(TipVO paramVO){
		TipVO result = tipDAO.findFoodContent(paramVO);
		
		return result;
	}

	public int addFoodData(TipVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = tipDAO.addFoodData(paramVO);
		return result;
	}
	
	
	public int addFoodReply(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		int result = tipDAO.addFoodReply(paramVO);
		
		return result;
	}
	
	public int modFoodCount(TipVO paramVO){
		int result = tipDAO.modFoodCount(paramVO);
		
		return result;
	}
	
	public int modFoodLikes(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		TipVO test = tipDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setLikes(1);
			result = tipDAO.addFoodLikes(paramVO);
		}else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getLikes() == 0){
				result = tipDAO.modFoodLikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}
	
	public int modFoodDislikes(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		TipVO test = tipDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setDislikes(1);
			result = tipDAO.addFoodLikes(paramVO);
		}else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getDislikes() == 0){
				result = tipDAO.modFoodDislikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}
	
	public int modRepLikes(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		TipVO test = tipDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepLikes(1);
			result = tipDAO.addFoodRepLikes(paramVO);
		}else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepLikes() == 0){
				result = tipDAO.modRepLikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}
	
	public int modRepDislikes(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		TipVO test = tipDAO.checkRepLikes(paramVO);
		int result = 0;
		if(test == null || test.getReplid() == null){
			paramVO.setRepDislikes(1);
			result = tipDAO.addFoodRepLikes(paramVO);
		}else if(test.getReplid() != 0 && test.getReplid() != null){
			if(test.getRepDislikes() == 0){
				result = tipDAO.modRepDislikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}
	
	public int getReplyCount(TipVO paramVO){
		int result = tipDAO.getReplyCount(paramVO);
		
		return result;
	}
	
	public List<TipVO> findFoodReply(TipVO paramVO){
		List<TipVO> result = tipDAO.findFoodReply(paramVO);
		
		return result;
	}
	
	public int modFoodData(TipVO paramVO){
		tipDAO.modFoodData(paramVO);
		return paramVO.getBrdid();
	}
	
	
	// 9/4
	
	public void delFoodBoardData(TipVO paramVO){
		tipDAO.delFoodBoardReplyLikes(paramVO);
		tipDAO.delFoodBoardReplyData(paramVO);
		tipDAO.delFoodBoardLikes(paramVO);
		tipDAO.delFoodBoardData(paramVO);
	}
	
	public void delFoodBoardReplyData(TipVO paramVO){
		tipDAO.delFoodBoardReplyLikes(paramVO);
		tipDAO.delFoodBoardReplyData(paramVO);
	}
	
	public int modFoodBoardReply(TipVO paramVO){
		return tipDAO.modFoodBoardReply(paramVO);
	}
	
	public void delFoodBoardReply(TipVO paramVO){
		tipDAO.delFoodBoardReply(paramVO);
	}
	
	public TipVO findFoodBoardReplyData(TipVO paramVO){
		return tipDAO.findFoodBoardReplyData(paramVO);
	}
	
	public List<BoardVO> findFoodCommentList(TipVO paramVO){
		return tipDAO.findFoodCommentList(paramVO);
	}
	
	public int getFoodCommentCount(TipVO paramVO){
		return tipDAO.getFoodCommentCount(paramVO);
	}
	
	public int undoFoodBoardLikes(TipVO paramVO){
		return tipDAO.undoFoodBoardLikes(paramVO);
	}
	public int undoFoodBoardDislikes(TipVO paramVO){
		return tipDAO.undoFoodBoardDislikes(paramVO);
	}
	public int undoFoodBoardRepLikes(TipVO paramVO){
		return tipDAO.undoFoodBoardRepLikes(paramVO);
	}
	public int undoFoodBoardRepDislikes(TipVO paramVO){
		return tipDAO.undoFoodBoardRepDislikes(paramVO);
	}
	
	
	
	
	
	
	
	
	
	
	// Market
	
	
	public int findMarketTotalCnt(TipVO paramVO){
		int result = 0;
		result = tipDAO.findMarketTotalCnt(paramVO);
		
		return result;
	}
	
	public List<TipVO> findMarketList(TipVO paramVO){
		List<TipVO> results = new ArrayList<TipVO>();
		
		results = tipDAO.findMarketList(paramVO);

		return results;
	}
	
	public TipVO findMarketContent(TipVO paramVO){
		TipVO result = tipDAO.findMarketContent(paramVO);
		
		return result;
	}

	public int addMarketData(TipVO paramVO) {
		// TODO Auto-generated method stub
		paramVO.setUserno(session.getUserno());
		int result = tipDAO.addMarketData(paramVO);
		return result;
	}
	
	
	public int addMarketReply(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		int result = tipDAO.addMarketReply(paramVO);
		
		return result;
	}
	
	public int modMarketCount(TipVO paramVO){
		int result = tipDAO.modMarketCount(paramVO);
		
		return result;
	}
	
	public int modMarketLikes(TipVO paramVO){
		int result = tipDAO.modMarketLikes(paramVO);
		
		return result;
	}
	
	public int modMarketDislikes(TipVO paramVO){
		int result = tipDAO.modMarketDislikes(paramVO);
		
		return result;
	}
	
	public int modMarketRepLikes(TipVO paramVO){
		int result = tipDAO.modMarketRepLikes(paramVO);
		
		return result;
	}
	
	public int modMarketRepDislikes(TipVO paramVO){
		int result = tipDAO.modMarketRepDislikes(paramVO);
		
		return result;
	}
	
	public int getMarketReplyCount(TipVO paramVO){
		int result = tipDAO.getMarketReplyCount(paramVO);
		
		return result;
	}
	
	public List<TipVO> findMarketReply(TipVO paramVO){
		List<TipVO> result = tipDAO.findMarketReply(paramVO);
		
		return result;
	}
	
	public int modMarketData(TipVO paramVO){
		tipDAO.modMarketData(paramVO);
		return paramVO.getBrdid();
	}
	
	// 8/17
	public List<TipVO> getFrtypes(TipVO paramVO){
		List<TipVO> result = tipDAO.getFrtypes(paramVO);
		
		return result;
	}

	public List<TipVO> getMarketFrtypes(TipVO paramVO) {
		// TODO Auto-generated method stub
		List<TipVO> result = tipDAO.getMarketFrtypes(paramVO);
		return result;
	}
	
	public void delBoardData(TipVO paramVO){
		tipDAO.delBoardReplyLikes(paramVO);
		tipDAO.delBoardReplyData(paramVO);
		tipDAO.delBoardLikes(paramVO);
		tipDAO.delBoardData(paramVO);
	}
	
	// 9/4
	public void delMarketBoardData(TipVO paramVO){
		tipDAO.delMarketBoardReplyLikes(paramVO);
		tipDAO.delMarketBoardReplyData(paramVO);
		tipDAO.delMarketBoardLikes(paramVO);
		tipDAO.delMarketBoardData(paramVO);
	}
	
	public void delMarketBoardReplyData(TipVO paramVO){
		tipDAO.delMarketBoardReplyLikes(paramVO);
		tipDAO.delMarketBoardReplyData(paramVO);
	}
	
	public int modMarketBoardReply(TipVO paramVO){
		return tipDAO.modMarketBoardReply(paramVO);
	}
	
	public void delMarketBoardReply(TipVO paramVO){
		tipDAO.delMarketBoardReply(paramVO);
	}
	
	public TipVO findMarketBoardReplyData(TipVO paramVO){
		return tipDAO.findMarketBoardReplyData(paramVO);
	}
	
	public List<TipVO> findMarketCommentList(TipVO paramVO){
		return tipDAO.findMarketCommentList(paramVO);
	}
	
	public int getMarketCommentCount(TipVO paramVO){
		return tipDAO.getMarketCommentCount(paramVO);
	}
	
	public int undoMarketBoardLikes(TipVO paramVO){
		return tipDAO.undoMarketBoardLikes(paramVO);
	}
	public int undoMarketBoardDislikes(TipVO paramVO){
		return tipDAO.undoMarketBoardDislikes(paramVO);
	}
	public int undoMarketBoardRepLikes(TipVO paramVO){
		return tipDAO.undoMarketBoardRepLikes(paramVO);
	}
	public int undoMarketBoardRepDislikes(TipVO paramVO){
		return tipDAO.undoMarketBoardRepDislikes(paramVO);
	}
	
	
	

}
