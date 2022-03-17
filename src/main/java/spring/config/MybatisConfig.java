package spring.config;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.DriverManagerDataSource;

import spring.dao.CategoryDao;
import spring.dao.MemberDao;
import spring.dao.NoticeDao;
import spring.dao.ProductDao;
import spring.dao.ShoppingDao;

@Configuration
public class MybatisConfig {

	 @Autowired
	    private ApplicationContext applicationContext;
	 
	 	@Value("${db.choice.driver}")
		private String driver;
		@Value("${db.choice.jdbcUrl}")
		private String jdbcUrl;
		@Value("${db.choice.user}")
		private String user;
		@Value("${db.choice.password}")
		private String password;
		
		@Bean
		public static PropertySourcesPlaceholderConfigurer properties() {
			PropertySourcesPlaceholderConfigurer configurer = 
					new PropertySourcesPlaceholderConfigurer();
			configurer.setLocation(new ClassPathResource("message/db.properties"));
			
			return configurer;
		}
	 
	 	@Bean
		public DataSource dataSource() {
			ComboPooledDataSource ds = new ComboPooledDataSource();
			
			try {
				ds.setDriverClass(driver);
			} catch (PropertyVetoException e) {
				e.printStackTrace();
			}
			ds.setJdbcUrl(jdbcUrl);
			ds.setUser(user);
			ds.setPassword(password);
			
			return ds;
		}
	    
	    @Bean
	    public SqlSessionFactory sqlSessionFactory() throws Exception {
	        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
	        sqlSessionFactoryBean.setDataSource(dataSource());
	        sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/config/mybatisConfig.xml"));
	        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mappers/*.xml"));
	        
	        return sqlSessionFactoryBean.getObject();
	    }
	    
	    
	    @Bean
	    public SqlSession sqlSession() throws Exception {
	        SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory());
	        return sqlSessionTemplate;
	    }

	    @Bean
		public MemberDao mdao() throws Exception {
			MemberDao dao = new MemberDao(sqlSession());
			return dao;
		}
	    
	    @Bean
		public NoticeDao ndao() throws Exception {
	    	NoticeDao dao = new NoticeDao(sqlSession());
			return dao;
		}
	    
	    @Bean
		public ProductDao pdao() throws Exception {
	    	ProductDao dao = new ProductDao(sqlSession());
			return dao;
		}
	    
	    @Bean
		public CategoryDao Cdao() throws Exception {
	    	CategoryDao dao = new CategoryDao(sqlSession());
			return dao;
		}
	    
	    @Bean
	    public ShoppingDao sdao() throws Exception{
	    	ShoppingDao dao = new ShoppingDao(sqlSession());
	    	return dao;
	    }
	  
	    
	    
	
}
