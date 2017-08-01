package kr.madison.about.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.about.dao.AboutDAO;
import kr.madison.about.vo.AboutVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AboutService extends CommonService{

	@Autowired
	AboutDAO aboutDAO;
	
	@Autowired
	protected SessionVO session;
	
	public int addNewNotice(AboutVO paramVO){
		paramVO.setUserno(session.getUserno());
		
		int result = aboutDAO.addNewNotice(paramVO);
		return result;
	}
	
	public List<AboutVO> listNotice(AboutVO paramVO){
		List<AboutVO> list = new ArrayList<AboutVO>();
		
		list = aboutDAO.listNotice(paramVO);
		
		return list;
	}
	
	public AboutVO findAboutContent(AboutVO paramVO){
		AboutVO result = aboutDAO.findAboutContent(paramVO);

		return result;
	}


	public int modNoticeCount(AboutVO paramVO) {
		int result = aboutDAO.modNoticeCount(paramVO);
		
		return result;
	}
	public int findNoticeTotalCnt(AboutVO paramVO) {
		int result = aboutDAO.findNoticeTotalCnt(paramVO);
		return result;
	}

	public int noticeDelete(AboutVO paramVO) {
		int result = aboutDAO.noticeDelete(paramVO);
		return result;
	}

	public List<AboutVO> listFourNotice(AboutVO paramVO) {
		List<AboutVO> list = new ArrayList<AboutVO>();
		
		list = aboutDAO.listFourNotice(paramVO);
		return list;
	}

	public int modAboutData(AboutVO paramVO) {
		int result = aboutDAO.modAboutData(paramVO);
		
		return result;
	}

	public List<AboutVO> searchNotice(AboutVO paramVO) {
		List<AboutVO> list = new ArrayList<AboutVO>();
		list = aboutDAO.searchNotice(paramVO);
		return list;
	}
}
	