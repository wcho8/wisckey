package kr.madison.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.madison.common.dao.LogInOutDAO;
import kr.madison.common.vo.LogInOutVO;
import kr.madison.util.Util;

@Service
public class LogInOutService {
	@Autowired
	private LogInOutDAO logInOutDAO;

	public LogInOutVO Login(LogInOutVO paramVO) {
		LogInOutVO logVO = null;
		
		try{
			logVO = logInOutDAO.Login(paramVO);
			
			if(logVO != null){
				if(paramVO.getPasswd().equals(logVO.getPasswd()) || Util.encryptSHA256(paramVO.getPasswd()).equals(logVO.getPasswd())){
					// 비밀번호 일치
					if (logVO.getUseyn() == null){
						logVO.setStatus("NotFound");
					} else if(logVO.getUseyn() != null && logVO.getUseyn().equals("Y")){
						logVO.setStatus("Success");
						paramVO.setUserno(logVO.getUserno());
						paramVO.setSuccessyn("Y");
						paramVO.setIslogin(true);
						logInOutDAO.addLoginData(paramVO);
					}
				}else{
					//비밀번호 틀림
					logVO.setStatus("Fail");
					
					//기록 추가
					paramVO.setUserno(logVO.getUserno());
					paramVO.setSuccessyn("N");
					logInOutDAO.addLoginData(paramVO);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return logVO;
	}

}
