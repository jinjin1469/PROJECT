package spring.controller;


import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.exception.IdPasswordNotMatchingException;
import spring.service.AuthService;
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
	public String form(Login login) {
		
		return "member/login";
	}
    
    //로그인
    @RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String submit(Login login, Errors errors, HttpSession session) { 
			
		try {
			AuthInfo authInfo = authService.authenticate(login.getMember_id(), login.getMember_pwd());
			
			// 로그인 정보를 기록할 세션 코드
			session.setAttribute("authInfo", authInfo);
			
		}catch(IdPasswordNotMatchingException e) {
			
			errors.reject("idPasswordNotMatching");
			return "login/loginForm";
		}
		return "redirect:/";
	}
    

    //로그아웃
    @RequestMapping("/logout")
	public String logout(HttpSession session) {
    	session.invalidate(); //세션에 저장된 모든 데이터를 제거
		
		return "redirect:/";
	}
    
    
}
    
