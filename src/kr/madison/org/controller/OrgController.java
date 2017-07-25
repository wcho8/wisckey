package kr.madison.org.controller;

import kr.madison.common.controller.CommonController;
import kr.madison.org.service.OrgService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Org/")
public class OrgController extends CommonController{

	@Autowired
	OrgService orgService;
}
