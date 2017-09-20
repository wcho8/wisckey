package kr.madison.geul.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.madison.common.vo.GridVO;
import kr.madison.geul.service.GeulService;
import kr.madison.geul.vo.GeulVO;
import kr.madison.util.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Geul/*")
public class GeulController {
	
	@Autowired
	GeulService geulService;
	
	public void setGeulService(GeulService geulSerivce){
		this.geulService = geulSerivce;
	}
	
	
	//내가 쓴 글
	@RequestMapping("/")
	public ModelAndView memberGeul(@ModelAttribute("paramVO") GeulVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		List<GeulVO> vo = geulService.findGeulTypes(paramVO);
		
		mav.addObject("geulTypes", vo);
		mav.setViewName("/geul/memberGeul");
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public GridVO findGeulList(GeulVO paramVO){
		 GridVO gridVO = new GridVO();
		 paramVO.setUserno(paramVO.getUserno());
		 
		 try{
			 int totalCount = geulService.findGeulListCount(paramVO);
			 gridVO.bindPaging(totalCount, paramVO);
		     gridVO.bindData(geulService.findGeulList(paramVO));
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		return gridVO;
		 
	}
	@RequestMapping
	@ResponseBody
	public List<GeulVO> findGeulTypes(GeulVO paramVO){
		List<GeulVO> result = new ArrayList<GeulVO>();
		result = geulService.findGeulTypes(paramVO);
		return result;
	}
	
	
	@RequestMapping
	@ResponseBody
	public int findGeulTotalCnt(GeulVO paramVO){
		int result = geulService.findGeulListCount(paramVO);
		
		return result;
	}
	//내가 댓글 단 글
	@RequestMapping("/memberRep")
	public ModelAndView memberRep(@ModelAttribute("paramVO") GeulVO paramVO, HttpServletRequest res){
		ModelAndView mav = new ModelAndView();
		
		List<GeulVO> vo = geulService.findGeulTypes(paramVO);
		
		mav.addObject("geulTypes", vo);
		mav.setViewName("/geul/memberRep");
		return mav;
	}
	
	@RequestMapping
	@ResponseBody
	public GridVO findGeulRepList(GeulVO paramVO){
		GridVO gridVO = new GridVO();
		paramVO.setUserno(paramVO.getUserno());
		 try{
			 int totalCount = geulService.findGeulListCount(paramVO);
			 gridVO.bindPaging(totalCount, paramVO);
		     gridVO.bindData(geulService.findGeulRepList(paramVO));
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		return gridVO;
		
	}
	
	
}
