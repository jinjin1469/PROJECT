package spring.controller;



import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.dao.MemberDao;
import spring.exception.AlreadyExistingMemberException;
import spring.service.MemberRegisterService;
import spring.vo.RegisterRequest;

@Controller
public class MemberRegisterController {
	
	
	@Autowired
	MemberDao dao;

	@Autowired
	private MemberRegisterService  memberRegisterService;

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}
	
	
	//폼으로 연결
	@RequestMapping(value="/member/join")
	public String registerForm(Model model) {
	
		model.addAttribute("formData", new RegisterRequest()); 
		
		return "member/join";
	}
	
	//닉네임 중복체크 ajax
	@RequestMapping(value = "/nameCheck", method = RequestMethod.POST) 
	@ResponseBody
	public int nameCheck(@RequestParam("member_nickname") String member_nickname) { 
		return memberRegisterService.nameCheck(member_nickname); 
	}
	
	//아이디 중복체크 ajax
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST) 
	@ResponseBody
	public int idCheck(@RequestParam("member_id") String member_id) { 
		return memberRegisterService.idCheck(member_id); 
	}



	@RequestMapping(value="/member/register", method=RequestMethod.POST)
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
