package spring.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


import spring.dao.MemberDao;
import spring.vo.Category;
import spring.vo.Member;

@Controller
public class MainController {

	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/")
	public String main(HttpServletRequest request,Model model) {
		


		

		model.addAttribute("totalPrice",200);
		
		return "main";
	}
	
}
