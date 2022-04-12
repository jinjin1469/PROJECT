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
	
	
	@RequestMapping(value="/order/review/insertReview", method=RequestMethod.POST)
		 public String reviewRegister(Model model, Review review ,Errors errors,HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			long member_number = authinfo.getMember_number();
			review.setMember_number(member_number);
			long order_number = review.getOrder_number();
			reviewService.reviewConfirm(order_number);
			
			reviewService.insert(review);
			List<Review> list = reviewService.listReview(order_number);
			
			
			
			
			model.addAttribute("list", list);
			
	
//		long product_number = qna.getProduct_number();
//			long num = qnaService.selectProNum(product_number);

			return "CATEGORY/categoryClose";
		}
	
	//�궡 由щ럭 紐⑥븘蹂닿린
	@RequestMapping(value="/mypage/myreviewlist")
	   public String myreviewList(Model model, HttpSession session, HttpServletRequest request) {
		   
		   AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
			
			if (authinfo == null) {
				return "redirect:/member/login";
			}
			long member_number = authinfo.getMember_number();
		   

			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			
			int section = Integer.parseInt((_section==null)?"1":_section);
			int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
			
			int totalCnt = dao.selectAllNumReivew(member_number);
			List<Review> review = dao.selectTargetReview(section, pageNum, member_number);
			
			request.setAttribute("totalCnt", totalCnt);
			request.setAttribute("section", section);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("review", review);
			
		   
//		   List<Review> review = reviewService.selectMylist(member_number);
		   model.addAttribute("review", review);
	 	   
		   return "mypage/myreviewlist";
	   }

	
	
	//관리자 전체 리뷰 모아보기
		@RequestMapping(value="/admin/adminReviewList")
		   public String reviewList(Model model, HttpSession session, HttpServletRequest request) {
			   
	    	String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			
			int section = Integer.parseInt((_section==null)?"1":_section);
			int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
			
			int totalCnt = dao.selectAllNumBoard();
			List<Review> review = dao.selectTargetBoard(section, pageNum);
			
			request.setAttribute("totalCnt", totalCnt);
			request.setAttribute("section", section);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("review", review);
			  
//			   List<Review> review = reviewService.selectReviewlist();
		   model.addAttribute("review", review);
	 	   
		   return "admin/adminReviewList";
		   }

	

}
