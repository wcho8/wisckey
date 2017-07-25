package kr.madison.tip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.madison.board.vo.BoardVO;
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
		// TODO Auto-generated method stub
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
		int result = tipDAO.modFoodLikes(paramVO);
		
		return result;
	}
	
	public int modFoodDislikes(TipVO paramVO){
		int result = tipDAO.modFoodDislikes(paramVO);
		
		return result;
	}
	
	public int modRepLikes(TipVO paramVO){
		int result = tipDAO.modRepLikes(paramVO);
		
		return result;
	}
	
	public int modRepDislikes(TipVO paramVO){
		int result = tipDAO.modRepDislikes(paramVO);
		
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


}
