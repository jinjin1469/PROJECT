package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	// 아이디 체크
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)  
		@ResponseBody
		public int idCheck(@RequestParam("id") String id){
			System.out.println("userIdCheck 진입");
			System.out.println("전달받은 id:"+id);
		int cnt = userService.idCheck(id);
			System.out.println("확인 결과:"+cnt);
		return cnt;
	    }
	}	

