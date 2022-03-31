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

import spring.dao.AdminDao;
import spring.dao.CategoryDao;
import spring.vo.Category;
import spring.vo.CategoryCommand;
import spring.vo.ProductCategoryEdit;
import spring.vo.ProductCategoryEditList;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private AdminDao dao;

	public void setDao(AdminDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/orderStatus", method = RequestMethod.GET)
	public String orderStatusG(Model model) {

		

		return "CATEGORY/categoryInsert";
	}

	@RequestMapping(value = "/orderStatus", method = RequestMethod.POST)
	public String orderStatusP(Model model) {

		
		return "CATEGORY/categoryClose";
	}

	
	 
}
