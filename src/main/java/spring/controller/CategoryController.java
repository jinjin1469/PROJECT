package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.dao.CategoryDao;
import spring.dao.MemberDao;
import spring.dao.ProductDao;
import spring.vo.Category;
import spring.vo.CategoryCannand;
import spring.vo.Option;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	private CategoryDao dao;
	public void setDao(CategoryDao dao) {
		this.dao = dao;
	}
	@RequestMapping(value="/categoryInsert",method=RequestMethod.GET)
	public String categoryInsertG(Model model) {
		
		int menu1Count = dao.menu1Count();
		int menu2Count = dao.menu2Count();
		int menu3Count = dao.menu3Count();
		
		model.addAttribute("menu1Count", menu1Count);
		model.addAttribute("menu2Count", menu2Count);
		model.addAttribute("menu3Count", menu3Count);
		model.addAttribute("Category", new Category());
		
		
		return "CATEGORY/categoryInsert";
	}
	@RequestMapping(value="/categoryInsert",method=RequestMethod.POST)
	public String categoryInsertP(Model model,Category category) {
		
		dao.categoryInsert(category);
		
		return "CATEGORY/categoryClose";
	}
	@RequestMapping(value="/categoryDelete",method=RequestMethod.GET)
	public String categoryDeleteG(Model model) {
		

		model.addAttribute("Category", new Category());
		
		
		return "CATEGORY/categoryDelete";
	}
	@RequestMapping(value="/categoryDelete",method=RequestMethod.POST)
	public String categoryDeleteP(Model model,Category category) {
		
		if(category.getClassification().equals("테마별")){
			System.out.println("0");
			int seq = dao.categorySeq(category);
			System.out.println("1");
			dao.categoryDelete(category);
			System.out.println("2");
			dao.productCategoryNameNull1(category);
			System.out.println("3");
			int count = dao.menu3Count();
			if(seq<=count) {
				for(int i=seq;i<=count;i++) {
					dao.deleteBysortNumUpdate(i+1,category.getClassification());
				}
			}
		}else if(category.getClassification().equals("사이드디쉬")){
			int seq = dao.categorySeq(category);
			System.out.println("4");
			dao.categoryDelete(category);
			System.out.println("5");
			dao.productCategoryNameNull1(category);
			System.out.println("6");
			int count = dao.menu2Count();
			if(seq<=count) {
				for(int i=seq;i<=count;i++) {
					dao.deleteBysortNumUpdate(i+1,category.getClassification());
				}
			}
		}else if(category.getClassification().equals("브랜드관")){
			int seq = dao.categorySeq(category);
			System.out.println("7");
			dao.categoryDelete(category);
			System.out.println("8");
			dao.productCategoryNameNull2(category);
			System.out.println("9");
			int count = dao.menu3Count();
			if(seq<=count) {
				for(int i=seq;i<=count;i++) {
					dao.deleteBysortNumUpdate(i+1,category.getClassification());
				}
			}
		}
		
		return "CATEGORY/categoryClose";
	}

	@RequestMapping(value="/categorySequence",method=RequestMethod.GET)
	public String categorySequenceG(Model model) {
		
		int menu1Count = dao.menu1Count();
		int menu2Count = dao.menu2Count();
		int menu3Count = dao.menu3Count();
		
		model.addAttribute("menu1Count", menu1Count);
		model.addAttribute("menu2Count", menu2Count);
		model.addAttribute("menu3Count", menu3Count);
		model.addAttribute("CategoryCannand", new CategoryCannand());
		
		
		return "CATEGORY/categorySequence";
	}
	
	
	@RequestMapping(value="/categorySequence",method=RequestMethod.POST)
	public String categorySequenceP(Model model,CategoryCannand category) {
		
		
		Category updateData = new Category();
		updateData.setClassification(category.getClassification());
		for(int i=1;i<=category.getCategory_sort().size();i++) {
			updateData.setCategory_title(category.getCategory_title().get(i-1));
			updateData.setCategory_sort(category.getCategory_sort().get(i-1));
			dao.categorySeqUpdate(updateData);
		}
		
		return "CATEGORY/categoryClose";
	}
}
