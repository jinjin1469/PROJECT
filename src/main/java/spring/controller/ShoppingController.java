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

	
	//�옣諛붽뎄�땲 �긽�뭹 ���옣
	@RequestMapping(value = "/product/detail/addCart", method = RequestMethod.POST)
	public String insert(Cart cart, HttpSession session, HttpServletRequest request) {

		// �쁽�옱濡쒓렇�씤�맂 �젙蹂댁븣�븘�삤湲�

		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		ArrayList<CartOption> option = new ArrayList<CartOption>();

		// 濡쒓렇�씤 �뿬遺�瑜� 泥댄겕�븯湲� �쐞�빐 �꽭�뀡�뿉 ���옣�맂 �븘�씠�뵒 �솗�씤

		if (authinfo == null) {
			return "redirect:/member/login";
		}
		
		long member_number = authinfo.getMember_number();
		cart.setMember_number(member_number);
		shoppingService.insert(cart); // �옣諛붽뎄�땲 �뀒�씠釉붿뿉 ���옣�맖
		
		
		long cartoption_number = dao.selectCartNumber()-1;
		System.out.println("移댄듃�샃�뀡媛�" + cartoption_number);

		if(cart.getOptionList()!=null) {
			for(CartOption cartOption : cart.getOptionList()) {
			  cartOption.setCartoption_number(cartoption_number); 
			  dao.insertOption(cartOption);
			}
		}
		  

		return "redirect:/product/cart/list.do"; // �옣諛붽뎄�땲 紐⑸줉�쑝濡� �씠�룞
	}

	// �옣諛붽뎄�땲 �뿰寃�
	@RequestMapping("/product/cart/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav, Cart cart, Model model) {

		Map<String, Object> map = new HashMap<>();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
	
		
		if (authinfo == null){
			return new ModelAndView("member/login", "", null);
		}	
			
<<<<<<< HEAD
		    long member_number = authinfo.getMember_number();
			List<Cart> list = shoppingService.listCart(member_number);// 장바구니 목록
			
			
			int sumMoney = shoppingService.sumMoney(member_number);// 금액 합계
			int fee = sumMoney >= 30000 ? 0 : 3000; // 배송료 계산 30000원이 넘으면 배송료가 0원, 안넘으면 3000원
=======
			List<Cart> list = shoppingService.listCart(member_number);// �옣諛붽뎄�땲 紐⑸줉
		//	                  list.getCartoption_number();
		//	int sumMenuOption = shoppingService.sumMenuOption()
			int sumMoney = shoppingService.sumMoney(member_number);// 湲덉븸 �빀怨�
			int fee = sumMoney >= 30000 ? 0 : 3000; // 諛곗넚猷� 怨꾩궛 30000�썝�씠 �꽆�쑝硫� 諛곗넚猷뚭� 0�썝, �븞�꽆�쑝硫� 3000�썝
>>>>>>> ad7a9539bb51849743f2f8bbd56123937569d78e

			// hasp map�뿉 媛믩뱾�쓣 ���옣
			map.put("sumMoney", sumMoney);
			map.put("fee", fee); // 諛곗넚猷�
			map.put("sum", sumMoney + fee); // �쟾泥� 湲덉븸
			map.put("list", list); // �옣諛붽뎄�땲 紐⑸줉
			map.put("count", list.size()); // �젅肄붾뱶 媛��닔

			mav.setViewName("PRODUCT/cart"); // �씠�룞�븷 �럹�씠吏��쓽 �씠由�
			mav.addObject("map", map); // �뜲�씠�꽣 ���옣
			mav.addObject("aa" , 100);
			
			long waitingPayment = shoppingService.waitingPayment(member_number);
			model.addAttribute("waitingPayment", waitingPayment);
			model.addAttribute("Order", new Order());

			return mav; // �솕硫� �씠�룞

<<<<<<< HEAD
=======
		} else { // 濡쒓렇�씤�븯吏� �븡�� �긽�깭

			return new ModelAndView("member/login", "", null);

>>>>>>> ad7a9539bb51849743f2f8bbd56123937569d78e
		}

	
	//�옣諛붽뎄�땲 �긽�뭹 �궘�젣
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

	//�샃�뀡 �젙蹂� 遺덈윭�삤湲�
	@RequestMapping("/product/cartoption")
		public String optionlist(@RequestParam("cartoption_number") long cartoption_number, Model model, HttpSession session, ModelAndView mav) {
			
			Map<String, Object> map = new HashMap<>();
			AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			long member_number = authinfo.getMember_number();
			if (member_number != 0) {

				
				List<Cart> list1 = dao.listOptionCart(cartoption_number);// �옣諛붽뎄�땲 紐⑸줉
				

				ArrayList<Cart> cartOption = new ArrayList<Cart>();
				 
				if(list1!=null) {
					for(Cart c : list1) {
						cartOption.add(c);
					}
				}
				map.put("count", list1.size()); // �젅肄붾뱶 媛��닔
				
				model.addAttribute("Cart", new Cart());
				model.addAttribute("cartOption",cartOption);
				model.addAttribute("map", map);
				
				return "PRODUCT/cartoption"; 

			} else { // 濡쒓렇�씤�븯吏� �븡�� �긽�깭

				return "member/login";

			}

		}
	
	// �샃�뀡�닔�젙
	@RequestMapping("/product/cartoption/modifyOption")
	public String modifyOption(Model model, Cart cart, HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		// �쁽�옱濡쒓렇�씤�맂 �젙蹂댁븣�븘�삤湲�
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
			
				AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				long member_number = authinfo.getMember_number();
				ArrayList<CartOption> option = new ArrayList<CartOption>();

				// 濡쒓렇�씤 �뿬遺�瑜� 泥댄겕�븯湲� �쐞�빐 �꽭�뀡�뿉 ���옣�맂 �븘�씠�뵒 �솗�씤

				if (member_number == 0) {
					return "redirect:/member/login";
				}
			
				if(cart.getChange_option()!=null) {
					for(CartOption cartOption : cart.getChange_option()) {
					  dao.updateOption(cartOption);
					}
					out.println("<script>");
					out.println("alert('�닔�웾�씠 蹂�寃쎈릺�뿀�뒿�땲�떎.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}
		
		return "PRODUCT/cartoption";
	

	}
	
<<<<<<< HEAD

=======
	//�긽�뭹 �궘�젣
>>>>>>> ad7a9539bb51849743f2f8bbd56123937569d78e
	
	
	
	
	
	
	
	
	
	
	
}