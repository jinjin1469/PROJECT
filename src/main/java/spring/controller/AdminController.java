package spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;

import spring.dao.AdminDao;
import spring.dao.CategoryDao;
import spring.dao.OrderDao;
import spring.vo.Category;
import spring.vo.CategoryCommand;
import spring.vo.Option;
import spring.vo.Order;
import spring.vo.OrderSub;
import spring.vo.ProductCategoryEdit;
import spring.vo.ProductCategoryEditList;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private AdminDao adao;

	public void setDao(AdminDao adao) {
		this.adao = adao;
	}
	
	private OrderDao odao;

	public void setDao(OrderDao odao) {
		this.odao = odao;
	}
	 
}
