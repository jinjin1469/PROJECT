package spring.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.exception.MemberDeactivateAccount;
import spring.exception.MemberNotFoundException;
import spring.service.FindService;
import spring.vo.Member;

@Controller
public class MemberFindController {

	
	private FindService findService;

	public void setFindService(FindService findService) {
		this.findService = findService;
	}
	
	// 아이디 찾기 페이지로 연결
	@RequestMapping(value ="/member/findId")
	public String findIdForm() throws Exception{
		return "/member/findId";
	}
	
	// 아이디 찾기 실행
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	public String findId(HttpServletResponse response, Member memVo, Model model) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			Member member = findService.findId(response, memVo);
			String id = member.getMember_id();
			model.addAttribute("id", id);
			return "/member/findIdSuccess";
		}catch(MemberNotFoundException e) {
			
			out.println("<script>");
			out.println("alert('가입되어있는 계정이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return "member/findId";
			
		}
		
		
		}
	
	//비밀번호 찾기
	@RequestMapping(value = "/member/findPwd", method = RequestMethod.POST)
	public void findPwd(HttpServletResponse response, @ModelAttribute Member memVo) throws Exception{
		findService.findPwd(response, memVo);
	}
	
}
	

