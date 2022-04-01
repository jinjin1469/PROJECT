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

	
	//장바구니 상품 저장
	@RequestMapping(value = "/product/detail/addCart", method = RequestMethod.POST)
	public String insert(Cart cart, HttpSession session, HttpServletRequest request) {

		// 현재로그인된 정보알아오기

		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		ArrayList<CartOption> option = new ArrayList<CartOption>();

		// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인

		if (authinfo == null) {
			return "redirect:/member/login";
		}
		
		long member_number = authinfo.getMember_number();
		cart.setMember_number(member_number);
		shoppingService.insert(cart); // 장바구니 테이블에 저장됨
		
		
		long cartoption_number = dao.selectCartNumber()-1;
		System.out.println("카트옵션값" + cartoption_number);

		if(cart.getOptionList()!=null) {
			for(CartOption cartOption : cart.getOptionList()) {
			  cartOption.setCartoption_number(cartoption_number); 
			  dao.insertOption(cartOption);
			}
		}
		  

		return "redirect:/product/cart/list.do"; // 장바구니 목록으로 이동
	}

	// 장바구니 연결
	@RequestMapping("/product/cart/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav, Cart cart) {

		Map<String, Object> map = new HashMap<>();
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
	
		
		if (authinfo == null){
			return new ModelAndView("member/login", "", null);
		}	
			
		    long member_number = authinfo.getMember_number();
			List<Cart> list = shoppingService.listCart(member_number);// 장바구니 목록
			
			
			int sumMoney = shoppingService.sumMoney(member_number);// 금액 합계
			int fee = sumMoney >= 30000 ? 0 : 3000; // 배송료 계산 30000원이 넘으면 배송료가 0원, 안넘으면 3000원

			// hasp map에 값들을 저장
			map.put("sumMoney", sumMoney);
			map.put("fee", fee); // 배송료
			map.put("sum", sumMoney + fee); // 전체 금액
			map.put("list", list); // 장바구니 목록
			map.put("count", list.size()); // 레코드 갯수

			mav.setViewName("PRODUCT/cart"); // 이동할 페이지의 이름
			mav.addObject("map", map); // 데이터 저장
			mav.addObject("aa" , 100);
			
			

			return mav; // 화면 이동

		}

	
	//장바구니 상품 삭제
	@RequestMapping("/product/delete")
	public String deleteCart(@RequestParam("cart_number") long cart_number, HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		shoppingService.delete(cart_number);
		/*
		 * out.println("<script>"); out.println("alert('상품이 삭제 되었습니다.');");
		 * out.println("</script>"); out.close();
		 */
		
        return "redirect:/product/cart/list.do";

		
	}

	//옵션 정보 불러오기
	@RequestMapping("/product/cartoption")
		public String optionlist(@RequestParam("cartoption_number") long cartoption_number, Model model, HttpSession session, ModelAndView mav) {
			
			Map<String, Object> map = new HashMap<>();
			AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			long member_number = authinfo.getMember_number();
			if (member_number != 0) {

				
				List<Cart> list1 = dao.listOptionCart(cartoption_number);// 장바구니 목록
				

				ArrayList<Cart> cartOption = new ArrayList<Cart>();
				 
				if(list1!=null) {
					for(Cart c : list1) {
						cartOption.add(c);
					}
				}
				map.put("count", list1.size()); // 레코드 갯수
				
				model.addAttribute("Cart", new Cart());
				model.addAttribute("cartOption",cartOption);
				model.addAttribute("map", map);
				
				return "PRODUCT/cartoption"; 

			} else { // 로그인하지 않은 상태

				return "member/login";

			}

		}
	
	// 옵션수정
	@RequestMapping("/product/cartoption/modifyOption")
	public String modifyOption(Model model, Cart cart, HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		// 현재로그인된 정보알아오기
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
			
				AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
				long member_number = authinfo.getMember_number();
				ArrayList<CartOption> option = new ArrayList<CartOption>();

				// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인

				if (member_number == 0) {
					return "redirect:/member/login";
				}
			
				if(cart.getChange_option()!=null) {
					for(CartOption cartOption : cart.getChange_option()) {
					  dao.updateOption(cartOption);
					}
					out.println("<script>");
					out.println("alert('수량이 변경되었습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}
		
		return "PRODUCT/cartoption";
	

	}
	

	
	
	
	
	
	
	
	
	
	
	
}