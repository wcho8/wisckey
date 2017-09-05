package kr.madison.tip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.madison.board.vo.BoardVO;
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

	// 9/4
	public void delFoodBoardData(TipVO paramVO){
		getSqlSession().delete("Tip.delFoodBoardData", paramVO);
	}
	public void delFoodBoardReplyData(TipVO paramVO){
		getSqlSession().delete("Tip.delFoodBoardReplyData", paramVO);
	}

	public BoardVO checkFoodLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkFoodLikes", paramVO);
	}
	public int addFoodBoardLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addFoodBoardLikes", paramVO);
	}
	public BoardVO checkFoodRepLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkFoodRepLikes", paramVO);
	}
	public int addFoodBoardRepLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addFoodBoardRepLikes", paramVO);
	}
	public void delFoodBoardLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delFoodBoardLikes", paramVO);
	}
	public void delFoodBoardReplyLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delFoodBoardReplyLikes", paramVO);
	}

	public int modFoodBoardReply(TipVO paramVO){
		return getSqlSession().update("Tip.modFoodBoardReply", paramVO);
	}

	public void delFoodBoardReply(TipVO paramVO){
		getSqlSession().delete("Tip.delFoodBoardReply", paramVO);
	}

	public TipVO findFoodBoardReplyData(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findFoodBoardReplyData", paramVO);
	}

	public List<BoardVO> findFoodCommentList(TipVO paramVO){
		return getSqlSession().selectList("Tip.findFoodCommentList", paramVO);
	}

	public int getFoodCommentCount(TipVO paramVO){
		return getSqlSession().selectOne("Tip.getFoodCommentCount", paramVO);
	}
	public int undoFoodBoardLikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoFoodBoardLikes", paramVO);
	}
	public int undoFoodBoardDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoFoodBoardDislikes", paramVO);
	}
	public int undoFoodBoardRepLikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoFoodBoardRepLikes", paramVO);
	}
	public int undoFoodBoardRepDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoFoodBoardRepDislikes", paramVO);
	}





	//Market
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

	// 9/4
	public void delMarketBoardData(TipVO paramVO){
		getSqlSession().delete("Tip.delMarketBoardData", paramVO);
	}
	public void delMarketBoardReplyData(TipVO paramVO){
		getSqlSession().delete("Tip.delMarketBoardReplyData", paramVO);
	}

	public BoardVO checkMarketLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkMarketLikes", paramVO);
	}
	public int addMarketBoardLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addMarketBoardLikes", paramVO);
	}
	public BoardVO checkMarketRepLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkMarketRepLikes", paramVO);
	}
	public int addMarketBoardRepLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addMarketBoardRepLikes", paramVO);
	}
	public void delMarketBoardLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delMarketBoardLikes", paramVO);
	}
	public void delMarketBoardReplyLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delMarketBoardReplyLikes", paramVO);
	}

	public int modMarketBoardReply(TipVO paramVO){
		return getSqlSession().update("Tip.modMarketBoardReply", paramVO);
	}

	public void delMarketBoardReply(TipVO paramVO){
		getSqlSession().delete("Tip.delMarketBoardReply", paramVO);
	}

	public TipVO findMarketBoardReplyData(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findMarketBoardReplyData", paramVO);
	}

	public List<TipVO> findMarketCommentList(TipVO paramVO){
		return getSqlSession().selectList("Tip.findMarketCommentList", paramVO);
	}

	public int getMarketCommentCount(TipVO paramVO){
		return getSqlSession().selectOne("Tip.getMarketCommentCount", paramVO);
	}
	public int undoMarketBoardLikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoMarketBoardLikes", paramVO);
	}
	public int undoMarketBoardDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoMarketBoardDislikes", paramVO);
	}
	public int undoMarketBoardRepLikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoMarketBoardRepLikes", paramVO);
	}
	public int undoMarketBoardRepDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoMarketBoardRepDislikes", paramVO);
	}


}
