package spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import spring.intercepter.AdminCheckIntercepter;
import spring.intercepter.AuthCheckIntercepter;
import spring.intercepter.CategoryIntercepter;





@Configuration
@EnableWebMvc  
public class MvcConfig extends WebMvcConfigurerAdapter{
					

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		
		configurer.enable();
	}
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// mvc:view-resolvers
		//registry.jsp().prefix("/WEB-INF/views/").suffix(".jsp");
		registry.jsp().prefix("/WEB-INF/views/");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// mvc:view-controller
//		registry.addViewController("/member/joinChoice").setViewName("/member/joinChoice");
		registry.addViewController("/member/login").setViewName("/member/login");
		registry.addViewController("/member/join").setViewName("/member/join");
		registry.addViewController("/mypage/mypage").setViewName("/mypage/mypage");
		registry.addViewController("/member/register").setViewName("/member/register");
		registry.addViewController("/kakaologin").setViewName("main");
		registry.addViewController("/member/findIdSuccess").setViewName("/member/findIdSuccess");
		registry.addViewController("/admin/admin").setViewName("/admin/admin");

	}
	
	
	
	
	
	@Bean   
	public AuthCheckIntercepter authCheckIntercepter() {
		return new AuthCheckIntercepter();
	}
	
	@Bean  
	public AdminCheckIntercepter adminCheckIntercepter() {
		return new AdminCheckIntercepter();
	}

	@Bean  
	public CategoryIntercepter categoryIntercepter() {
		return new CategoryIntercepter();
	}
	
	@Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
        ms.setBasenames("message.label");
        ms.setDefaultEncoding("UTF-8");
        return ms;
    }

	
	@Autowired
	private AuthCheckIntercepter authCheckIntercepter;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/category/**");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/admin/**");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/notice/insert");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/notice/update");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/notice/delete/**");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/order/adminCancle/**");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/product/update/**");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/product/insert");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/product/deleteCom");
		registry.addInterceptor(adminCheckIntercepter()).addPathPatterns("/mypage/qnalist");
		
		
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/logout");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/verifyIamport/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/mypage**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/modify**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/deleteAccount**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/modifyPwd/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/orderStatus**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/pointStatus");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/mypageQnaDetail/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/DeleteQueInMyPage/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/order/paymentG");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/order/cancel");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/order/purchaseConfirm");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/order/paymentCancle/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/order/review/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/order/orderDetail/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/product/qna**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/product/DeleteQue/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/myqnalist");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/mypage/myreviewlist");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/product/cart/**");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/product/delete");
		registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/product/cartoption**");
		
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/category/categoryInsert");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/category/categoryDelete");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/category/categorySequence");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/logout");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/member/**");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/mypage/**");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/admin/**");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/notice/**");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/product/**");
		registry.addInterceptor(categoryIntercepter()).addPathPatterns("/order/**");
		
		

	}
	
	
	
	

}

