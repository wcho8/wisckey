package kr.madison.org.service;

import java.io.File;
import java.util.List;

import kr.madison.admin.vo.AdminVO;
import kr.madison.board.vo.BoardVO;
import kr.madison.common.service.CommonService;
import kr.madison.org.dao.OrgDAO;
import kr.madison.org.vo.OrgVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrgService extends CommonService{

	@Autowired
	OrgDAO orgDAO;
	
	public List<OrgVO> findOrgListData(OrgVO paramVO){
		return orgDAO.findOrgListData(paramVO);
	}
	
	public byte[] loadOrgImage(OrgVO paramVO){
		OrgVO vo = orgDAO.loadOrgImage(paramVO);
		try{
			return vo.getFileContent();
		}catch(NullPointerException e){
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<OrgVO> findOrgList(OrgVO paramVO){
		return orgDAO.findOrgList(paramVO);
	}

	public int getOrgCount(OrgVO paramVO) {
		return orgDAO.getOrgCount(paramVO);
	}
	
	public OrgVO getOrgData(OrgVO paramVO){
		return orgDAO.getOrgData(paramVO);
	}
	
	public int addOrgData(OrgVO paramVO){
		orgDAO.addOrgData(paramVO);
		return paramVO.getOrgid();
	}
	
	public int editOrgData(OrgVO paramVO){
		return orgDAO.editOrgData(paramVO);
	}
	
	public List<OrgVO> findOrgBoardList(OrgVO paramVO){
		return orgDAO.findOrgBoardList(paramVO);
	}
	
	public int findOrgBoardTotalCnt(OrgVO paramVO){
		return orgDAO.findOrgBoardTotalCnt(paramVO);
	}
	
	public OrgVO getOrgBoardData(OrgVO paramVO){
		return orgDAO.getOrgBoardData(paramVO);
	}

	public void modBoardCount(OrgVO paramVO) {
		orgDAO.modBoardCount(paramVO);
	}
	
	public int addBoardReply(OrgVO paramVO){
		int result = orgDAO.addBoardReply(paramVO);
		
		return result;
	}
	public int modBoardLikes(OrgVO paramVO){
		int result = orgDAO.modBoardLikes(paramVO);
		
		return result;
	}
	
	public int modRepLikes(OrgVO paramVO){
		int result = orgDAO.modRepLikes(paramVO);
		
		return result;
	}
	
	public int modRepDislikes(OrgVO paramVO){
		int result = orgDAO.modRepDislikes(paramVO);
		
		return result;
	}
	
	public int getReplyCount(OrgVO paramVO){
		int result = orgDAO.getReplyCount(paramVO);
		
		return result;
	}
	
	public List<OrgVO> findBoardReply(OrgVO paramVO){
		List<OrgVO> result = orgDAO.findBoardReply(paramVO);
		
		return result;
	}
	
	public int modBoardData(OrgVO paramVO){
		orgDAO.modBoardData(paramVO);
		return paramVO.getBrdid();
	}
	
	public void delBoardData(OrgVO paramVO){
		orgDAO.delBoardData(paramVO);
		orgDAO.delBoardReplyData(paramVO);
	}
	
	public int delBoardReplyData(OrgVO paramVO){
		return orgDAO.delBoardReplyData(paramVO);
	}

	public int addOrgBoardData(OrgVO paramVO) {
		orgDAO.addOrgBoardData(paramVO);
		return paramVO.getBrdid();
	}
	
	public List<OrgVO> findMyOrgList(OrgVO paramVO){
		return orgDAO.findMyOrgList(paramVO);
	}
	
	public OrgVO getMyOrgData(OrgVO paramVO){
		return orgDAO.getMyOrgData(paramVO);
	}
	
	public OrgVO getMyOrgDetails(OrgVO paramVO){
		return orgDAO.getMyOrgDetails(paramVO);
	}
	
	public int modMyOrgData(OrgVO paramVO){
		return orgDAO.modMyOrgData(paramVO);
	}
	
	public int modMyOrgDetail(OrgVO paramVO){
		return orgDAO.modMyOrgDetail(paramVO);
	}
	
	public int addMyOrgDetail(OrgVO paramVO){
		return orgDAO.addMyOrgDetail(paramVO);
	}
	
}
