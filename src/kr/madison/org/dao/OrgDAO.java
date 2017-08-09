package kr.madison.org.dao;

import java.util.List;

import kr.madison.board.vo.BoardVO;
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
		return getSqlSession().update("Org.modRepDislikes", paramVO);
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
}
