package spring.controller;



import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.dao.MemberDao;
import spring.exception.AlreadyExistingMemberException;
import spring.service.MemberRegisterService;
import spring.vo.RegisterRequest;

@Controller
public class MemberRegisterController {

	@Autowired
	private MemberRegisterService  memberRegisterService;

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}

	@Autowired
	MemberDao dao;
	
	@RequestMapping(value="/member/join")
	public String registerForm(Model model) {
	
		model.addAttribute("formData", new RegisterRequest()); 
		
		return "member/join";
	}
	
	
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	@ResponseBody
	public String register(Model model, RegisterRequest regReq,Errors errors,HttpServletResponse response) {
	
		if(!regReq.isPasswordEqualToConfirmPassword()) {
			errors.reject("passwordMisMatch");
			return "member/join";
		}
		
		try {
			memberRegisterService.regist(regReq);
		
		}catch(AlreadyExistingMemberException e) {

			// 이미 회원이 존재하는 상태 =>  에러 
//				errors.rejectValue("memberId", "duplicate","중복된 아이디입니다.");
//				return "register/registerForm";
			
			return "member/join";
			}
		
		return "redirect:/";
		}
	
}
