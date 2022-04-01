package spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;

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
	
	private IamportClient api;
	
	public OrderController() {
		this.api = new IamportClient("5478353111638089","38c701ccf0c5e1bb14f091d942224863eebfa6b285a8195735b0eaae973d6339abf549d563d49cf8");
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
	@RequestMapping(value = "/status/{orderNum}", method = RequestMethod.GET)
	 public String deliveryG(@PathVariable("orderNum") int orderNum,Model model) {
			
			dao.purchaseConfirm(orderNum);
			
			return "redirect:/mypage/orderStatus";
	}
	
	@RequestMapping(value = "/paymentCancle/{order_number}", method = RequestMethod.GET)
	public String paymentCancelG(@PathVariable("order_number") int orderNum,Model model,HttpSession session, HttpServletRequest request) throws IamportResponseException, IOException{
		
		Order order = dao.orderinfo(orderNum);

		if(order.getPay_status().equals("결제완료")) {
			CancelData cancel = new CancelData(order.getImp_uid(),true);
			api.cancelPaymentByImpUid(cancel);
		}else {
			model.addAttribute("msg", "결제가 취소되어 있는 상품입니다.");
			return "redirect:/mypage/orderStatus";
		}
		
		order.setOrder_sub((ArrayList<OrderSub>) dao.productListinfo(order.getOrder_join_number()));
		ArrayList<Option> optionData = new ArrayList<Option>();
		for(int i=0; i<order.getOrder_sub().size();i++) {
			optionData = (ArrayList<Option>) dao.optionListinfo(order.getOrder_sub().get(i).getOption_join_number());
			order.getOrder_sub().get(i).setOption_sub(optionData);
		}
	
		//수량 원복
		for(int i=0; i < order.getOrder_sub().size();i++) {
			dao.productRollBack(order.getOrder_sub().get(i));
			for(Option option : order.getOrder_sub().get(i).getOption_sub()) {
				if(option.getOption_Count() !=0) {
					dao.optionRollBack(option);
				}
			}
		}
		//포인트 원복
		if(order.getUse_point()!=0) {
			dao.pointRollBack(order);
		}
		
		//결제취소로 변경
		dao.payment_status_edit(orderNum);
		
		return "redirect:/mypage/orderStatus";
	}
	@RequestMapping(value = "/adminCancle/{order_number}", method = RequestMethod.GET)
	public String ApaymentCancelG(@PathVariable("order_number") int orderNum,Model model,HttpSession session, HttpServletRequest request) throws IamportResponseException, IOException{
		
		Order order = dao.orderinfo(orderNum);

		if(order.getPay_status().equals("결제완료")) {
			CancelData cancel = new CancelData(order.getImp_uid(),true);
			api.cancelPaymentByImpUid(cancel);
		}else {
			model.addAttribute("msg", "결제가 취소되어 있는 상품입니다.");
			return "redirect:/admin/orderStatus";
		}
		
		order.setOrder_sub((ArrayList<OrderSub>) dao.productListinfo(order.getOrder_join_number()));
		ArrayList<Option> optionData = new ArrayList<Option>();
		for(int i=0; i<order.getOrder_sub().size();i++) {
			optionData = (ArrayList<Option>) dao.optionListinfo(order.getOrder_sub().get(i).getOption_join_number());
			order.getOrder_sub().get(i).setOption_sub(optionData);
		}
	
		//수량 원복
		for(int i=0; i < order.getOrder_sub().size();i++) {
			dao.productRollBack(order.getOrder_sub().get(i));
			for(Option option : order.getOrder_sub().get(i).getOption_sub()) {
				if(option.getOption_Count() !=0) {
					dao.optionRollBack(option);
				}
			}
		}
		//포인트 원복
		if(order.getUse_point()!=0) {
			dao.pointRollBack(order);
		}
		
		//결제취소로 변경
		dao.payment_status_edit(orderNum);
		
		return "redirect:/admin/orderStatus";
	}
	
	@RequestMapping(value = "/orderInsert", method = RequestMethod.POST)
	public String OrderInsertP(Model model, Order order,HttpSession session, HttpServletRequest request) {

		for(OrderSub deleteData : order.getOrder_sub()) {
			dao.deleteCart(deleteData.getCartoption_number());
			if(deleteData.getOption_sub()!=null) {
				dao.deleteCartOption(deleteData.getCartoption_number());	
			}
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
			if(order.getOrder_sub().get(i).getOption_sub()!=null) {
				for(Option option : order.getOrder_sub().get(i).getOption_sub()) {
					if(option.getPayment_option_count() !=0) {
						option.setOption_Join_Number(option_join_number);
						dao.insertOptionList(option);
						dao.optionDeduction(option);
					}
				}
			}
		}
		//포인트 차감
		if(order.getUse_point()!=0) {
			dao.pointDeduction(order);
		}
		
		return "redirect:/mypage/orderStatus";
	}
	
//	@RequestMapping(value = "/orderStatus", method = RequestMethod.GET)
//	public String orderStatusG(Model model,HttpSession session, HttpServletRequest request) {
//		
//		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
//		long member_number = authinfo.getMember_number();
//		List<Order> info = dao.selectOrderinfo(member_number);
//		String data = "";
//		ArrayList<OrderSub> productData = new ArrayList<OrderSub>();
//		ArrayList<Option> optionData = new ArrayList<Option>();
//
//		for(int i=0;i<info.size();i++) {
//			if(info.get(i).getRecipient()==null) {
//				data = dao.recipient(member_number);
//				info.get(i).setRecipient(data);
//				data = dao.recipient_phone(member_number);
//				info.get(i).setRecipient_phone(data);
//				data = dao.recipient_address(member_number);
//				info.get(i).setRecipient_address(data);
//			}
//			productData = (ArrayList<OrderSub>) dao.productListinfo(info.get(i).getOrder_join_number());
//			info.get(i).setOrder_sub(productData);
//			for(int j=0; j<info.get(i).getOrder_sub().size();j++) {
//				optionData = (ArrayList<Option>) dao.optionListinfo(info.get(i).getOrder_sub().get(j).getOption_join_number());
//				info.get(i).getOrder_sub().get(j).setOption_sub(optionData);
//
//			}
//		}
//
//		model.addAttribute("info", info);
//
//		return "order/orderStatus";
//	}
	
	@RequestMapping(value = "/orderDetail/{order_number}", method = RequestMethod.GET)
	public String orderStatusG(@PathVariable("order_number") int order_number,Model model,HttpSession session, HttpServletRequest request) {
		Order info = dao.aaselectOrderinfo(order_number);
		String data = "";
		ArrayList<OrderSub> productData = new ArrayList<OrderSub>();
		ArrayList<Option> optionData = new ArrayList<Option>();
		if(info.getRecipient()==null) {
			data = dao.recipient(info.getMember_number());
			info.setRecipient(data);
			data = dao.recipient_phone(info.getMember_number());
			info.setRecipient_phone(data);
			data = dao.recipient_address(info.getMember_number());
			info.setRecipient_address(data);
		}
		productData = (ArrayList<OrderSub>) dao.productListinfo(info.getOrder_join_number());
		info.setOrder_sub(productData);
		for(int j=0; j<info.getOrder_sub().size();j++) {
			optionData = (ArrayList<Option>) dao.optionListinfo(info.getOrder_sub().get(j).getOption_join_number());
			info.getOrder_sub().get(j).setOption_sub(optionData);
		}
		model.addAttribute("info", info);

		return "order/orderDetail";
	}
	
}
