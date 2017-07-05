package kr.madison.career.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.career.dao.CareerDAO;
import kr.madison.career.vo.CareerVO;
import kr.madison.common.service.CommonService;
import kr.madison.common.vo.SessionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareerService extends CommonService{
	
	@Autowired
	CareerDAO careerDAO;
	
	@Autowired
	protected SessionVO session;

	public List<CareerVO> findCareerList(CareerVO paramVO) {
		List<CareerVO> result = new ArrayList<CareerVO>();
		
		result = careerDAO.findEmployerList(paramVO);
		
		return result;
	}

	public int addEmployerData(CareerVO paramVO) {
		paramVO.setUserno(session.getUserno());
		System.out.println("--------------------------------" + paramVO.getEmpid());
		int result = careerDAO.addEmployerData(paramVO);
		
		return result;
	}

	public CareerVO findEmployerContent(CareerVO paramVO) {
		CareerVO result = careerDAO.findEmployerContent(paramVO);
		return result;
	}

	public int modEmployerCount(CareerVO paramVO) {
		int result = careerDAO.modEmployerCount(paramVO);
		
		return result;
		
	}
}
