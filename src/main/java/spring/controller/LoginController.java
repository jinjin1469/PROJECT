package spring.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.exception.IdPasswordNotMatchingException;
import spring.service.AuthService;
import spring.service.KakaoAPI;
import spring.vo.AuthInfo;

@Controller
public class LoginController {
	
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
		
	@Autowired
    private KakaoAPI kakao;
    
    @RequestMapping(value="/")
    public String index() {
        
        return "index";
    }
	
    
    @RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String form(Model model) {  
		
		model.addAttribute("loginCommand",new LoginCommand());
		
		return "login/loginForm";
	}
    
    
    @RequestMapping(value="/loginForm",method=RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) { 
			
		new LoginCommandValidator().validate(loginCommand, errors);
				
				if(errors.hasErrors()) {
					return "login/loginForm";
				}
		
	
		try {
			AuthInfo authInfo = authService.authenticate(loginCommand.getMemberId(), loginCommand.getMemberPassword());
			
			// 로그인 정보를 기록할 세션 코드
			session.setAttribute("authInfo", authInfo);
			if(loginCommand.getMemberId().contentEquals("admin")) {
				return "redirect:/adminmain";
			}
			
		}catch(IdPasswordNotMatchingException e) {
			//아이디가 없거나, 비밀번호가 틀린경우
			errors.reject("idPasswordNotMatching");
			return "login/loginForm";
		}
		return "redirect:/";
	}
    
    
   @RequestMapping(value="/kakaologin")
	    public String login(@RequestParam("code") String code) { //컨트롤러 메소드에서 API인증을 통해 얻어낸 code의 값 받아온다.
		 String access_Token = kakao.getAccessToken(code);
	        System.out.println("controller access_token : " + access_Token);
	        
	        session.setAttribute("authInfo", authInfo);
	        return "main";
	  }
}
