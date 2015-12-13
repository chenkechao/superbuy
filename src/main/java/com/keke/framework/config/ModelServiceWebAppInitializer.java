package com.keke.framework.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.activiti.explorer.DispatcherServletConfiguration;
import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

@Order(2)
public class ModelServiceWebAppInitializer implements WebApplicationInitializer{
	
	public AnnotationConfigWebApplicationContext context;
	  
	  public void setContext(AnnotationConfigWebApplicationContext context) {
	    this.context = context;
	  }

	@Override
	public void onStartup(ServletContext servletcontext) throws ServletException {
		AnnotationConfigWebApplicationContext rootContext = null;
	    
//	    if (context == null) {
//	        rootContext = new AnnotationConfigWebApplicationContext();
//	        rootContext.register(ApplicationConfig.class);
//	        rootContext.register(HibernateConfig.class);
//	        rootContext.register(JpaConfig.class);
//	        rootContext.register(DefaultDataSourceConfig.class);
//	        rootContext.register(SecurityConfig.class);
//	        rootContext.register(MyBatisConfig.class);
//	        rootContext.register(ShiroConfig.class);
//	        rootContext.refresh();
//	    } else {
//	        rootContext = context;
//	    }
		rootContext = (AnnotationConfigWebApplicationContext) servletcontext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		
	    //servletcontext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, rootContext);
		
		AnnotationConfigWebApplicationContext dispatcherServletConfiguration = new AnnotationConfigWebApplicationContext();
		dispatcherServletConfiguration.setParent(rootContext);
	    dispatcherServletConfiguration.register(DispatcherServletConfiguration.class);
		ServletRegistration.Dynamic registration = servletcontext.addServlet("modelRestServlet", new DispatcherServlet(dispatcherServletConfiguration)); 
        registration.setLoadOnStartup(1); 
        registration.addMapping("/service/*"); 
	}

}
