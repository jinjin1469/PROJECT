package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import spring.exception.AlreadyExistingEmailException;
import spring.exception.MemberDeactivateAccount;
import spring.service.ManageService;
import spring.vo.AuthInfo;
import spring.vo.CartOption;
import spring.vo.Login;
import spring.vo.Member;
import spring.vo.Order;
import spring.vo.RegisterRequest;
import spring.vo.Review;

@Controller
public class MyPageController {


	@Autowired
	MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

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
	

	 @RequestMapping(value="/mypage/mypage",method=RequestMethod.GET)
		public String myPage(Model model, HttpSession session) {
		 	
		 
		 AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		 	
		 if (authinfo == null) {
				return "redirect:/member/login";
			}
			
			long member_number = authinfo.getMember_number();
		 	
			Member memVo = manageService.myPage(member_number);
			List<Review> list = manageService.myReview(member_number);
			List<Order> memberPageOrderView = odao.memberPageOrderView(member_number);	
			
			
			int count = manageService.myPurchasesCount(member_number);
			int amount = manageService.myAmount(member_number);
				
			model.addAttribute("count", count);
			model.addAttribute("amount", amount);
			model.addAttribute("list",list);
			model.addAttribute("member", memVo);
			model.addAttribute("memberPageOrderView", memberPageOrderView);
			
			
			
			
			return "mypage/mypage";
		}
	 
	
		 @RequestMapping(value="/admin/admin/{member_number}",method=RequestMethod.GET)
			public String myPageAdmin(@PathVariable("member_number") Long member_number, Model model) {
			 
			 	
				Member memVo = manageService.myPage(member_number);
				List<Order> adminPageOrderView = odao.adminPageOrderView();	
				List<Review> list = manageService.ReviewList();
				int today_total_price = odao.today_total_price();
				int today_confirmation_price = odao.today_confirmation_price();
				
				model.addAttribute("today_total_price", today_total_price);
				model.addAttribute("today_confirmation_price", today_confirmation_price);
				model.addAttribute("adminPageOrderView", adminPageOrderView);
				model.addAttribute("member", memVo);
				model.addAttribute("list",list);
				
				return "admin/admin";
			}
		 
	 

	 @RequestMapping(value="/mypage/modify",method=RequestMethod.GET)
		public String modifyForm(Model model, HttpSession session) {
		 	
		 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		 	
		 if (authinfo == null) {
				return "redirect:/member/login";
			}
			
			long member_number = authinfo.getMember_number();
			Member memVo = manageService.myPage(member_number);
			
			model.addAttribute("member", memVo);
			model.addAttribute("modifyInfo", new RegisterRequest());
			
			return "mypage/modify";
		}
	 

	 @RequestMapping(value="/mypage/modifyInfo",method=RequestMethod.POST)
		public String modifyInfo(Model model, HttpSession session, RegisterRequest regReq,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	 	
		 AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		 	
		 if (authinfo == null) {
				return "redirect:/member/login";
			}
			
		 try {
			manageService.update(regReq);
			return "redirect:/mypage/modify";
		 }catch(AlreadyExistingEmailException e) {
			 	
			 	out.println("<script>");
				out.println("alert('이미 가입되어있는 이메일입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				
			 
			return "/mypage/mypage/";
		 }catch(MemberDeactivateAccount e) {
			 
			 out.println("<script>");
			 out.println("alert('탈퇴계정 이메일로 변경 불가능합니다.');");
			 out.println("history.go(-1);");
			 out.println("</script>");
			 out.close();
			 
				return "/mypage/mypage/";
			 
		 }
		 }


		 @RequestMapping(value="/mypage/modifyPwd",method=RequestMethod.GET)
			public String modifyPwdForm(HttpSession session,RegisterRequest regReq, Model model) {
			 	
			 AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			 	
			 	if (authinfo == null) {
					return "redirect:/member/login";
				}
				
				long member_number = authinfo.getMember_number();
				Member memVo = manageService.myPage(member_number);
				
				model.addAttribute("member", memVo);
				model.addAttribute("modifyPwd", new RegisterRequest());
				
				return "mypage/modifyPwd";
			}
		 

		 @RequestMapping(value="/mypage/modifying",method=RequestMethod.POST)
			public String modifyPwd(RegisterRequest regReq,  HttpServletResponse response, Model model, HttpSession session) throws IOException {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
			 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			 	
				long member_number = authinfo.getMember_number();
			
			try {
				
			 	String pwd = regReq.getPwd();
			 	String member_pwd = manageService.pwdFind(member_number);
			 	System.out.println("pwd" + pwd);
			 	System.out.println("member_pwd" + member_pwd);
			 	
				if(pwd.equals(member_pwd)) {
					manageService.pwdModify(member_number,regReq);
					Member memVo = dao.selectByMemberNum(member_number);
					model.addAttribute("member", memVo);
					
					return "/mypage/mypage";	
				}else if(!pwd.equals(member_pwd)) {
					out.println("<script>");
					out.println("alert('현재 비밀번호가 일치하지 않습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return "/mypage/modifyPwd";
				}
			return "/mypage/mypage";
			}catch(Exception e) {
				if(!regReq.isPasswordEqualToConfirmPassword()) {
					
					out.println("<script>");
					out.println("alert('비밀번호가 일치하지않습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					
					return "/mypage/modifyPwd";
				}
				return "/mypage/mypage";	
			  }
			}
			
		 


		
	    
		 @RequestMapping(value = "/admin/orderStatus/{msg}", method = RequestMethod.GET)
			public String orderStatusMsgG(@PathVariable("msg") String msg, HttpServletRequest request, Model model) {
			 	
			 	String _sectionOne = request.getParameter("sectionOne");
				String _pageNumOne = request.getParameter("pageNumOne");
				String _sectionTwo = request.getParameter("sectionTwo");
				String _pageNumTwo = request.getParameter("pageNumTwo");
				
				int sectionOne = Integer.parseInt((_sectionOne==null)?"1":_sectionOne);
				int pageNumOne = Integer.parseInt((_pageNumOne==null)?"1":_pageNumOne);
				int sectionTwo = Integer.parseInt((_sectionTwo==null)?"1":_sectionTwo);
				int pageNumTwo = Integer.parseInt((_pageNumTwo==null)?"1":_pageNumTwo);		 
			 
			 
				List<Order> orderwaitList = odao.orderwaitList(sectionOne,pageNumOne);
				List<Order> deliveryCompleteList = odao.deliveryCompleteList(sectionTwo,pageNumTwo);
				
				int totalCntOne = odao.orderwaitCnt();
				int totalCntTwo = odao.deliveryCompleteCnt();
				
				model.addAttribute("orderwaitList", orderwaitList);
				model.addAttribute("totalCntOne", totalCntOne);
				model.addAttribute("sectionOne", sectionOne);
				model.addAttribute("pageNumOne", pageNumOne);
				model.addAttribute("deliveryCompleteList", deliveryCompleteList);
				model.addAttribute("totalCntTwo", totalCntTwo);
				model.addAttribute("sectionTwo", sectionTwo);
				model.addAttribute("pageNumTwo", pageNumTwo);
				model.addAttribute("msg", msg);
				
				return "admin/ordercheck";
			}
		 
		 @RequestMapping(value = "/admin/orderStatus", method = RequestMethod.GET)
			public String orderStatusG(HttpServletRequest request, Model model) {
				
			 
			 	String _sectionOne = request.getParameter("sectionOne");
				String _pageNumOne = request.getParameter("pageNumOne");
				String _sectionTwo = request.getParameter("sectionTwo");
				String _pageNumTwo = request.getParameter("pageNumTwo");
				
				int sectionOne = Integer.parseInt((_sectionOne==null)?"1":_sectionOne);
				int pageNumOne = Integer.parseInt((_pageNumOne==null)?"1":_pageNumOne);
				int sectionTwo = Integer.parseInt((_sectionTwo==null)?"1":_sectionTwo);
				int pageNumTwo = Integer.parseInt((_pageNumTwo==null)?"1":_pageNumTwo);
				
				List<Order> orderwaitList = odao.orderwaitList(sectionOne,pageNumOne);
				List<Order> deliveryCompleteList = odao.deliveryCompleteList(sectionTwo,pageNumTwo);
				
				int totalCntOne = odao.orderwaitCnt();
				int totalCntTwo = odao.deliveryCompleteCnt();
			 
				
				model.addAttribute("orderwaitList", orderwaitList);
				model.addAttribute("totalCntOne", totalCntOne);
				model.addAttribute("sectionOne", sectionOne);
				model.addAttribute("pageNumOne", pageNumOne);
				model.addAttribute("deliveryCompleteList", deliveryCompleteList);
				model.addAttribute("totalCntTwo", totalCntTwo);
				model.addAttribute("sectionTwo", sectionTwo);
				model.addAttribute("pageNumTwo", pageNumTwo);
				return "admin/ordercheck";
			}

		 @RequestMapping(value = "/admin/delivery/{orderNum}", method = RequestMethod.GET)
		 public String deliveryG(@PathVariable("orderNum") int orderNum,Model model) {
				
				odao.delivery(orderNum);
				
				return "redirect:/admin/orderStatus";
		}
		 
		 @RequestMapping(value = "/mypage/orderStatus/{msg}", method = RequestMethod.GET)
			public String memOrderStatusMsgG(@PathVariable("msg") String msg, Model model,HttpSession session, HttpServletRequest request) {
			 
			 	String _section = request.getParameter("section");
				String _pageNum = request.getParameter("pageNum");
				
				int section = Integer.parseInt((_section==null)?"1":_section);
				int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
			 
			 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			 	int member_number = (int)authinfo.getMember_number();
				List<Order> info = odao.selectOrderinfo(member_number,section,pageNum);
				int totalCnt = odao.selectOrderCnt(member_number);
				
				model.addAttribute("totalCnt", totalCnt);
				model.addAttribute("section", section);
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("info", info);
				model.addAttribute("msg", msg);
				
				return "mypage/ordercheck";
		}
		 
		 @RequestMapping(value = "/mypage/orderStatus", method = RequestMethod.GET)
			public String memOrderStatusG(Model model,HttpSession session, HttpServletRequest request) {
			 
			 	String _section = request.getParameter("section");
				String _pageNum = request.getParameter("pageNum");
				
				int section = Integer.parseInt((_section==null)?"1":_section);
				int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
				
			 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				int member_number = (int)authinfo.getMember_number();
				List<Order> info = odao.selectOrderinfo(member_number,section,pageNum);
				
				int totalCnt = odao.selectOrderCnt(member_number);
				
				model.addAttribute("totalCnt", totalCnt);
				model.addAttribute("section", section);
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("info", info);
				
				return "mypage/ordercheck";
		}

		 
	

		 @RequestMapping(value = "/mypage/pointStatus", method = RequestMethod.GET)
			public String mempointStatusG(Model model,HttpSession session, HttpServletRequest request) {
			 
			 	String _section = request.getParameter("section");
				String _pageNum = request.getParameter("pageNum");
				
				int section = Integer.parseInt((_section==null)?"1":_section);
				int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
				
			 	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				long member_number = authinfo.getMember_number();
				long memberPoint = odao.membershipPoint(member_number);
				List<Order> info = odao.selectPointinfo((int)member_number,section,pageNum);
				int totalCnt = odao.selectOrderCnt((int)member_number);
				
				model.addAttribute("totalCnt", totalCnt);
				model.addAttribute("section", section);
				model.addAttribute("pageNum", pageNum);
				model.addAttribute("info", info);
				model.addAttribute("memberPoint", memberPoint);
				
				return "mypage/pointcheck";
		}

		 
		 
		 //회원 탈퇴 페이지연결
		 @RequestMapping(value="/mypage/deleteAccount",  method = RequestMethod.GET)
		 public String deleteAccount(Model model,HttpSession session, HttpServletRequest request) {
			 
			 AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			 	if (authinfo == null) {
					return "redirect:/member/login";
				}
			 	
			 	long member_number = authinfo.getMember_number();
				model.addAttribute("confirmPwd", new RegisterRequest());
			 
			 return "mypage/deleteAccount";
		 }
		 
		 
		 //회원 탈퇴진행
		 @RequestMapping(value="/mypage/delete",  method = RequestMethod.POST)
		 public String delete(Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response, RegisterRequest regReq) throws IOException {
			 
			 AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			 	if (authinfo == null) {
					return "redirect:/member/login";
				}
				
			 	long member_number = authinfo.getMember_number();
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
			 	String pwd = regReq.getPwd();
			 	String member_pwd = manageService.pwdFind(member_number);
			 	int orderWaiting = manageService.askStatus(member_number);
			 	
			 	
			 	if(!pwd.equals(member_pwd))  {
					out.println("<script>");
					out.println("alert('비밀번호가 일치않습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return "/mypage/deleteAccount";
			 	}else if(orderWaiting != 0) {
					out.println("<script>");
					out.println("alert('배송 준비 중인 상품이 있습니다. 주문 취소 또는 배송 완료 시 탈퇴 가능합니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return "/mypage/deleteAccount";
				}else{
				
					manageService.delete(member_number);
					session.invalidate(); //세션에 저장된 모든 데이터를 제거
				 }
				
			return "redirect:/";
		 }
		 
		 
	
}
