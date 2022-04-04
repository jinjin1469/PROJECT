package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.ShoppingDao;
import spring.service.ShoppingService;
import spring.vo.AuthInfo;
import spring.vo.Cart;
import spring.vo.CartOption;
import spring.vo.Member;
import spring.vo.Option;
import spring.vo.Order;
import spring.vo.Product;
import spring.vo.ProductCommand;
import spring.vo.RegisterRequest;

@Controller
public class ShoppingController {

	@Autowired
	ShoppingDao dao;

	AuthInfo authinfo;

	@Autowired
	private ShoppingService shoppingService;

	public void setShoppingService(ShoppingService shoppingService) {
		this.shoppingService = shoppingService;
	}

	
	
	@RequestMapping(value = "/product/detail/addCart", method = RequestMethod.POST)
	public String insert(Cart cart, HttpSession session, HttpServletRequest request) {

		

		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		ArrayList<CartOption> option = new ArrayList<CartOption>();

		

		if (authinfo == null) {
			return "redirect:/member/login";
		}
		
		long member_number = authinfo.getMember_number();
		cart.setMember_number(member_number);
		shoppingService.insert(cart); 
		
		
		long cartoption_number = dao.selectCartNumber()-1;


		if(cart.getOptionList()!=null) {
			for(CartOption cartOption : cart.getOptionList()) {
			  cartOption.setCartoption_number(cartoption_number); 
			  dao.insertOption(cartOption);
			}
		}
		  

		return "redirect:/product/cart/list.do"; //
	}


	@RequestMapping("/product/cart/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav, Cart cart, Model model) {

		Map<String, Object> map = new HashMap<>();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
	
		
		if (authinfo == null){
			return new ModelAndView("member/login", "", null);
		}	
			

		    long member_number = authinfo.getMember_number();
				
			int sumMoney = shoppingService.sumMoney(member_number);// 금액 합계
			int fee = sumMoney >= 30000 ? 0 : 3000; // 배송료 계산 30000원이 넘으면 배송료가 0원, 안넘으면 3000원
			List<Cart> list = shoppingService.listCart(member_number);

			map.put("sumMoney", sumMoney);
			map.put("fee", fee); //배송료
			map.put("sum", sumMoney + fee); // 합계
			map.put("list", list); // 리스트
			map.put("count", list.size()); // 수량

			mav.setViewName("PRODUCT/cart"); 
			mav.addObject("map", map);
			mav.addObject("aa" , 100);
			
			long waitingPayment = shoppingService.waitingPayment(member_number);
			model.addAttribute("waitingPayment", waitingPayment);
			model.addAttribute("Order", new Order());

			return mav; 


}
	
	
	@RequestMapping("/product/delete")
	public String deleteCart(@RequestParam("cart_number") long cart_number, HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		shoppingService.delete(cart_number);
		/*
		 * out.println("<script>"); out.println("alert('�긽�뭹�씠 �궘�젣 �릺�뿀�뒿�땲�떎.');");
		 * out.println("</script>"); out.close();
		 */
		
        return "redirect:/product/cart/list.do";

		
	}


	@RequestMapping("/product/cartoption")
		public String optionlist(@RequestParam("cartoption_number") long cartoption_number, Model model, HttpSession session, ModelAndView mav) {
			
			Map<String, Object> map = new HashMap<>();
			AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			long member_number = authinfo.getMember_number();
			if (member_number != 0) {

				
				List<Cart> list1 = dao.listOptionCart(cartoption_number);// 
				

				ArrayList<Cart> cartOption = new ArrayList<Cart>();
				 
				if(list1!=null) {
					for(Cart c : list1) {
						cartOption.add(c);
					}
				}
				map.put("count", list1.size()); // 
				
				model.addAttribute("Cart", new Cart());
				model.addAttribute("cartOption",cartOption);
				model.addAttribute("map", map);
				
				return "PRODUCT/cartoption"; 

			} else { 

				return "member/login";

			}

		}
	

	@RequestMapping("/product/cartoption/modifyOption")
	public String modifyOption(Model model, Cart cart, HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {

				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
			
				AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				long member_number = authinfo.getMember_number();
				ArrayList<CartOption> option = new ArrayList<CartOption>();

			
				if (member_number == 0) {
					return "redirect:/member/login";
				}
			
				if(cart.getChange_option()!=null) {
					for(CartOption cartOption : cart.getChange_option()) {
					  dao.updateOption(cartOption);
					}
					out.println("<script>");
					out.println("alert('옵션이 삭제되었습니다');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}
		
		return "PRODUCT/cartoption";
	

	}
	
	
	
	
	
}