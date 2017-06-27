package kr.madison.about.service;

import java.util.List;

import kr.madison.about.dao.AboutDAO;
import kr.madison.about.vo.AboutVO;
import kr.madison.common.service.CommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AboutService extends CommonService{

	@Autowired
	private AboutDAO aboutDAO;
	
	public int addNewNotice(AboutVO paramVO){
		int result=0;
		try{
			result = aboutDAO.addNewNotice(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<AboutVO> listNotice(AboutVO paramVO){
		List<AboutVO> list = null;
		
		try{
			list = aboutDAO.listNotice(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public AboutVO viewNotice(AboutVO paramVO){
		AboutVO aboutVO = new AboutVO();
		try{
			aboutVO = aboutDAO.viewNotice(paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return aboutVO;
	}
}
