package kr.madison.common.dao;

import org.springframework.stereotype.Repository;

import kr.madison.common.vo.LogInOutVO;

@Repository
public class LogInOutDAO extends CommonDAO{

	public LogInOutVO Login(LogInOutVO paramVO) {
		LogInOutVO logVO = null;
		
		try{
			logVO = getSqlSession().selectOne("LogInOut.Login", paramVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return logVO;
	}

	public void addLoginData(LogInOutVO paramVO) {
		getSqlSession().insert("LogInOut.addLoginData", paramVO);
	}

}
