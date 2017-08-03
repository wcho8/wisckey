package kr.madison.org.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.madison.common.controller.CommonController;
import kr.madison.common.vo.GridVO;
import kr.madison.org.service.OrgService;
import kr.madison.org.vo.OrgVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Org/*")
public class OrgController extends CommonController{
	
	final private int pageRow = 15;

	@Autowired
	OrgService orgService;
	
	@RequestMapping("/")
	public ModelAndView index(OrgVO paramVO){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("org/introOrg");
		
		return mav;
	}
	
	@RequestMapping("/orgBoard/{orgtype}")
	public ModelAndView orgBoard(@PathVariable("orgtype") String orgtype, OrgVO paramVO){	
		ModelAndView mav = new ModelAndView();
		
		switch(orgtype){
		case "academic":
			paramVO.setOrgtypeid(1);
			break;
		case "hobby":
			paramVO.setOrgtypeid(2);
			break;
		case "sports":
			paramVO.setOrgtypeid(3);
			break;
		case "religion":
			paramVO.setOrgtypeid(4);
			break;
		}
		
		int totalCnt = orgService.findOrgBoardTotalCnt(paramVO);
		Util.setPaging(paramVO, totalCnt, pageRow);
		
		List<OrgVO> result = orgService.findOrgBoardList(paramVO);
		
		
		mav.addObject("oblist", result);
		mav.setViewName("org/orgBoard");
		
		return mav;
	}
	
	@RequestMapping("/BoardView")
	public ModelAndView boardView(@ModelAttribute("paramVO") OrgVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		/*OrgVO vo = boardService.findBoardContent(paramVO);
		List<OrgVO> replies = boardService.findBoardReply(paramVO);
		int repcount = boardService.getReplyCount(paramVO);
		
		if(vo != null){
			boardService.modBoardCount(paramVO);
		}*/
		
		mav.setViewName("org/orgBoardView");
		/*mav.addObject("vo", vo);
		mav.addObject("repCnt", repcount);
		mav.addObject("reps", replies);*/
		return mav;
	}
	
	@RequestMapping("/BoardEdit")
	public ModelAndView boardEdit(@ModelAttribute("paramVO") OrgVO paramVO, HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		/*List<OrgVO> frtypes = boardService.getFrtypes(paramVO);
		*/
		mav.setViewName("org/orgBoardEdit");
//		mav.addObject("frtypes", frtypes);
		
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public List<OrgVO> findOrgListData(OrgVO paramVO){
		List<OrgVO> result = orgService.findOrgListData(paramVO);
		
		return result;
	}

	@RequestMapping("/findOrgList")
	@ResponseBody
	public GridVO findOrgList(OrgVO paramVO){
		GridVO grid = new GridVO();
		
		List<OrgVO> result = orgService.findOrgList(paramVO);
		
		grid.bindPaging(orgService.getOrgCount(paramVO), paramVO);
		grid.bindData(result);
		
		return grid;
	}
	
	@RequestMapping
	@ResponseBody
	public OrgVO getOrgData(OrgVO paramVO){
		return orgService.getOrgData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int addOrgData(OrgVO paramVO){
		return orgService.addOrgData(paramVO);
	}
	
	@RequestMapping
	@ResponseBody
	public int editOrgData(OrgVO paramVO){
		return orgService.editOrgData(paramVO);
	}
}
