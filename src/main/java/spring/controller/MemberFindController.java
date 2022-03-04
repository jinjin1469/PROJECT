package spring.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.service.FindService;

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
	public String findId(HttpServletResponse response, @RequestParam("member_email") String member_email, Model md) throws Exception{
		md.addAttribute("id", findService.findId(response, member_email));
		return "/member/findIdSuccess";
	}
	
	
}
