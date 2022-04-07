package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import oracle.net.ano.Service;
import spring.dao.QnaDao;
import spring.exception.AlreadyExistingMemberException;
import spring.service.QnaService;
import spring.vo.AuthInfo;
import spring.vo.CartOption;
import spring.vo.CommentWrite;
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

	//글 작성 페이지로 이동
	@RequestMapping(value="/product/qna",method=RequestMethod.GET)
		public String myPage1(@RequestParam("product_number") long product_number, Model model, HttpSession session, HttpServletRequest request){

		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		
		if (authinfo == null) {
			return "redirect:/member/login";
		}
		
		String product_name = qnaService.selectByNumber(product_number);
		
		model.addAttribute("qna", new Qna());
		model.addAttribute("product_number", product_number);
		model.addAttribute("product_name", product_name);
			return "PRODUCT/qna";
					
					
		}
	
	//qna 글작성
	@RequestMapping(value="/product/qnainsert", method=RequestMethod.POST)
	 public String qnaRegister(Model model, Qna qna ,Errors errors,HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");

		
		long member_number = authinfo.getMember_number();
		qna.setMember_number(member_number);
		qnaService.insert(qna);
		long product_number = qna.getProduct_number();
		long num = qnaService.selectProNum(product_number);

		return "redirect:/product/detail/"+ num;
	}
	
	
	
	//qna 세부 페이지 연결
    @RequestMapping(value="/product/qna/{qna_number}", method=RequestMethod.GET)
    public String qnaView(@PathVariable ("qna_number") long qna_number, @ModelAttribute("qna") Qna qna,HttpSession session, Model model, HttpServletResponse response) throws IOException {
    	response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		
		if (authinfo == null) {
			return "redirect:/member/login";
		}
    	
		long member_number = authinfo.getMember_number();
		long Writer = qnaService.selectQnaNumber(qna_number);

    	
    	
    	if(Writer != member_number && member_number != 10022 ){

			out.println("<script>");
			out.println("alert('작성자 본인만 읽을 수 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
    	}


    	int num = qnaService.selectByNum(qna_number);
    	Qna view = qnaService.selectQna(qna_number);
    	CommentWrite comment = qnaService.selectComment(qna_number);
    	
    
    	model.addAttribute("num", num);
    	model.addAttribute("comment", comment);
    	model.addAttribute("view", view);
    	model.addAttribute("qna", new Qna());
    	model.addAttribute("commentWrite", new CommentWrite());
		
    	return "PRODUCT/qnaDetail";
		}
	
    //qna 삭제
    @RequestMapping(value="/product/DeleteQue/{qna_number}")
    public String deletePost(@PathVariable("qna_number") long qna_number, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		qnaService.deleteQue(qna_number);
		
		return "PRODUCT/productDetail";
    }
    
    //코멘트 삭제
    @RequestMapping(value="/product/deleteCom")
    public String deleteCom(@RequestParam("comment_number") long comment_number, Qna qna, CommentWrite commentWrite, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	long qna_number = qnaService.selectCommentNumber(comment_number);
		qnaService.setStateWaiting(qna_number);
    	
		qnaService.deleteCom(comment_number);
		
		Qna view = qnaService.selectQna(qna_number);
    	CommentWrite comment = qnaService.selectComment(qna_number);
    	int num = qnaService.selectByNum(qna_number);
		
    	model.addAttribute("num", num);
    	model.addAttribute("comment", comment);
    	model.addAttribute("view", view);
    	model.addAttribute("qna", new Qna());
    	model.addAttribute("commentWrite", new CommentWrite());
    	
		return "PRODUCT/qnaDetail";
    }

    
    //qna 수정
    @RequestMapping(value="/qnaModify/{qna_number}", method=RequestMethod.POST)    
    public String modifyQue(@PathVariable("qna_number") long qna_number, Qna qna, Model model, HttpServletRequest request) {
    	
    	qnaService.update(qna);
    	Qna view = qnaService.selectQna(qna_number);
    	CommentWrite comment = qnaService.selectComment(qna_number);
    	int num = qnaService.selectByNum(qna_number);
    	
    	model.addAttribute("num", num);
    	model.addAttribute("comment", comment);
    	model.addAttribute("view", view);
    	model.addAttribute("qna", new Qna());
    	model.addAttribute("commentWrite", new CommentWrite());
    	
    	return "PRODUCT/qnaDetail";
    }
    
    //comment 수정
    @RequestMapping(value="/commentModify/{comment_number}", method=RequestMethod.POST)    
    public String modifyComment(@PathVariable("comment_number") long comment_number, Qna qna, CommentWrite commentWrite, Model model, HttpServletRequest request) {
    	
    	
    	qnaService.updateComment(commentWrite);
    	long qna_number = qnaService.selectCommentNumber(comment_number);
    	Qna view = qnaService.selectQna(qna_number);
    	CommentWrite comment = qnaService.selectComment(qna_number);
    	int num = qnaService.selectByNum(qna_number);
    	
    	
    	model.addAttribute("num", num);
    	model.addAttribute("comment", comment);
    	model.addAttribute("view", view);
    	model.addAttribute("qna", new Qna());
    	model.addAttribute("commentWrite", new CommentWrite());
    	
    	return "PRODUCT/qnaDetail";
    	
    }
    
    
    
 
    
    //관리자가 댓글 달기
    @RequestMapping(value="/product/qna/insertComment", method=RequestMethod.POST)
    public String insertComment(Model model, CommentWrite commentWrite, HttpSession session) {
    	
    	AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		
		if (authinfo == null) {
			return "redirect:/member/login";
		}
    	
		long member_number = authinfo.getMember_number();
		long qna_number = commentWrite.getQna_number();
		
		commentWrite.setMember_number(member_number);
		qnaService.insertCom(commentWrite);
		qnaService.setState(qna_number);
		
    	CommentWrite comment = qnaService.selectComment(qna_number);
		Qna view = qnaService.selectQna(qna_number);
		
		model.addAttribute("comment", comment);
    	model.addAttribute("view", view);
    	model.addAttribute("qna", new Qna());
    	model.addAttribute("commentWrite", new CommentWrite());
		
    
    	return "PRODUCT/qnaDetail";
    }
    
    
    
    
    //마이페이지에서 관리자가 qna 모아보기
    @RequestMapping(value="/mypage/qnalist")
    public String qnaList(Model model, HttpServletRequest request) {
    	
    	
    	String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		
		int section = Integer.parseInt((_section==null)?"1":_section);
		int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
		
		int totalCnt = dao.selectAllNumBoard();
		List<Qna> qna = dao.selectTargetBoard(section, pageNum);
    	
    	
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("section", section);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("qna", qna);
		
		
//    	List<Qna> qna=qnaService.selectlist();
    	model.addAttribute("qna", qna);
    	return "mypage/qnalist";
    }
    
  
    //마이페이지에서 내가 작성한 qna 모아보기 
   @RequestMapping(value="/mypage/myqnalist")
   public String myqnaList(Model model, HttpSession session) {
	   
	   AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		
		if (authinfo == null) {
			return "redirect:/member/login";
		}
    	
		long member_number = authinfo.getMember_number();
	   
	   
	   List<Qna> qna=qnaService.selectMylist(member_number);
	   model.addAttribute("qna", qna);
 	   
	   return "mypage/myqnalist";
   }
   
   
   //검색기능 ajax
   

   
   

}
	
	
	
	
	

	

