package kr.madison.org.dao;

import java.util.List;

import kr.madison.common.dao.CommonDAO;
import kr.madison.org.vo.OrgVO;

import org.springframework.stereotype.Repository;

@Repository
public class OrgDAO extends CommonDAO{
	public List<OrgVO> findOrgListData(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgListData", paramVO);
	}
	public OrgVO loadOrgImage(OrgVO paramVO){
		try{
			return getSqlSession().selectOne("Org.loadOrgImage", paramVO);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public List<OrgVO> findOrgList(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgList", paramVO);
	}
	
	public int getOrgCount(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getOrgCount", paramVO);
	}
	
	public OrgVO getOrgData(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getOrgData", paramVO);
	}
	
	public int addOrgData(OrgVO paramVO){
		return getSqlSession().insert("Org.addOrgData", paramVO);
	}
	
	public int editOrgData(OrgVO paramVO){
		return getSqlSession().update("Org.editOrgData", paramVO);
	}
	
	public List<OrgVO> findOrgBoardList(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgBoardList", paramVO);
	}
	
	public int findOrgBoardTotalCnt(OrgVO paramVO){
		return getSqlSession().selectOne("Org.findOrgBoardTotalCnt", paramVO);
	}
	
	public OrgVO getOrgBoardData(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getOrgBoardData", paramVO);
	}
	
	public void modBoardCount(OrgVO paramVO) {
		getSqlSession().update("Org.modOrgBoardCount", paramVO);
	}
	
	public int addBoardReply(OrgVO paramVO){
		getSqlSession().insert("Org.addOrgBoardReply", paramVO);
		return paramVO.getRepid();
	}
	
	public int modBoardLikes(OrgVO paramVO){
		return getSqlSession().update("Org.modOrgBoardLikes", paramVO);
	}
	
	public int modRepLikes(OrgVO paramVO){
		return getSqlSession().update("Org.modOrgRepLikes", paramVO);
	}
	
	public int modRepDislikes(OrgVO paramVO){
		return getSqlSession().update("Org.modOrgRepDisLikes", paramVO);
	}
	
	public List<OrgVO> findBoardReply(OrgVO paramVO){
		return getSqlSession().selectList("Org.findOrgBoardReply", paramVO);
	}
	
	public int getReplyCount(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getOrgReplyCount", paramVO);
	}
	
	public int modBoardData(OrgVO paramVO){
		return getSqlSession().update("Org.modOrgBoardData", paramVO);
	}
	
	public int delBoardData(OrgVO paramVO){
		return getSqlSession().delete("Org.delOrgBoardData", paramVO);
	}
	public int delBoardReplyData(OrgVO paramVO){
		return getSqlSession().delete("Org.delOrgBoardReplyData", paramVO);
	}
	public int addOrgBoardData(OrgVO paramVO) {
		return getSqlSession().insert("Org.addOrgBoardData", paramVO);
	}
	public List<OrgVO> findMyOrgList(OrgVO paramVO){
		return getSqlSession().selectList("Org.findMyOrgList", paramVO);
	}
	public OrgVO getMyOrgData(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getMyOrgData", paramVO);
	}
	public OrgVO getMyOrgDetails(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getMyOrgDetails", paramVO);
	}
	public int modMyOrgData(OrgVO paramVO){
		return getSqlSession().update("Org.modMyOrgData", paramVO);
	}
	public int modMyOrgDetail(OrgVO paramVO){
		return getSqlSession().update("Org.modMyOrgDetail", paramVO);
	}
	public int addMyOrgDetail(OrgVO paramVO){
		return getSqlSession().insert("Org.addMyOrgDetail", paramVO);
	}
	public OrgVO checkLikes(OrgVO paramVO){
		return getSqlSession().selectOne("Org.checkLikes", paramVO);
	}
	public int addOrgBoardLikes(OrgVO paramVO){
		return getSqlSession().insert("Org.addOrgBoardLikes", paramVO);
	}
	public OrgVO checkRepLikes(OrgVO paramVO){
		return getSqlSession().selectOne("Org.checkRepLikes", paramVO);
	}
	public int addBoardRepLikes(OrgVO paramVO){
		return getSqlSession().insert("Org.addBoardRepLikes", paramVO);
	}
	public void modOrgPrAuth(OrgVO paramVO){
		getSqlSession().update("Org.modOrgPrAuth", paramVO);
	}
	public void modOrgOldPrAuth(OrgVO paramVO){
		getSqlSession().update("Org.modOrgOldPrAuth", paramVO);
	}
	public OrgVO getImage(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getImage", paramVO);
	}
	public int modBoardReply(OrgVO paramVO){
		return getSqlSession().update("Org.modBoardReply", paramVO);
	}
	
	public void delBoardReply(OrgVO paramVO){
		getSqlSession().delete("Org.delBoardReply", paramVO);
	}
	
	public OrgVO findBoardReplyData(OrgVO paramVO){
		return getSqlSession().selectOne("Org.findBoardReplyData", paramVO);
	}
	
	public List<OrgVO> findCommentList(OrgVO paramVO){
		return getSqlSession().selectList("Org.findCommentList", paramVO);
	}
	
	public int getCommentCount(OrgVO paramVO){
		return getSqlSession().selectOne("Org.getCommentCount", paramVO);
	}
	public int undoBoardLikes(OrgVO paramVO){
		return getSqlSession().update("Org.undoBoardLikes", paramVO);
	}
	public int undoBoardDislikes(OrgVO paramVO){
		return getSqlSession().update("Org.undoBoardDislikes", paramVO);
	}
	public int undoBoardRepLikes(OrgVO paramVO){
		return getSqlSession().update("Org.undoBoardRepLikes", paramVO);
	}
	public int undoBoardRepDislikes(OrgVO paramVO){
		return getSqlSession().update("Org.undoBoardRepDislikes", paramVO);
	}
	public int deleteOrg(OrgVO paramVO) {
		return getSqlSession().delete("Org.deleteOrg", paramVO);
	}
}
