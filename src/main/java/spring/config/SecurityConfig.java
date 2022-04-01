package spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import spring.handler.CustomLoginSuccessHandler;

@Configuration 
public class SecurityConfig {
	
	
	protected void configure(HttpSecurity http) throws Exception {
	    http
	            .formLogin()
	            .loginPage("/member/login")
	            .successHandler(new CustomLoginSuccessHandler("/"))
	            .permitAll()
	           
	    ;
	}


	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    return new CustomLoginSuccessHandler("/defaultUrl");
	}

}
