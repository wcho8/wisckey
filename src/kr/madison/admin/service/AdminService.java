package kr.madison.admin.service;

import kr.madison.admin.dao.AdminDAO;
import kr.madison.common.service.CommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService extends CommonService{
	@Autowired
	public AdminDAO adminDAO;
}
