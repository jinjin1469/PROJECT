package spring.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.vo.AuthInfo;

public class AdminCheckIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러가 수행되기 전 구동되는 기능 => 로그인 인증
		
		HttpSession session = request.getSession();
		
		if(session != null) {
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			if(authInfo.getMember_number() == 10022) {
				//세션값이 있다면
				return true;
			}
		}
		//세션값이 없을때
		response.sendRedirect(request.getContextPath()+"/");
		return false;
	}
	
}
