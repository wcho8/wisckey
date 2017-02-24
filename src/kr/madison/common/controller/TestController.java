package kr.madison.common.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import facebook4j.Account;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.Friendlist;
import facebook4j.ResponseList;
import facebook4j.auth.AccessToken;

@Controller
@RequestMapping("/")
public class TestController {
	
	protected final String FB_APP_API_KEY = "1319140488151884";
	protected final String FB_APP_SECRET = "63e3c882f01082db4189792176829a53";
	protected final String FB_PERMISSION = "email, publish_action, publish_stream, user_likes, friends_likes, read_stream";
//	protected final String FB_CLIENT_ACCESS_TOKEN = "20ded7acb0d7aa3f938811e39f85e3d9";
	protected final String FB_ACCESS_TOKEN = "1319140488151884|FV_vcSRnHoQ-vnzs0FxfIFJDelo";
	
	@RequestMapping("/")
	public ModelAndView Index() throws Exception{
		ModelAndView mav = null;
		
		mav = new ModelAndView();
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	@RequestMapping("/fb")
	public void facebookPage() throws FacebookException, URISyntaxException, IOException{
//		ModelAndView objMav = null;
		
		Facebook fb = new FacebookFactory().getInstance();
		fb.setOAuthAppId(FB_APP_API_KEY, FB_APP_SECRET);
		fb.setOAuthPermissions(FB_PERMISSION);
		URL url = new URL("https://graph.facebook.com/oauth/access_token?grant_type=client_credentials"
				+ "&client_id=" + FB_APP_API_KEY + "&client_secret=" + FB_APP_SECRET);
		
		fb.setOAuthAccessToken(new AccessToken(FB_ACCESS_TOKEN));
		
//		return objMav;
	}
	
	@RequestMapping("/kakao")
	public ModelAndView kakao(){
		ModelAndView objMav = null;
		
		objMav = new ModelAndView();
		objMav.setViewName("/main/kakao");
		
		return objMav;
	}
	
}
