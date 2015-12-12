package com.keke.framework.config;import org.activiti.explorer.DispatcherServletConfiguration;import org.springframework.orm.hibernate4.support.OpenSessionInViewFilter;import org.springframework.web.context.WebApplicationContext;import org.springframework.web.filter.CharacterEncodingFilter;import org.springframework.web.filter.DelegatingFilterProxy;import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;import javax.servlet.*;public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {    @Override    protected String[] getServletMappings() {        return new String[]{"/"};    }    @Override    protected Class<?>[] getRootConfigClasses() {        return new Class<?>[] {ApplicationConfig.class, JpaConfig.class,DefaultDataSourceConfig.class,SecurityConfig.class,        		MyBatisConfig.class,HibernateConfig.class,ShiroConfig.class};    }    @Override    protected Class<?>[] getServletConfigClasses() {        return new Class<?>[] {WebMvcConfig.class,DispatcherServletConfiguration.class};    }    @Override    protected Filter[] getServletFilters() {        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();        characterEncodingFilter.setEncoding("UTF-8");        characterEncodingFilter.setForceEncoding(true);                OpenSessionInViewFilter openSessionInViewFilter = new OpenSessionInViewFilter();        //DelegatingFilterProxy securityFilterChain = new DelegatingFilterProxy("springSecurityFilterChain");        DelegatingFilterProxy shiroFilterChain = new DelegatingFilterProxy("shiroFilterChain");        shiroFilterChain.setTargetBeanName("shiroFilter");                //return new Filter[] {characterEncodingFilter, securityFilterChain};        return new Filter[] {characterEncodingFilter,openSessionInViewFilter,shiroFilterChain};    }    @Override    protected void customizeRegistration(ServletRegistration.Dynamic registration) {        registration.setInitParameter("defaultHtmlEscape", "true");        registration.setInitParameter("spring.profiles.active", "default");    }        /*     * 创建一个可以在非spring管理bean中获得spring管理的相关bean的对象：CP_SpringContext.getBean(String beanName)     */	@Override	protected WebApplicationContext createRootApplicationContext() {		WebApplicationContext ctx = super.createRootApplicationContext();		return ctx;	}}