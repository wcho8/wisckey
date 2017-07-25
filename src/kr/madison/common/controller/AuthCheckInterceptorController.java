package kr.madison.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.madison.common.vo.SessionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptorController extends HandlerInterceptorAdapter {
	//@Autowired
	//private AuthCheckInterceptorService authCheckInterceptorService;
	
	@Autowired
	SessionVO sessionVO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String servletPath = request.getServletPath();
		String referer = request.getHeader("Referer");
		
		if(servletPath.equals("/")){
			return true;
		} else if(servletPath.indexOf("/include/") == 0){
			return true;
		} else if(servletPath.indexOf("/images/") == 0){
			return true;
		} else if(servletPath.indexOf("/Notice/") == 0){
			return true;
		} else if(servletPath.equals("/findTopBoardList")){
			return true;
		} else if(servletPath.equals("/findRecentNoticeList")){
			return true;
		} else if(servletPath.equals("/findEmployerList")){
			return true;
		} else if(servletPath.equals("/findEducationList")){
			return true;
		} else if(servletPath.equals("/NeedLogin")){
			return true;
		} else if(servletPath.indexOf("/Member/") == 0){
			return true;
		} else if(servletPath.indexOf("/LogInOut/") == 0){
			return true;
		}
		
		if(sessionVO != null && sessionVO.getUserid() != null && !sessionVO.getUserid().equals("")){
			if(servletPath.indexOf("/Admin/") == 0){
				if(sessionVO.getAuthid() == 1 && sessionVO.getAuthid() != null){
				}else{
					response.sendRedirect("/403");
					return false;
				}
			}
		}
		else{
			response.sendRedirect("/NeedLogin");
			return false;
		}
		
		
		/*// 로그인 체크 제외
		if (servletPath.equals("/")) {
			return true;
		} else if (servletPath.equals("/Mobile/") || servletPath.equals("/Mobile")) {
			return true;
		} else if (servletPath.indexOf("/Include/") == 0) {
			return true;
		} else if (servletPath.indexOf("/Images/") == 0) {
			return true;
		} else if (servletPath.indexOf("/Main/MemberJoin/") == 0) {
			return true;
		} else if (servletPath.indexOf("/Main/MemberLogInOut/") == 0) {
			return true;
		} else if (servletPath.indexOf("/ScheduledJob/") == 0) {
			return true;
		}
		
		if ((servletPath.indexOf("/Mobile/") == 0) || ( servletPath.indexOf("/Mobile")==0)) {
			isMobile = true;
		}
		
		// 로그인 체크
		if (session != null && session.getUserid() != null && !session.getUserid().equals("")) {
			// 로그인 중이므로 권한 확인
			// 관리자 권한 확인
			if (servletPath.indexOf("/Admin/") == 0) {
				if (session.getAdminyn() != null && session.getAdminyn().equals("Y")) {
				} else {
					// 일반사용자는 접근 불가능
					response.sendRedirect("/");
					
					return false;
				}
			}
			
			// 메뉴 권한 확인
			try {
				if (referer != null && referer.indexOf("/Main/") > 0) {
					// 홈 화면에서 실행하면 권한 확인하지 않음
					return true;
				}
				
				Integer topmenuno = null; // 대메뉴번호
				String submenuno = request.getParameter("submenuno"); // 서브메뉴번호
				
				try {
					topmenuno = (Integer)handler.getClass().getField("topMenuno").get(handler);
				} catch (Exception e) {
					// 대메뉴 정보가 없으므로 권한 확인하지 않음
					return true;
				}
				
				String lastPath = null;
				if (servletPath.charAt(servletPath.length() - 1) == '/') {
					// 마지막 경로가 '/'인 경우 Index 메서드로 고정
					lastPath = "Index";
				} else {
					String[] pathList = servletPath.split("/");
					for (String path : pathList) {
						if (!path.equals("")) {
							lastPath = path;
						}
					}
				}
				
				for (Method method : handler.getClass().getMethods()) {
					if (method.getName().equals(lastPath)) {
						if (method.getAnnotation(Secured.class) != null) {
							// 권한 설정된 메뉴
							String authType = method.getAnnotation(Secured.class).value()[0];
							if (topmenuno != null && topmenuno != 0) {
								// 메뉴 정보 있으므로 권한 확인
								AuthCheckInterceptorVO authCheckInterceptorVO = new AuthCheckInterceptorVO();
								authCheckInterceptorVO.setCompno(session.getCompno());
								authCheckInterceptorVO.setEmpno(session.getEmpno());
								authCheckInterceptorVO.setTopmenuno(topmenuno);
								authCheckInterceptorVO.setSubmenuno(submenuno);
								
								authCheckInterceptorVO = authCheckInterceptorService.findMenuAuthData(authCheckInterceptorVO);
								if (authCheckInterceptorVO != null) {
									if (authType.equals("Read")) {
										// 읽기 권한 확인
										if (authCheckInterceptorVO.getIsread() != null && authCheckInterceptorVO.getIsread().equals("Y")) {
											// 접근 가능
											return true;
										} else {
											// 접근 불가능
											response.sendError(403);
											
											return false;
										}
									} else if (authType.equals("Write")) {
										// 쓰기 권한 확인
										if (authCheckInterceptorVO.getIswrite() != null && authCheckInterceptorVO.getIswrite().equals("Y")) {
											// 접근 가능
											return true;
										} else {
											// 접근 불가능
											response.sendError(403);
											
											return false;
										}
									}
								} else {
									// 권한 정보 없으므로 접근 불가
									response.sendError(403);
									
									return false;
								}
							} else {
								// 메뉴 정보 없으므로 접근 불가
								response.sendError(403);
								
								return false;
							}
						} else {
							// 권한 설정되지 않은 메뉴
							return true;
						}
					}
				}
			} catch (Exception e) {
				Util.printErrorMessage(e);
				response.sendRedirect("/");
				
				return false;
			}
		} else {
			// 로그아웃 상태
			if (isMobile) {
				// 모비일 화면
				response.sendRedirect("/Mobile/");
			} else {
				// PC 화면
				response.sendRedirect("/");
			}
			
			return false;
		}
		*/
		return true;
	}
}