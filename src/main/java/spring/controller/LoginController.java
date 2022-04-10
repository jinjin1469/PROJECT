package spring.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.exception.IdPasswordNotMatchingException;
import spring.service.AuthService;
import spring.validator.LoginCommandValidator;
import spring.vo.AuthInfo;
import spring.vo.Login;

@Controller
public class LoginController {
	
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
		
	 //로그인 폼으로 연결
    @RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String form(Login login, Model model, @CookieValue(value="rememberId", required=false) Cookie rememberId) {
		
 
//    	String referrer = request.getHeader("Referer");
//   	request.getSession().setAttribute("prevPage", referrer);
    	if(rememberId != null) {  
			login.setMember_id(rememberId.getValue()); 
			login.setRememberId(true);			
		}
    	
    	
		return "member/login";
	}
    
    //로그인
    @RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String submit(Login login, Errors errors, HttpSession session, HttpServletRequest request, HttpServletResponse response, String url) { 
    	new LoginCommandValidator().validate(login, errors);
    	if(errors.hasErrors()) {
			return "member/login";
		}
    		
		try {
			AuthInfo authInfo = authService.authenticate(login.getMember_id(), login.getMember_pwd());
			session.setAttribute("authInfo", authInfo);
			Cookie rememberCookie = new Cookie("rememberId",login.getMember_id());
			
			rememberCookie.setPath("/member/login");
			if(login.isRememberId()) {
				rememberCookie.setMaxAge(60*60*24*365);
			}else {
				rememberCookie.setMaxAge(0);
			}

			response.addCookie(rememberCookie);
			
			return "redirect:/";
			
		}catch(IdPasswordNotMatchingException e) {
			
			errors.reject("idPasswordNotMatching");
			return "member/login";
			
		}
		
	}
    
   

    //로그아웃
    @RequestMapping("/logout")
	public String logout(HttpSession session) {
    	session.invalidate(); //세션에 저장된 모든 데이터를 제거
		
		return "redirect:/";
	}
    
    
    
  
    
    
}
    
