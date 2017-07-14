package kr.madison.about.dao;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.common.dao.CommonDAO;

import org.springframework.stereotype.Repository;

@Repository
public class AboutDAO extends CommonDAO{

	public int addNewNotice(AboutVO paramVO) {
		getSqlSession().insert("About.addNewNotice",paramVO);
		return paramVO.getNid();
	}
	
	public List<AboutVO> listNotice(AboutVO paramVO){
		 
		List<AboutVO> list = getSqlSession().selectList("About.listNotice", paramVO);
			
		return list;
	}

	public AboutVO findAboutContent(AboutVO paramVO) {
		return getSqlSession().selectOne("About.viewNotice", paramVO);
	}

	public int modNoticeCount(AboutVO paramVO) {
		return getSqlSession().update("About.modNoticeCount", paramVO);
	}

	public int findNoticeTotalCnt(AboutVO paramVO) {
		return getSqlSession().selectOne("About.findNoticeTotalCnt", paramVO);
	}

	public int noticeDelete(AboutVO paramVO) {
		return getSqlSession().delete("noticeDelete", paramVO);
	}

	public List<AboutVO> listFourNotice(AboutVO paramVO) {
		List<AboutVO> list = getSqlSession().selectList("About.listFourNotice", paramVO);
		
		return list;
	}

}
