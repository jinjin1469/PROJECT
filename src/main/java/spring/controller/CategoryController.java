package spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.dao.CategoryDao;
import spring.vo.Category;
import spring.vo.CategoryCommand;
import spring.vo.ProductCategoryEdit;

@Controller
@RequestMapping("/category")
public class CategoryController {

	private CategoryDao dao;

	public void setDao(CategoryDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/categoryInsert", method = RequestMethod.GET)
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

	@RequestMapping(value = "/categoryInsert", method = RequestMethod.POST)
	public String categoryInsertP(Model model, Category category) {

		dao.categoryInsert(category);

		return "CATEGORY/categoryClose";
	}

	@RequestMapping(value = "/categoryDelete", method = RequestMethod.GET)
	public String categoryDeleteG(Model model) {

		model.addAttribute("Category", new Category());

		return "CATEGORY/categoryDelete";
	}

	@RequestMapping(value = "/categoryDelete", method = RequestMethod.POST)
	public String categoryDeleteP(Model model, Category category) {

		if (category.getClassification().equals("�뀒留덈퀎")) {
			int seq = dao.categorySeq(category);
			dao.categoryDelete(category);
			dao.productCategoryNameNull1(category);
			int count = dao.menu3Count();
			if (seq <= count) {
				for (int i = seq; i <= count; i++) {
					dao.deleteBysortNumUpdate(i + 1, category.getClassification());
				}
			}
		} else if (category.getClassification().equals("�궗�씠�뱶�뵒�돩")) {
			int seq = dao.categorySeq(category);
			dao.categoryDelete(category);
			dao.productCategoryNameNull1(category);
			int count = dao.menu2Count();
			if (seq <= count) {
				for (int i = seq; i <= count; i++) {
					dao.deleteBysortNumUpdate(i + 1, category.getClassification());
				}
			}
		} else if (category.getClassification().equals("釉뚮옖�뱶愿�")) {
			int seq = dao.categorySeq(category);
			dao.categoryDelete(category);
			dao.productCategoryNameNull2(category);
			int count = dao.menu3Count();
			if (seq <= count) {
				for (int i = seq; i <= count; i++) {
					dao.deleteBysortNumUpdate(i + 1, category.getClassification());
				}
			}
		}

		return "CATEGORY/categoryClose";
	}

	@RequestMapping(value = "/categorySequence", method = RequestMethod.GET)
	public String categorySequenceG(Model model) {

		int menu1Count = dao.menu1Count();
		int menu2Count = dao.menu2Count();
		int menu3Count = dao.menu3Count();

		model.addAttribute("menu1Count", menu1Count);
		model.addAttribute("menu2Count", menu2Count);
		model.addAttribute("menu3Count", menu3Count);
		model.addAttribute("CategoryCommand", new CategoryCommand());

		return "CATEGORY/categorySequence";
	}

	@RequestMapping(value = "/categorySequence", method = RequestMethod.POST)
	public String categorySequenceP(Model model, CategoryCommand category) {

		Category updateData = new Category();
		for (int i = 1; i <= category.getCategory_sort().size(); i++) {
			updateData.setCategory_title(category.getCategory_title().get(i - 1));
			updateData.setCategory_sort(category.getCategory_sort().get(i - 1));
			dao.categorySeqUpdate(updateData);
		}

		return "CATEGORY/categoryClose";
	}

	@RequestMapping(value = "/productCategoryEdit1", method = RequestMethod.GET)
	public String productCategoryEdit1G(Model model) {

		List<Category> menu1 = dao.menu1();
		List<Category> menu2 = dao.menu2();
		List<Category> menu3 = dao.menu3();

		model.addAttribute("menu1", menu1);
		model.addAttribute("menu2", menu2);
		model.addAttribute("menu3", menu3);

		model.addAttribute("CategoryCommand", new CategoryCommand());

		return "CATEGORY/productCategoryEdit";
	}

	
	  //ajax
	  
	  @RequestMapping(value="/categoryCheck", method = RequestMethod.POST)
	  public Map<String,Object> testaa(@RequestParam Map<String,Object> param,Model model){ 
		  
		  String aa = (String)param.get("category_title");
		  String bb = (String)param.get("classification");
		  System.out.println(aa);
		  System.out.println(bb);
		  
		  //model.addAttribute("totalPrice",200); // 
			/* List<HashMap<String, Object>> */
			/*
			 * Map resultMap = new HashMap(); resultMap.put("result1", "1");
			 * resultMap.put("result2", "2"); ModelAndView mav = new
			 * ModelAndView("jsonView",resultMap); mav.setViewName("jsonView");
			 */
		  Map<String,Object> list = new HashMap<String,Object>();
		  list.put("1",0);
		  list.put("2",1);
	  return list; 
	  }
	 
}
