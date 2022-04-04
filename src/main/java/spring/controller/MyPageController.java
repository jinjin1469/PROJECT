package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.siot.IamportRestClient.IamportClient;

import spring.dao.MemberDao;
import spring.dao.OrderDao;
import spring.service.ManageService;
import spring.vo.AuthInfo;
import spring.vo.Login;
import spring.vo.Member;
import spring.vo.Order;
import spring.vo.RegisterRequest;

@Controller
public class MyPageController {


	@Autowired
	MemberDao dao;

	@Autowired
	private ManageService manageService;

	public void setManageService(ManageService manageService) {
		this.manageService = manageService;
	}
	
	private OrderDao odao;

	public void setDao(OrderDao odao) {
		this.odao = odao;
	}
	
	private IamportClient api;
	
	public MyPageController() {
		this.api = new IamportClient("5478353111638089","38c701ccf0c5e1bb14f091d942224863eebfa6b285a8195735b0eaae973d6339abf549d563d49cf8");
	}
	
	//留덉씠�럹�씠吏� �뿰寃�
	 @RequestMapping(value="/mypage/mypage/{member_number}",method=RequestMethod.GET)
		public String myPage(@PathVariable("member_number") Long member_number, Model model) {
		 
			Member memVo = manageService.myPage(member_number);
			
			model.addAttribute("member", memVo);
			
			return "mypage/mypage";
		}
	 
	//愿�由ъ옄 �럹�씠吏� �뿰寃�
		 @RequestMapping(value="/admin/admin/{member_number}",method=RequestMethod.GET)
			public String myPageAdmin(@PathVariable("member_number") Long member_number, Model model) {
			 
				Member memVo = manageService.myPage(member_number);
				
				model.addAttribute("member", memVo);
				
				return "admin/admin";
			}
		 
	 
	//�쉶�썝�젙蹂� �닔�젙 �뤌 �뿰寃�
	 @RequestMapping(value="/mypage/modify/{member_number}",method=RequestMethod.GET)
		public String modifyForm(@PathVariable("member_number") Long member_number, Model model) {
		 
			Member memVo = manageService.myPage(member_number);
			
			model.addAttribute("member", memVo);
			
			return "mypage/modify";
		}

		 @RequestMapping(value="/mypage/modifyPwd/{member_number}",method=RequestMethod.GET)
			public String modifyPwdForm(@PathVariable("member_number") Long member_number, RegisterRequest regReq, Model model) {
			 
				Member memVo = manageService.myPage(member_number);
				
				model.addAttribute("member", memVo);
				model.addAttribute("modifyPwd", new RegisterRequest());
				
				return "mypage/modifyPwd";
			}
		 

		 @RequestMapping(value="/mypage/modifyPwd/modifying/{member_number}",method=RequestMethod.POST)
			public String modifyPwd(@PathVariable("member_number") Long member_number, RegisterRequest regReq,  HttpServletResponse response, Model model, HttpSession session) throws IOException {
			 	response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
			 	String pwd = regReq.getPwd();
			 	String member_pwd = manageService.pwdFind(member_number);
			 	
				if(pwd != member_pwd) {
					
					out.println("<script>");
					out.println("alert('현재 비밀번호가 일치않습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					
				}
				
				manageService.pwdModify(member_number,regReq);
				Member memVo = dao.selectByMemberNum(member_number);
				model.addAttribute("member", memVo);
				
				return "redirect:/mypage/mypage/{member_number}";
			}
		 
		

		 @RequestMapping(value="/mypage/modify/{member_number}",method=RequestMethod.POST)
			public String modifyForm2(@PathVariable("member_number") Long member_number, Model model) {
			 
				Member memVo = manageService.myPage(member_number);
				model.addAttribute("member", memVo);
				return "/";
			}
		 

		
	    
		 @RequestMapping(value = "/admin/orderStatus/{msg}", method = RequestMethod.GET)
			public String orderStatusMsgG(@PathVariable("msg") String msg,Model model) {
				
				List<Order> orderwaitList = odao.orderwaitList();
				List<Order> deliveryCompleteList = odao.deliveryCompleteList();
				
				model.addAttribute("orderwaitList", orderwaitList);
				model.addAttribute("deliveryCompleteList", deliveryCompleteList);
				model.addAttribute("msg", msg);
				
				return "admin/ordercheck";
			}
		 
		 @RequestMapping(value = "/admin/orderStatus", method = RequestMethod.GET)
			public String orderStatusG(Model model) {
				
				List<Order> orderwaitList = odao.orderwaitList();
				List<Order> deliveryCompleteList = odao.deliveryCompleteList();
				
				model.addAttribute("orderwaitList", orderwaitList);
				model.addAttribute("deliveryCompleteList", deliveryCompleteList);

				
				return "admin/ordercheck";
			}

		 @RequestMapping(value = "/admin/delivery/{orderNum}", method = RequestMethod.GET)
		 public String deliveryG(@PathVariable("orderNum") int orderNum,Model model) {
				
				odao.delivery(orderNum);
				
				return "redirect:/admin/orderStatus";
		}
		 
		 @RequestMapping(value = "/mypage/orderStatus/{msg}", method = RequestMethod.GET)
			public String memOrderStatusMsgG(@PathVariable("msg") String msg, Model model,HttpSession session, HttpServletRequest request) {
			 
			 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				long member_number = authinfo.getMember_number();
				List<Order> info = odao.selectOrderinfo(member_number);
				
				model.addAttribute("info", info);
				model.addAttribute("msg", msg);
				
				return "mypage/ordercheck";
		}
		 
		 @RequestMapping(value = "/mypage/orderStatus", method = RequestMethod.GET)
			public String memOrderStatusG(Model model,HttpSession session, HttpServletRequest request) {
			 
			 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				long member_number = authinfo.getMember_number();
				List<Order> info = odao.selectOrderinfo(member_number);
				
				model.addAttribute("info", info);
				
				return "mypage/ordercheck";
		}
		 
	
	
}
