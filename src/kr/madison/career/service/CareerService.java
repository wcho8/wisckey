package kr.madison.career.service;

import kr.madison.career.dao.CareerDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareerService {
	
	@Autowired
	private CareerDAO careerDAO;
}
