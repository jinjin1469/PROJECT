package spring.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


import spring.dao.MemberDao;
import spring.dao.OrderDao;
import spring.dao.ProductDao;
import spring.vo.Category;
import spring.vo.Member;
import spring.vo.Product;

@Controller
public class MainController {

	private ProductDao dao;
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/")
	public String main(HttpServletRequest request,Model model) {
		
		List<Product> bestProductList = dao.mainBest();
		List<Product> randomProductList = dao.mainRandom();
		List<Product> NewProductList = dao.mainNew();
		model.addAttribute("Product1", bestProductList);
		model.addAttribute("Product2", randomProductList);
		model.addAttribute("Product3", NewProductList);
		model.addAttribute("price", 123);
		
		return "main";
	}
	
}
