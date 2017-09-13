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
	
	public int findTipsTotalCnt(TipVO paramVO){
		int result = 0;
		result = tipDAO.findTipsTotalCnt(paramVO);
		
		return result;
	}
	
	public List<TipVO> findTipsList(TipVO paramVO){
		List<TipVO> results = new ArrayList<TipVO>();
		
		results = tipDAO.findTipsList(paramVO);

		return results;
	}
	
	public TipVO findTipsContent(TipVO paramVO){
		TipVO result = tipDAO.findTipsContent(paramVO);
		
		return result;
	}
	
	public List<TipVO> getFrtypes(TipVO paramVO){
		List<TipVO> result = tipDAO.getFrtypes(paramVO);
		
		return result;
	}

	public int addTipsData(TipVO paramVO) {
		paramVO.setUserno(session.getUserno());
		int result = tipDAO.addTipsData(paramVO);
		return result;
	}
	
	
	public int addTipsReply(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		int result = tipDAO.addTipsReply(paramVO);
		
		return result;
	}
	
	public int modTipsCount(TipVO paramVO){
		int result = tipDAO.modTipsCount(paramVO);
		
		return result;
	}
	
	public int modTipsLikes(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		TipVO test = tipDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setLikes(1);
			result = tipDAO.addTipsLikes(paramVO);
		}else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getLikes() == 0){
				result = tipDAO.modTipsLikes(paramVO);
			}else{
				result = 0;
			}
		}
		
		return result;
	}
	
	public int modTipsDislikes(TipVO paramVO){
		paramVO.setUserno(session.getUserno());
		TipVO test = tipDAO.checkLikes(paramVO);
		int result = 0;
		if(test == null || test.getLid() == null){
			paramVO.setDislikes(1);
			result = tipDAO.addTipsLikes(paramVO);
		}else if(test.getLid() != 0 && test.getLid() != null){
			if(test.getDislikes() == 0){
				result = tipDAO.modTipsDislikes(paramVO);
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
			result = tipDAO.addTipsRepLikes(paramVO);
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
			result = tipDAO.addTipsRepLikes(paramVO);
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
	
	public List<TipVO> findTipsReply(TipVO paramVO){
		List<TipVO> result = tipDAO.findTipsReply(paramVO);
		
		return result;
	}
	
	public int modTipsData(TipVO paramVO){
		tipDAO.modTipsData(paramVO);
		return paramVO.getBrdid();
	}
	
	public void delTipsBoardData(TipVO paramVO){
		tipDAO.delTipsBoardData(paramVO);
	}
	
	public void delTipsBoardReplyData(TipVO paramVO){
		tipDAO.delTipsBoardReplyData(paramVO);
	}
	
	public int modTipsBoardReply(TipVO paramVO){
		return tipDAO.modTipsBoardReply(paramVO);
	}
	
	public void delTipsBoardReply(TipVO paramVO){
		tipDAO.delTipsBoardReply(paramVO);
	}
	
	public TipVO findTipsBoardReplyData(TipVO paramVO){
		return tipDAO.findTipsBoardReplyData(paramVO);
	}
	
	public List<BoardVO> findTipsCommentList(TipVO paramVO){
		return tipDAO.findTipsCommentList(paramVO);
	}
	
	public int getTipsCommentCount(TipVO paramVO){
		return tipDAO.getTipsCommentCount(paramVO);
	}
	
	public int undoTipsBoardLikes(TipVO paramVO){
		return tipDAO.undoTipsBoardLikes(paramVO);
	}
	public int undoTipsBoardDislikes(TipVO paramVO){
		return tipDAO.undoTipsBoardDislikes(paramVO);
	}
	public int undoTipsBoardRepLikes(TipVO paramVO){
		return tipDAO.undoTipsBoardRepLikes(paramVO);
	}
	public int undoTipsBoardRepDislikes(TipVO paramVO){
		return tipDAO.undoTipsBoardRepDislikes(paramVO);
	}
	

}
