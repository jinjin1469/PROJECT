package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.dao.ReviewDao;
import spring.service.ReviewService;
import spring.vo.AuthInfo;
import spring.vo.Cart;
import spring.vo.Qna;
import spring.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewDao dao;
	public void setDao(ReviewDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private ReviewService reviewService;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	//리뷰 작성
	@RequestMapping(value="/order/review/insertReview", method=RequestMethod.POST)
		 public String reviewRegister(Model model, Review review ,Errors errors,HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			long member_number = authinfo.getMember_number();
			review.setMember_number(member_number);
			long order_number = review.getOrder_number();
			
			reviewService.insert(review);
			List<Review> list = reviewService.listReview(order_number);
			
			model.addAttribute("list", list);
			
			
			 out.println("<script>"); 
			 out.println("alert('리뷰가 등록되었습니다.');");
			 out.println("history.go(-1);");
			 out.println("</script>"); 
			 out.close();
			 
			 
//		long product_number = qna.getProduct_number();
//			long num = qnaService.selectProNum(product_number);

			return "redirect:/order/review/"+ order_number;
		}
	
	//내 리뷰 모아보기
	@RequestMapping(value="/mypage/myreviewlist")
	   public String myreviewList(Model model, HttpSession session) {
		   
		   AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			
			if (authinfo == null) {
				return "redirect:/member/login";
			}
	    	
			long member_number = authinfo.getMember_number();
		   
		   
		   List<Review> review = reviewService.selectMylist(member_number);
		   model.addAttribute("review", review);
	 	   
		   return "mypage/myreviewlist";
	   }


	

}
