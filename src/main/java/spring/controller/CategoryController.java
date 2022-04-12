package spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.dao.CategoryDao;
import spring.vo.Category;
import spring.vo.CategoryCommand;
import spring.vo.ProductCategoryEdit;
import spring.vo.ProductCategoryEditList;

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

		if (category.getClassification().equals("테마별")) {
			int seq = dao.categorySeq(category);
			dao.categoryDelete(category);
			dao.productCategoryNameNull1(category);
			int count = dao.menu1Count();
			if (seq <= count) {
				for (int i = seq; i <= count; i++) {
					dao.deleteBysortNumUpdate(i + 1, category.getClassification());
				}
			}
		} else if (category.getClassification().equals("사이드디쉬")) {
			int seq = dao.categorySeq(category);
			dao.categoryDelete(category);
			dao.productCategoryNameNull1(category);
			int count = dao.menu2Count();
			if (seq <= count) {
				for (int i = seq; i <= count; i++) {
					dao.deleteBysortNumUpdate(i + 1, category.getClassification());
				}
			}
		} else if (category.getClassification().equals("브랜드관")) {
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

	@RequestMapping(value = "/productCategoryEdit", method = RequestMethod.GET)
	public String productCategoryEditG(Model model) {

		List<Category> menu1 = dao.menu1();
		List<Category> menu2 = dao.menu2();
		List<Category> menu3 = dao.menu3();

		model.addAttribute("menu1", menu1);
		model.addAttribute("menu2", menu2);
		model.addAttribute("menu3", menu3);

		model.addAttribute("CategoryCommand", new CategoryCommand());

		return "CATEGORY/productCategoryEdit";
	}
	@RequestMapping(value = "/stopOrStartSelling", method = RequestMethod.GET)
	public String productSuspensionG(Model model) {

		List<Category> menu1 = dao.menu1();
		List<Category> menu2 = dao.menu2();
		List<Category> menu3 = dao.menu3();

		model.addAttribute("menu1", menu1);
		model.addAttribute("menu2", menu2);
		model.addAttribute("menu3", menu3);

		model.addAttribute("CategoryCommand", new CategoryCommand());

		return "CATEGORY/stopOrStartSelling";
	}
	
	  //ajax
	
	@ResponseBody
	@RequestMapping(value="/categoryCheck", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public Map<String,Object> testaa(@RequestBody Map<String,String> param,Model model){ 
		  
		  Map<String,Object> list = new HashMap<String,Object>();
		  List<ProductCategoryEditList> productList = new ArrayList<ProductCategoryEditList>();
		  String category_title = String.valueOf(param.get("category_title"));
		  String classification = String.valueOf(param.get("classification"));

		  ProductCategoryEdit input = new ProductCategoryEdit();
		  input.setCategory_title(category_title);
		  
		  if(category_title.equals("NULL")) {
			  if(classification.equals("category_1")) {
				  input.setCategory_1(classification);
			  }else if(classification.equals("category_2")) {
				  input.setCategory_2(classification);
			  }
			  productList = dao.nullCategorySelect(input);
		  }else{
			  if(classification.equals("category_1")) {
				  input.setCategory_1(classification);
			  }else if(classification.equals("category_2")) {
				  input.setCategory_2(classification);
			  }
			  productList = dao.categorySelect(input);
		  }
		  
		  list.put("category_title",category_title);
		  list.put("classification",classification);
		  list.put("productList",productList);

	  return list; 
	  }
	@ResponseBody
	@RequestMapping(value="/categoryRemoveCheck", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public Map<String,Object> testab(@RequestBody Map<String,String> param,Model model){ 
		  
		  Map<String,Object> list = new HashMap<String,Object>();
		  List<ProductCategoryEditList> productList = new ArrayList<ProductCategoryEditList>();
		  String category_title = String.valueOf(param.get("category_title"));
		  String classification = String.valueOf(param.get("classification"));

		  ProductCategoryEdit input = new ProductCategoryEdit();
		  input.setCategory_title(category_title);
		  
		  if(category_title.equals("NULL")) {
			  if(classification.equals("category_1")) {
				  input.setCategory_1(classification);
			  }else if(classification.equals("category_2")) {
				  input.setCategory_2(classification);
			  }
			  productList = dao.nullCategorySelect1(input);
		  }else{
			  if(classification.equals("category_1")) {
				  input.setCategory_1(classification);
			  }else if(classification.equals("category_2")) {
				  input.setCategory_2(classification);
			  }
			  productList = dao.categorySelect1(input);
		  }
		  
		  list.put("category_title",category_title);
		  list.put("classification",classification);
		  list.put("productList",productList);

	  return list; 
	  }
	@RequestMapping(value = "/stopSelling", method = RequestMethod.POST)
	public String stopSellingP(ProductCategoryEdit editList,Model model) {
		for(ProductCategoryEditList list : editList.getCategory_editList()) {
			if(list.getEdit_check()==1){
				dao.stopSelling(list);
			}
		}
		return "redirect:/";
	}
	@RequestMapping(value = "/startSelling", method = RequestMethod.POST)
	public String startSellingP(ProductCategoryEdit editList,Model model) {
		for(ProductCategoryEditList list : editList.getCategory_editList()) {
			if(list.getEdit_check()==1){
				if(list.getProduct_count()!=0) {
					dao.startSelling(list);
				}
				
			}
		}
		return "redirect:/";
	}
	@RequestMapping(value = "/productCategoryEdit", method = RequestMethod.POST)
	public String productCategoryEditP(ProductCategoryEdit editList,Model model) {
		String classification = editList.getClassification();
		for(ProductCategoryEditList list : editList.getCategory_editList()) {
			if(list.getEdit_check()==1){
				list.setProduct_name(editList.getCategory_title_change());
				list.setClassification(classification);
				dao.categoryUpdate(list);
			}
		}		
			
		return "redirect:/";
	}
	 
}
