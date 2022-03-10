package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.dao.MemberDao;
import spring.service.ManageService;
import spring.vo.Login;
import spring.vo.Member;

@Controller
public class MyPageController {


	@Autowired
	MemberDao dao;

	@Autowired
	private ManageService manageService;

	public void setManageService(ManageService manageService) {
		this.manageService = manageService;
	}
	
	//마이페이지 연결
	 @RequestMapping(value="/mypage/mypage/{member_number}",method=RequestMethod.GET)
		public String myPage(@PathVariable("member_number") Long member_number, Model model) {
		 
			Member memVo = manageService.myPage(member_number);
			
			model.addAttribute("member", memVo);
			
			return "mypage/mypage";
		}
	 
	//관리자 페이지 연결
		 @RequestMapping(value="/admin/admin/{member_number}",method=RequestMethod.GET)
			public String myPageAdmin(@PathVariable("member_number") Long member_number, Model model) {
			 
				Member memVo = manageService.myPage(member_number);
				
				model.addAttribute("member", memVo);
				
				return "admin/admin";
			}
		 
	 
	//회원정보 수정 폼 연결
	 @RequestMapping(value="/mypage/modify/{member_number}",method=RequestMethod.GET)
		public String modifyForm(@PathVariable("member_number") Long member_number, Model model) {
		 
			Member memVo = manageService.myPage(member_number);
			
			model.addAttribute("member", memVo);
			
			return "mypage/modify";
		}
	    
	
	
}
