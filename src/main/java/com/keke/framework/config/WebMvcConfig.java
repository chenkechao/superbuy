package com.keke.framework.config;

import static org.springframework.context.annotation.ComponentScan.Filter;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.handler.SimpleServletHandlerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.keke.Application;
import com.keke.framework.util.CP_PropertyEditorRegistrar;

@Configuration
@EnableWebMvc
@ComponentScan(basePackageClasses = Application.class, includeFilters = @Filter(Controller.class), useDefaultFilters = false)
class WebMvcConfig extends WebMvcConfigurationSupport {

    //private static final String MESSAGE_SOURCE = "/WEB-INF/i18n/messages";
    private static final String VIEWS = "/WEB-INF/views/";

    private static final String RESOURCES_HANDLER = "/resources/";
    private static final String RESOURCES_LOCATION = RESOURCES_HANDLER + "**";

    @Bean(name = "messageSource")
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        //messageSource.setBasename(MESSAGE_SOURCE);
        messageSource.setCacheSeconds(5);
        return messageSource;
    }

//    @Bean
//    public TemplateResolver templateResolver() {
//        TemplateResolver templateResolver = new ServletContextTemplateResolver();
//        templateResolver.setPrefix(VIEWS);
//        templateResolver.setSuffix(".html");
//        templateResolver.setTemplateMode("HTML5");
//        templateResolver.setCacheable(false);
//        return templateResolver;
//    }
//
//    @Bean
//    public SpringTemplateEngine templateEngine() {
//        SpringTemplateEngine templateEngine = new SpringTemplateEngine();
//        templateEngine.setTemplateResolver(templateResolver());
//        templateEngine.addDialect(new SpringSecurityDialect());
//        return templateEngine;
//    }
//
//    @Bean
//    public ThymeleafViewResolver viewResolver() {
//        ThymeleafViewResolver thymeleafViewResolver = new ThymeleafViewResolver();
//        thymeleafViewResolver.setTemplateEngine(templateEngine());
//        thymeleafViewResolver.setCharacterEncoding("UTF-8");
//        return thymeleafViewResolver;
//    }

    @Bean
	public ViewResolver viewResolver() {

		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix(VIEWS);
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
    
    @Override
    public Validator getValidator() {
        LocalValidatorFactoryBean validator = new LocalValidatorFactoryBean();
        validator.setValidationMessageSource(messageSource());
        return validator;
    }

    /**                                                          
     * 描述 : <HandlerMapping需要显示声明，否则不能注册资源访问处理器>. <br> 
     *<p> 
     	<这个比较奇怪,理论上应该是不需要的>  
      </p>                                                                                                                                                                                                                                                
     * @return                                                                                                      
     */ 
    @Bean
	public HandlerMapping resourceHandlerMapping() {
    	return super.resourceHandlerMapping();
    }
    
    /**                                                          
     * 描述 : <资源访问处理器>. <br> 
     *<p> 
     	<可以在jsp中使用/static/**的方式访问/WEB-INF/static/下的内容>  
      </p>                                                                                                                                                                                                                                                
     * @param registry                                                                                                      
     */  
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(RESOURCES_LOCATION).addResourceLocations(RESOURCES_HANDLER);
        registry.addResourceHandler("/diagram-viewer/**").addResourceLocations("/diagram-viewer/");
        registry.addResourceHandler("/editor-app/**").addResourceLocations("/editor-app/");
       
        registry.addResourceHandler("/api/**").addResourceLocations("/api/");
        registry.addResourceHandler("/editor/**").addResourceLocations("/editor/");
        registry.addResourceHandler("/explorer/**").addResourceLocations("/explorer/");
        registry.addResourceHandler("/libs/**").addResourceLocations("/libs/");
        registry.addResourceHandler("/**/*.html").addResourceLocations("/");
    }

    /**                                                          
     * 描述 : <本地化拦截器>. <br> 
     *<p> 
     	<使用方法说明>  
      </p>                                                                                                                                                                                                                                                
     * @return                                                                                                      
     */  
     @Bean
     public LocaleChangeInterceptor localeChangeInterceptor(){
     	return new LocaleChangeInterceptor();
     }
    
     /**                                                          
      * 描述 : <基于cookie的本地化资源处理器>. <br> 
      *<p> 
      	<使用方法说明>  
       </p>                                                                                                                                                                                                                                                
      * @return                                                                                                      
      */  
      @Bean(name="localeResolver")
      public CookieLocaleResolver cookieLocaleResolver(){
      	return new CookieLocaleResolver();
      }
     
      /**                                                          
       * 描述 : <注册自定义拦截器>. <br> 
       *<p> 
       	<使用方法说明>  
        </p>                                                                                                                                                                                                                                                
       * @return                                                                                                      
       */  
//       @Bean
//       public CP_InitializingInterceptor initializingInterceptor(){
//       	return new CP_InitializingInterceptor();
//       }
      
      /**                                                          
       * 描述 : <RequestMappingHandlerMapping需要显示声明，否则不能注册自定义的拦截器>. <br> 
       *<p> 
       	<这个比较奇怪,理论上应该是不需要的>  
        </p>                                                                                                                                                                                                                                                
       * @return                                                                                                      
       */ 
      @Override
      public RequestMappingHandlerMapping requestMappingHandlerMapping() {
          RequestMappingHandlerMapping requestMappingHandlerMapping = super.requestMappingHandlerMapping();
          requestMappingHandlerMapping.setUseSuffixPatternMatch(false);
          requestMappingHandlerMapping.setUseTrailingSlashMatch(false);
          return requestMappingHandlerMapping;
      }
      
      /**                                                          
       * 描述 : <添加拦截器>. <br> 
       *<p> 
       	<使用方法说明>  
        </p>                                                                                                                                                                                                                                                
       * @param registry                                                                                                      
       */  
       @Override
   	protected void addInterceptors(InterceptorRegistry registry) {
   		// TODO Auto-generated method stub
   		registry.addInterceptor(localeChangeInterceptor());
   		//registry.addInterceptor(initializingInterceptor());
   	}
      
       /**                                                          
   	* 描述 : <文件上传处理器>. <br> 
   	*<p> 
   		<使用方法说明>  
   	 </p>                                                                                                                                                                                                                                                
   	* @return                                                                                                      
   	*/  
   	@Bean(name="multipartResolver")
   	public CommonsMultipartResolver commonsMultipartResolver(){
   		return new CommonsMultipartResolver();
   	}
     
   	/**                                                          
	* 描述 : <异常处理器>. <br> 
	*<p> 
		<系统运行时遇到指定的异常将会跳转到指定的页面>  
	 </p>                                                                                                                                                                                                                                                
	* @return                                                                                                      
	*/  
//	@Bean(name="exceptionResolver")
//	public CP_SimpleMappingExceptionResolver simpleMappingExceptionResolver(){
//		logger.info("CP_SimpleMappingExceptionResolver");
//		CP_SimpleMappingExceptionResolver simpleMappingExceptionResolver= new CP_SimpleMappingExceptionResolver();
//		simpleMappingExceptionResolver.setDefaultErrorView("common_error");
//		simpleMappingExceptionResolver.setExceptionAttribute("exception");
//		Properties properties = new Properties();
//		properties.setProperty("java.lang.RuntimeException", "common_error");
//		simpleMappingExceptionResolver.setExceptionMappings(properties);
//		return simpleMappingExceptionResolver;
//	}
   	
       /**                                                          
        * 描述 : <RequestMappingHandlerAdapter需要显示声明，否则不能注册通用属性编辑器>. <br> 
        *<p> 
        	<这个比较奇怪,理论上应该是不需要的>  
         </p>                                                                                                                                                                                                                                                
        * @return                                                                                                      
        */ 
   	@Bean
   	public RequestMappingHandlerAdapter requestMappingHandlerAdapter() {
       	return super.requestMappingHandlerAdapter();
   	}
     
   	/**                                                          
	* 描述 : <注册通用属性编辑器>. <br> 
	*<p> 
		<这里只增加了字符串转日期和字符串两边去空格的处理>  
	 </p>                                                                                                                                                                                                                                                
	* @return                                                                                                      
	*/  
	@Override
	protected ConfigurableWebBindingInitializer getConfigurableWebBindingInitializer() {
		ConfigurableWebBindingInitializer initializer = super.getConfigurableWebBindingInitializer();
		CP_PropertyEditorRegistrar register = new CP_PropertyEditorRegistrar();
		register.setFormat("yyyy-MM-dd HH:mm");
		initializer.setPropertyEditorRegistrar(register);
		return initializer;
	}
   	
	 /**                                                          
	    * 描述 : <注册servlet适配器>. <br> 
	    *<p> 
	    	<只需要在自定义的servlet上用@Controller("映射路径")标注即可>  
	     </p>                                                                                                                                                                                                                                                
	    * @return                                                                                                      
	    */  
	    @Bean
	    public HandlerAdapter servletHandlerAdapter(){
	    	return new SimpleServletHandlerAdapter();
	    }
	
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    /**
     * Handles favicon.ico requests assuring no <code>404 Not Found</code> error is returned.
     */
    @Controller
    static class FaviconController {
        @RequestMapping("favicon.ico")
        String favicon() {
            return "forward:/resources/images/favicon.ico";
        }
    }
}
