package kr.madison.tip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

//import kr.madison.tip.vo.TipVO;
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
		return getSqlSession().update("Tip.modRepDisLikes", paramVO);
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
	public int findMarketTotalCnt(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findMarketTotalCnt", paramVO);
	}
	
	public List<TipVO> findMarketList(TipVO paramVO){
		return getSqlSession().selectList("Tip.findMarketList", paramVO);
	}
	
	public TipVO findMarketContent(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findMarketContent", paramVO);
	}
	

	public int addMarketData(TipVO paramVO) {
		getSqlSession().insert("Tip.addMarketData",paramVO);
		
		return paramVO.getBrdid();
	}
	
	public int addMarketReply(TipVO paramVO){
		getSqlSession().insert("Tip.addMarketReply", paramVO);
		return paramVO.getRepid();
	}
	
	public int modMarketCount(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketCount", paramVO);
	}
	
	public int modMarketLikes(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketLikes", paramVO);
	}
	
	public int modMarketDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketDislikes", paramVO);
	}
	
	public int modMarketRepLikes(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketRepLikes", paramVO);
	}
	
	public int modMarketRepDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketRepDislikes", paramVO);
	}
	
	public List<TipVO> findMarketReply(TipVO paramVO){
		return getSqlSession().selectList("Tip.findMarketReply", paramVO);
	}
	
	public int getMarketReplyCount(TipVO paramVO){
		return getSqlSession().selectOne("Tip.getMarketCount", paramVO);
	}
	
	public int modMarketData(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketData", paramVO);
	}
	
	public List<TipVO> getFrtypes(TipVO paramVO){
		return getSqlSession().selectList("Tip.getFrtypes", paramVO);
	}

	public List<TipVO> getMarketFrtypes(TipVO paramVO) {
		return getSqlSession().selectList("Tip.getMarketFrtypes", paramVO);
	}
	
	public TipVO checkLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkLikes", paramVO);
	}
	
	public TipVO checkRepLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkRepLikes", paramVO);
	}
	
	public int addFoodLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addFoodLikes", paramVO);
	}
	
	public int addFoodRepLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addFoodRepLikes", paramVO);
	}
	
	public void delBoardData(TipVO paramVO){
		getSqlSession().delete("Tip.delBoardData", paramVO);
	}
	
	public void delBoardReplyData(TipVO paramVO){
		getSqlSession().delete("Tip.delBoardReplyData", paramVO);
	}
	
	public void delBoardLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delBoardLikes", paramVO);
	}
	
	public void delBoardReplyLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delBoardReplyLikes", paramVO);
	}
}
