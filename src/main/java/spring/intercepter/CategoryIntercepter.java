package spring.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.dao.CategoryDao;
import spring.dao.MemberDao;
import spring.vo.Category;

public class CategoryIntercepter extends HandlerInterceptorAdapter {

	private CategoryDao dao;
	public void setDao(CategoryDao dao) {
		// TODO Auto-generated method stub
		this.dao = dao;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		List<Category> menu1 = dao.menu1();
		List<Category> menu2 = dao.menu2();
		List<Category> menu3 = dao.menu3();
		
		modelAndView.addObject("menu1",menu1);
		modelAndView.addObject("menu2",menu2);
		modelAndView.addObject("menu3",menu3);

	}

	
	

}
