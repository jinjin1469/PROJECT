package spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.dao.CategoryDao;
import spring.dao.OrderDao;
import spring.vo.AuthInfo;
import spring.vo.Category;
import spring.vo.CategoryCommand;
import spring.vo.Member;
import spring.vo.Option;
import spring.vo.Order;
import spring.vo.OrderSub;
import spring.vo.ProductCategoryEdit;
import spring.vo.ProductCategoryEditList;

@Controller
@RequestMapping("/order")
public class OrderController {

	private OrderDao dao;

	public void setDao(OrderDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String PaymentP(Model model, Order order,HttpSession session, HttpServletRequest request) {
		
		
		if(order.getOrder_sub()!=null) {
			for (OrderSub input : order.getOrder_sub()) {
				if(1==input.getCheck_box()) {
					dao.productCountUpdate(input);
					dao.paymentWait(input);
				}
			}
		}
		Order orderSet = new Order();
		long totalPrice = 0;
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		long member_number = authinfo.getMember_number();
		//멤버십포인트
		long membershipPoint = dao.membershipPoint(member_number);
		Member member = dao.selectByMemberNum(member_number);
	
		List<OrderSub> output = dao.productList(member_number);
		ArrayList<OrderSub> setdata = new ArrayList<OrderSub>();
		if(output!=null) {
			for(OrderSub p : output) {
				setdata.add(p);
				totalPrice += p.getProduct_price()*p.getProduct_count();
			}
		}
		//상품리스트
		orderSet.setOrder_sub(setdata);
		for(int i=0; i<orderSet.getOrder_sub().size();i++) {
			List<Option> optionOutput = dao.optionList(orderSet.getOrder_sub().get(i).getCartoption_number());
			ArrayList<Option> optionSetData = new ArrayList<Option>();
			if(optionOutput!=null) {
				for(Option p : optionOutput) {
					optionSetData.add(p);
					totalPrice += p.getOption_Price()*p.getPayment_option_count();
				}
			}
			//상품옵션리스트
			orderSet.getOrder_sub().get(i).setOption_sub(optionSetData);
		}
		model.addAttribute("Order", new Order(
				member_number,
				orderSet.getOrder_sub()
				));
		model.addAttribute("Product", orderSet.getOrder_sub());
		model.addAttribute("membershipPoint", membershipPoint);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("member", member);
		
		return "order/order";
	}
	@RequestMapping(value = "/paymentG", method = RequestMethod.GET)
	public String PaymentG(Model model, Order order,HttpSession session, HttpServletRequest request) {
		
		Order orderSet = new Order();
		long totalPrice = 0;
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		long member_number = authinfo.getMember_number();
		//멤버십포인트
		long membershipPoint = dao.membershipPoint(member_number);
		Member member = dao.selectByMemberNum(member_number);
	
		List<OrderSub> output = dao.productList(member_number);
		ArrayList<OrderSub> setdata = new ArrayList<OrderSub>();
		if(output!=null) {
			for(OrderSub p : output) {
				setdata.add(p);
				totalPrice += p.getProduct_price()*p.getProduct_count();
			}
		}
		//상품리스트
		orderSet.setOrder_sub(setdata);
		for(int i=0; i<orderSet.getOrder_sub().size();i++) {
			List<Option> optionOutput = dao.optionList(orderSet.getOrder_sub().get(i).getCartoption_number());
			ArrayList<Option> optionSetData = new ArrayList<Option>();
			if(optionOutput!=null) {
				for(Option p : optionOutput) {
					optionSetData.add(p);
					totalPrice += p.getOption_Price()*p.getPayment_option_count();
				}
			}
			//상품옵션리스트
			orderSet.getOrder_sub().get(i).setOption_sub(optionSetData);
		}
		model.addAttribute("Order", new Order(
				member_number,
				orderSet.getOrder_sub()
				));
		model.addAttribute("Product", orderSet.getOrder_sub());
		model.addAttribute("membershipPoint", membershipPoint);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("member", member);
		
		return "order/order";
	}
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancelG(Model model,HttpSession session, HttpServletRequest request) {
		
		
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		long member_number = authinfo.getMember_number();
		dao.paymentCancel(member_number);
		
		return "redirect:/product/cart/list.do";
	}
	
	@RequestMapping(value = "/orderInsert", method = RequestMethod.POST)
	public String OrderInsert32P(Model model, Order order,HttpSession session, HttpServletRequest request) {
		
		for(OrderSub deleteData : order.getOrder_sub()) {
			dao.deleteCart(deleteData.getCartoption_number());
			dao.deleteCartOption(deleteData.getCartoption_number());
		}
		dao.insertOrder(order);
		//joinnum
		int order_join_number = dao.order_join_number(order.getImp_uid());
		int option_join_number = 0;
		//list insert
		//수량 차감
		for(int i=0; i < order.getOrder_sub().size();i++) {
			order.getOrder_sub().get(i).setOrder_join_number(order_join_number);
			dao.insertProductList(order.getOrder_sub().get(i));
			dao.productDeduction(order.getOrder_sub().get(i));
			option_join_number = dao.option_join_number(order_join_number);
			for(Option option : order.getOrder_sub().get(i).getOption_sub()) {
				System.out.println(option.getOption_Count());
				System.out.println("여기");
				if(option.getPayment_option_count() !=0) {
					option.setOption_Join_Number(option_join_number);
					dao.insertOptionList(option);
					dao.optionDeduction(option);
				}
				
			}
		}
		//포인트 차감
		if(order.getUse_point()!=0) {
			dao.pointDeduction(order);
		}
		
		

		return "redirect:/order/orderStatus";
	}
	
	@RequestMapping(value = "/orderStatus", method = RequestMethod.GET)
	public String orderStatusG(Model model,HttpSession session, HttpServletRequest request) {
		
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		long member_number = authinfo.getMember_number();
		List<Order> info = dao.selectOrderinfo(member_number);
		String data = "";
		ArrayList<OrderSub> productData = new ArrayList<OrderSub>();
		ArrayList<Option> optionData = new ArrayList<Option>();

		for(int i=0;i<info.size();i++) {
			if(info.get(i).getRecipient()==null) {
				data = dao.recipient(member_number);
				info.get(i).setRecipient(data);
				data = dao.recipient_phone(member_number);
				info.get(i).setRecipient_phone(data);
				data = dao.recipient_address(member_number);
				info.get(i).setRecipient_address(data);
			}
			productData = (ArrayList<OrderSub>) dao.productListinfo(info.get(i).getOrder_join_number());
			info.get(i).setOrder_sub(productData);
			for(int j=0; j<info.get(i).getOrder_sub().size();j++) {
				optionData = (ArrayList<Option>) dao.optionListinfo(info.get(i).getOrder_sub().get(j).getOption_join_number());
				info.get(i).getOrder_sub().get(j).setOption_sub(optionData);
			}
		}

		model.addAttribute("info", info);

		return "order/orderStatus";
	}
	 
}
