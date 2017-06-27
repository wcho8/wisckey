package kr.madison.about.dao;

import java.util.List;

import kr.madison.about.vo.AboutVO;
import kr.madison.common.dao.CommonDAO;

import org.springframework.stereotype.Repository;

@Repository
public class AboutDAO extends CommonDAO{

	public int addNewNotice(AboutVO paramVO) {
		int result=0;
		try{
			result = getSqlSession().insert("About.addNewNotice", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<AboutVO> listNotice(AboutVO paramVO){
		 
		List<AboutVO> list = getSqlSession().selectList("About.listNotice", paramVO);
			
		return list;
	}

	public AboutVO viewNotice(AboutVO paramVO) {
		AboutVO aboutVO = getSqlSession().selectOne("About.viewNotice", paramVO);
		
		return aboutVO;
	}
}
