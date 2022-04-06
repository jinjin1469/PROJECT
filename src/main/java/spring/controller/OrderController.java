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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
import spring.vo.Product;
import spring.vo.ProductCategoryEdit;
import spring.vo.ProductCategoryEditList;
import spring.vo.Review;

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
					if(p.getPayment_option_count()!=0) {
						optionSetData.add(p);
						totalPrice += p.getOption_Price()*p.getPayment_option_count();
					}
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
					if(p.getPayment_option_count()!=0) {
						optionSetData.add(p);
						totalPrice += p.getOption_Price()*p.getPayment_option_count();
					}
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
	@RequestMapping(value = "/purchaseConfirm", method = RequestMethod.GET)
	 public String deliveryG(@RequestParam("orderNum") int orderNum,Model model) {
			
			Order order = dao.orderinfo(orderNum);
			dao.pointEarn(order);
			dao.purchaseConfirm(orderNum);
			
			return "redirect:/mypage/orderStatus";
	}
	
	@RequestMapping(value = "/paymentCancle/{order_number}", method = RequestMethod.GET)
	public String paymentCancelG(@PathVariable("order_number") int orderNum,Model model,HttpSession session, HttpServletRequest request) throws IamportResponseException, IOException{
		
		Order order = dao.orderinfo(orderNum);

		
		if(order.getPay_status().equals("결제완료")&&order.getOrder_status().equals("배송준비중")) {
			CancelData cancel = new CancelData(order.getImp_uid(),true);
			api.cancelPaymentByImpUid(cancel);
		}else {
			/* model.addAttribute("msg", "결제가 취소되어 있는 상품입니다."); */
			return "redirect:/mypage/orderStatus/"+"cancle";
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
		dao.paymentStatusEdit(orderNum);
		
		return "redirect:/mypage/orderStatus";
	}
	@RequestMapping(value = "/adminCancle/{order_number}", method = RequestMethod.GET)
	public String ApaymentCancelG(@PathVariable("order_number") int orderNum,Model model,HttpSession session, HttpServletRequest request) throws IamportResponseException, IOException{
		
		Order order = dao.orderinfo(orderNum);

		if(order.getPay_status().equals("결제완료")&&order.getOrder_status().equals("배송준비중")) {
			CancelData cancel = new CancelData(order.getImp_uid(),true);
			api.cancelPaymentByImpUid(cancel);
		}else {
			/* model.addAttribute("msg", "결제가 취소되어 있는 상품입니다."); */
			return "redirect:/admin/orderStatus/"+"cancle";
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
		dao.adminPaymentStatusEdit(orderNum);
		
		return "redirect:/admin/orderStatus";
	}
	
	@RequestMapping(value = "/orderInsert", method = RequestMethod.POST)
	public String OrderInsertP(Model model, Order order,HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException, IamportResponseException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		boolean p_countCheck = false;  // 남은수량보다 많이 주문한 경우
		boolean o_countCheck = false;  // 남은수량보다 많이 주문한 경우
		int product_countCheck = 0; // DB수량
		int option_countCheck = 0; // DB수량
		int product_result_count = 0; // DB수량에 주문수량을 뺀 수
		int option_result_count = 0; // DB수량에 주문수량을 뺀 수
		Order cancelList = new Order(); // List
		
		
		int p_i_n = 0; // 배열index
		int o_i_n = 0; // 배열index
		ArrayList<OrderSub> pdata = new ArrayList<OrderSub>();
		ArrayList<Option> odata;
		
		//수량 0개 체크
		for(int i=0; i < order.getOrder_sub().size();i++) {
			OrderSub cancelProduct = new OrderSub();
			p_countCheck = false;
			product_countCheck = dao.productCountCheck(order.getOrder_sub().get(i));
			product_result_count = product_countCheck - order.getOrder_sub().get(i).getProduct_count();
			
			if(product_result_count<0) {
				cancelProduct.setProduct_name(order.getOrder_sub().get(i).getProduct_name());
				cancelProduct.setProduct_count(Math.abs(product_result_count));
				p_countCheck = true;
			}
			o_i_n = 0;
			odata = new ArrayList<Option>();
			if(order.getOrder_sub().get(i).getOption_sub()!=null) {	
				for(Option option : order.getOrder_sub().get(i).getOption_sub()) {
					Option cancelOption = new Option();
					o_countCheck = false;
					option_countCheck =  dao.optionCountCheck(option);
					option_result_count = option_countCheck - option.getPayment_option_count();
					if(option_result_count<0) {
						if(o_i_n>0) {
							
							cancelOption.setOption_Name(option.getOption_Name());
							cancelOption.setOption_Count(Math.abs(option_result_count));
							p_countCheck = true;
							o_countCheck = true;
						}else {
							cancelProduct.setProduct_name(order.getOrder_sub().get(i).getProduct_name());
							cancelProduct.setProduct_count(Math.abs(product_result_count));
							cancelOption.setOption_Name(option.getOption_Name());
							cancelOption.setOption_Count(Math.abs(option_result_count));
							
							p_countCheck = true;
							o_countCheck = true;
						}
					}
					if(o_countCheck) {
						odata.add(cancelOption);
						o_i_n += 1;
					}
				}
			}
			if(p_countCheck) {
				if(odata!=null) {
					cancelProduct.setOption_sub(odata);
				}
				pdata.add(cancelProduct);
				p_i_n += 1;
			}
		}
		if(pdata!=null) {
			cancelList.setOrder_sub(pdata);
		}
		if(cancelList.getOrder_sub().size() != 0) {
			
			CancelData cancel = new CancelData(order.getImp_uid(),true);
			api.cancelPaymentByImpUid(cancel);

			out.println("<script>");
			out.print("alert('");
			out.print("재고부족으로 인한 결제취소List\\n\\n\\t[상품명](재고초과개수)\\n");
			for(int i = 0;i<cancelList.getOrder_sub().size();i++) {
				if(cancelList.getOrder_sub().get(i).getProduct_count()>0) {
				out.print("\\n["+cancelList.getOrder_sub().get(i).getProduct_name()+"]("+cancelList.getOrder_sub().get(i).getProduct_count()+"EA)");
				}else {
				out.print("\\n["+cancelList.getOrder_sub().get(i).getProduct_name()+"]");
				}
				if(cancelList.getOrder_sub().get(i).getOption_sub()!=null) {
					for(int j = 0;j<cancelList.getOrder_sub().get(i).getOption_sub().size();j++) {
						out.print("\\n\\t["+cancelList.getOrder_sub().get(i).getOption_sub().get(j).getOption_Name()+"]("+cancelList.getOrder_sub().get(i).getOption_sub().get(j).getOption_Count()+"EA)");
					}
				}
			}
			out.print("');");
		
			out.println("history.go(-1);");
			out.println("</script>");			
			out.flush();
			out.close();
			return "order/ordererror";
		}
		
		
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
		int product_zero_check = 0;
		int option_zero_check = 0;
		//list insert
		//수량 차감
		for(int i=0; i < order.getOrder_sub().size();i++) {
			order.getOrder_sub().get(i).setOrder_join_number(order_join_number);
			dao.insertProductList(order.getOrder_sub().get(i));
			product_zero_check = dao.productCountCheck(order.getOrder_sub().get(i));
			if(product_zero_check==order.getOrder_sub().get(i).getProduct_count()) {
				dao.productZero(order.getOrder_sub().get(i));
			}else {
				dao.productDeduction(order.getOrder_sub().get(i));
			}
			
			option_join_number = dao.option_join_number(order_join_number);
			if(order.getOrder_sub().get(i).getOption_sub()!=null) {
				for(Option option : order.getOrder_sub().get(i).getOption_sub()) {
					if(option.getPayment_option_count() !=0) {
						option.setOption_Join_Number(option_join_number);
						dao.insertOptionList(option);
						option_zero_check = dao.optionCountCheck(option);
						if(option_zero_check==option.getPayment_option_count()) {
							dao.optionZero(option);
						}else {
							dao.optionDeduction(option);
						}
						
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
	
	@RequestMapping(value = "/review/{order_number}", method = RequestMethod.GET)
	public String reviewG(@PathVariable("order_number") int order_number, Review review, Model model,HttpSession session, HttpServletRequest request) {
		Order info = dao.aaselectOrderinfo(order_number);
		ArrayList<OrderSub> productData = new ArrayList<OrderSub>();
		ArrayList<Option> optionData = new ArrayList<Option>();
		List<Review> list = dao.listReview(order_number);

		productData = (ArrayList<OrderSub>) dao.productListinfo(info.getOrder_join_number());
		info.setOrder_sub(productData);
		for(int j=0; j<info.getOrder_sub().size();j++) {
			optionData = (ArrayList<Option>) dao.optionListinfo(info.getOrder_sub().get(j).getOption_join_number());
			info.getOrder_sub().get(j).setOption_sub(optionData);
		}
		model.addAttribute("list", list);
		model.addAttribute("order_number", order_number);
		model.addAttribute("info", info);
		model.addAttribute("Review", new Review());
		return "PRODUCT/review";
	}
	
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
