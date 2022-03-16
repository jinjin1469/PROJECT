package spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.dao.CategoryDao;
import spring.dao.MemberDao;
import spring.dao.ProductDao;
import spring.vo.Category;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	private CategoryDao dao;
	public void setDao(CategoryDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insertG(Model model) {
		
//		List<Category> data = dao.categoryAll();
		
//		model.addAttribute("CategoryData", data);
		model.addAttribute("Category", new Category());
		
		return "CATEGORY/categoryInsert";
	}
	
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertP(Model model) {
		
		
		return "redirect:/";
	}
}
