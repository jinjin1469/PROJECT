package spring.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import spring.dao.OrderDao;
import spring.vo.AuthInfo;
import spring.vo.Option;
import spring.vo.OrderSub;

@Controller
public class PaymentController {
	private OrderDao dao;

	public void setDao(OrderDao dao) {
		this.dao = dao;
	}
	
	private IamportClient api;
	
	public PaymentController() {
		this.api = new IamportClient("5478353111638089","38c701ccf0c5e1bb14f091d942224863eebfa6b285a8195735b0eaae973d6339abf549d563d49cf8");
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			,Locale locale
			,HttpSession session
			,@PathVariable(value= "imp_uid") String imp_uid,@RequestBody Map<String,String> param) throws IamportResponseException, IOException{
			
		long totalPrice = 0;
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		long member_number = authinfo.getMember_number();
		List<OrderSub> output = dao.productList(member_number);
		ArrayList<OrderSub> setdata = new ArrayList<OrderSub>();
		if(output!=null) {
			for(OrderSub p : output) {
				setdata.add(p);
				totalPrice += p.getProduct_price()*p.getProduct_count();
			}
		}
		for(int i=0; i<setdata.size();i++) {
			List<Option> optionOutput = dao.optionList(setdata.get(i).getCartoption_number());
			if(optionOutput!=null) {
				for(Option p : optionOutput) {
					totalPrice += p.getOption_Price()*p.getPayment_option_count();
				}
			}
		}
		
		long membershipPoint = dao.membershipPoint(member_number);
		
		long point = Long.parseLong(param.get("point"));
		if(point!=0) {
			totalPrice -= point;
		}
		if(totalPrice<30000) {
			totalPrice += 3000;
		}
		

		int DB_OrderTotalPrice = (int)totalPrice;
		BigDecimal pay = new BigDecimal(DB_OrderTotalPrice);
			
		IamportResponse<Payment> responsePrice = api.paymentByImpUid(imp_uid);
			
		CancelData cancel = new CancelData(imp_uid,true);
		if(point!=0&&membershipPoint!=0) {
			if(membershipPoint<point) {
				api.cancelPaymentByImpUid(cancel);
			}
		}
		
		if(!pay.equals(responsePrice.getResponse().getAmount())) {
			api.cancelPaymentByImpUid(cancel);
		}
		System.out.println("여기까지");
		return responsePrice;
	}
			
}
