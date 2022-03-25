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

import spring.intercepter.AuthCheckIntercepter;
import spring.intercepter.CategoryIntercepter;





@Configuration
@EnableWebMvc   // annotation-driven
public class MvcConfig extends WebMvcConfigurerAdapter{
					//  WebMvcConfigurer �씤�꽣�럹�씠�뒪媛� 援ы쁽

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		// mvc:default-servlet-handler 
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
		registry.addViewController("/member/joinChoice").setViewName("/member/joinChoice");
		registry.addViewController("/member/login").setViewName("/member/login");
		registry.addViewController("/member/join").setViewName("/member/join");
		registry.addViewController("/mypage/mypage").setViewName("/mypage/mypage");
		registry.addViewController("/member/register").setViewName("/member/register");
		registry.addViewController("/kakaologin").setViewName("main");
		registry.addViewController("/mXember/findIdSuccess").setViewName("/member/findIdSuccess");
		registry.addViewController("/admin/admin").setViewName("/admin/admin");
		
	}
	
	
	
	@Bean   //�궗�슜�븷 �씤�꽣�뀎�꽣 鍮�
	public AuthCheckIntercepter authCheckIntercepter() {
		return new AuthCheckIntercepter();
	}

	@Bean   //�궗�슜�븷 �씤�꽣�뀎�꽣 鍮�
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
		//registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/edit/**");
		

		
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
		
		

	}
	
	
	
	

}

