package spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.net.ano.Service;
import spring.dao.QnaDao;

import spring.service.QnaService;
import spring.vo.AuthInfo;
import spring.vo.CartOption;
import spring.vo.Member;
import spring.vo.ProductCommand;
import spring.vo.Qna;
import spring.vo.RegisterRequest;

@Controller
public class QnaController {
	
	@Autowired
	QnaDao dao;

	@Autowired
	private QnaService qnaService;

	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
	

	//qna 글 작성 페이지로 이동
	@RequestMapping(value="/product/qna",method=RequestMethod.GET)
		public String myPage(@RequestParam("product_number") long product_number, Model model, HttpSession session, HttpServletRequest request){
		 	
		String product_name = qnaService.selectByNumber(product_number);
		System.out.println("product_name" + product_name);
		
		model.addAttribute("qna", new Qna());
		model.addAttribute("product_number", product_number);
		model.addAttribute("product_name", product_name);
			return "PRODUCT/qna";
					
					
		}
	
	//qna 글작성
	@RequestMapping(value="/product/qnainsert", method=RequestMethod.POST)
	 public String qnaRegister(Model model, Qna qna ,Errors errors,HttpServletResponse response, HttpSession session) {
		
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		long member_number = authinfo.getMember_number();
		qna.setMember_number(member_number);
		
		qnaService.insert(qna);
	
		return "/";
	}
	

	
}
