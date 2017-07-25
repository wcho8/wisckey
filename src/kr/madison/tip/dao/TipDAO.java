package kr.madison.tip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.madison.board.vo.BoardVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.tip.vo.TipVO;

@Repository
public class TipDAO extends CommonDAO {
	
	public int findFoodTotalCnt(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findFoodTotalCnt", paramVO);
	}
	
	public List<TipVO> findFoodList(TipVO paramVO){
		return getSqlSession().selectList("Tip.findFoodList", paramVO);
	}
	
	public TipVO findFoodContent(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findFoodContent", paramVO);
	}
	

	public int addFoodData(TipVO paramVO) {
		getSqlSession().insert("Tip.addFoodData",paramVO);
		
		return paramVO.getBrdid();
	}
	
	public int addFoodReply(TipVO paramVO){
		getSqlSession().insert("Tip.addFoodReply", paramVO);
		return paramVO.getRepid();
	}
	
	public int modFoodCount(TipVO paramVO){
		return getSqlSession().update("Tip.modFoodCount", paramVO);
	}
	
	public int modFoodLikes(TipVO paramVO){
		return getSqlSession().update("Tip.modFoodLikes", paramVO);
	}
	
	public int modFoodDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.modFoodDislikes", paramVO);
	}
	
	public int modRepLikes(TipVO paramVO){
		return getSqlSession().update("Tip.modRepLikes", paramVO);
	}
	
	public int modRepDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.modRepDislikes", paramVO);
	}
	
	public List<TipVO> findFoodReply(TipVO paramVO){
		return getSqlSession().selectList("Tip.findFoodReply", paramVO);
	}
	
	public int getReplyCount(TipVO paramVO){
		return getSqlSession().selectOne("Tip.getFoodCount", paramVO);
	}
	
	public int modFoodData(TipVO paramVO){
		return getSqlSession().update("Tip.modFoodData", paramVO);
	}

}
