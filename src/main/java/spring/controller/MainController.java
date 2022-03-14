package spring.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


import spring.dao.MemberDao;
import spring.vo.Member;

@Controller
public class MainController {

	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/")
	public String main(HttpServletRequest request,Model model) {
		
		List<Member> m = dao.memberAll();
		System.out.println(m.get(0).getMember_name());
		model.addAttribute("Member",m);
		model.addAttribute("totalPrice",200);
		
		return "main";
	}
	
}
