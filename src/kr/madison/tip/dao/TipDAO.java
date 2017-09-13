package kr.madison.tip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.madison.board.vo.BoardVO;
//import kr.madison.tip.vo.TipVO;
import kr.madison.common.dao.CommonDAO;
import kr.madison.tip.vo.TipVO;

@Repository
public class TipDAO extends CommonDAO {

	public int findTipsTotalCnt(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findTipsTotalCnt", paramVO);
	}

	public List<TipVO> findTipsList(TipVO paramVO){
		return getSqlSession().selectList("Tip.findTipsList", paramVO);
	}

	public TipVO findTipsContent(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findTipsContent", paramVO);
	}

	public List<TipVO> getFrtypes(TipVO paramVO){
		return getSqlSession().selectList("Tip.getFrtypes", paramVO);
	}

	public int addTipsData(TipVO paramVO) {
		getSqlSession().insert("Tip.addTipsData",paramVO);

		return paramVO.getBrdid();
	}

	public int addTipsReply(TipVO paramVO){
		getSqlSession().insert("Tip.addTipsReply", paramVO);
		return paramVO.getRepid();
	}

	public int modTipsCount(TipVO paramVO){
		return getSqlSession().update("Tip.modTipsCount", paramVO);
	}

	public int modTipsLikes(TipVO paramVO){
		return getSqlSession().update("Tip.modTipsLikes", paramVO);
	}

	public int modTipsDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.modTipsDislikes", paramVO);
	}

	public int modRepLikes(TipVO paramVO){
		return getSqlSession().update("Tip.modRepLikes", paramVO);
	}

	public int modRepDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.modRepDisLikes", paramVO);
	}

	public List<TipVO> findTipsReply(TipVO paramVO){
		return getSqlSession().selectList("Tip.findTipsReply", paramVO);
	}

	public int getReplyCount(TipVO paramVO){
		return getSqlSession().selectOne("Tip.getReplyCount", paramVO);
	}

	public int modTipsData(TipVO paramVO){
		return getSqlSession().update("Tip.modTipsData", paramVO);
	}

	// 9/4
	public void delTipsBoardData(TipVO paramVO){
		getSqlSession().delete("Tip.delTipsBoardData", paramVO);
	}
	public void delTipsBoardReplyData(TipVO paramVO){
		getSqlSession().delete("Tip.delTipsBoardReplyData", paramVO);
	}

	public BoardVO checkTipsLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkTipsLikes", paramVO);
	}
	public int addTipsBoardLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addTipsBoardLikes", paramVO);
	}
	public BoardVO checkTipsRepLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkTipsRepLikes", paramVO);
	}
	public int addTipsBoardRepLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addTipsBoardRepLikes", paramVO);
	}
	public void delTipsBoardLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delTipsBoardLikes", paramVO);
	}
	public void delTipsBoardReplyLikes(TipVO paramVO){
		getSqlSession().delete("Tip.delTipsBoardReplyLikes", paramVO);
	}

	public int modTipsBoardReply(TipVO paramVO){
		return getSqlSession().update("Tip.modTipsBoardReply", paramVO);
	}

	public void delTipsBoardReply(TipVO paramVO){
		getSqlSession().delete("Tip.delTipsBoardReply", paramVO);
	}

	public TipVO findTipsBoardReplyData(TipVO paramVO){
		return getSqlSession().selectOne("Tip.findTipsBoardReplyData", paramVO);
	}

	public List<BoardVO> findTipsCommentList(TipVO paramVO){
		return getSqlSession().selectList("Tip.findTipsCommentList", paramVO);
	}

	public int getTipsCommentCount(TipVO paramVO){
		return getSqlSession().selectOne("Tip.getTipsCommentCount", paramVO);
	}
	public int undoTipsBoardLikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoTipsBoardLikes", paramVO);
	}
	public int undoTipsBoardDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoTipsBoardDislikes", paramVO);
	}
	public int undoTipsBoardRepLikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoTipsBoardRepLikes", paramVO);
	}
	public int undoTipsBoardRepDislikes(TipVO paramVO){
		return getSqlSession().update("Tip.undoTipsBoardRepDislikes", paramVO);
	}
	
	public TipVO checkLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkLikes", paramVO);
	}

	public TipVO checkRepLikes(TipVO paramVO){
		return getSqlSession().selectOne("Tip.checkRepLikes", paramVO);
	}

	public int addTipsLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addTipsLikes", paramVO);
	}

	public int addTipsRepLikes(TipVO paramVO){
		return getSqlSession().insert("Tip.addTipsRepLikes", paramVO);
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
