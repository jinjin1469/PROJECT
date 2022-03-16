package spring.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Locale;

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

@Controller
public class PaymentController {
	
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
			,@PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
		
	
			int DB_OrderTotalPrice = 300;
			BigDecimal pay = new BigDecimal(DB_OrderTotalPrice);
			
			IamportResponse<Payment> responsePrice = api.paymentByImpUid(imp_uid);
			
			CancelData cancel = new CancelData(imp_uid,true);

			if(!pay.equals(responsePrice.getResponse().getAmount())) {
				api.cancelPaymentByImpUid(cancel);
			}
			if(pay.equals(responsePrice.getResponse().getAmount())) {
				// DB insert부분
			}
			return responsePrice;
	}
			
}
