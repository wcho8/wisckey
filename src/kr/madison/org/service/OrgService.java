package kr.madison.org.service;

import kr.madison.common.service.CommonService;
import kr.madison.org.dao.OrgDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrgService extends CommonService{

	@Autowired
	OrgDAO orgDAO;
}
