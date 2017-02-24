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
				if(paramVO.getUserpwd().equals(logVO.getUserpwd()) || Util.encryptSHA256(paramVO.getUserpwd()).equals(logVO.getUserpwd())){
					// 비밀번호 일치
					if (logVO.getUseyn() == null){
						//대기중 회원
						logVO.setStatus("Waiting");
					} else if(logVO.getUseyn() != null && logVO.getUseyn().equals("Y")){
						//로그인 성공
						logVO.setStatus("Success");
						
						paramVO.setUserno(logVO.getUserno());
						paramVO.setSuccessyn("Y");
						logInOutDAO.addLoginData(paramVO);
					} else if(logVO.getUseyn() != null && logVO.getUseyn().equals("N")){
						//탈퇴한 회원
						logVO.setStatus("Deleted");
					} else if(logVO.getUseyn() != null && logVO.getUseyn().equals("R")){
						//반려된 회원
						logVO.setStatus("Rejected");
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
