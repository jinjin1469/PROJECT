package spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;





@Configuration
@EnableWebMvc   // annotation-driven
public class MvcConfig extends WebMvcConfigurerAdapter{
					//  WebMvcConfigurer 인터페이스가 구현

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
		registry.addViewController("/member/register").setViewName("/member/register");
		registry.addViewController("/kakaologin").setViewName("main");
		registry.addViewController("/member/mypage").setViewName("/member/mypage");
		
	}
	
	
	
//	@Bean   //사용할 인터셉터 빈
//	public AuthCheckIntercepter authCheckIntercepter() {
//		return new AuthCheckIntercepter();
//	}
//	
//	@Bean   //사용할 인터셉터 빈
//	public AuthCheckIntercepter2 authCheckIntercepter2() {
//		return new AuthCheckIntercepter2();
//	}
//	
//
//	@Autowired
//	private AuthCheckIntercepter authCheckIntercepter;
//	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		//registry.addInterceptor(authCheckIntercepter()).addPathPatterns("/edit/**");
//	}
	
	
	
	
}

