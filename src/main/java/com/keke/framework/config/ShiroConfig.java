package com.keke.framework.config;


import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import com.keke.shop.superbuy.security.shiro.ShiroAuthorizingRealm;
import com.keke.shop.superbuy.security.shiro.ShiroDefinitionSectionMetaSource;

@Configuration
class ShiroConfig{

    @Bean
    public ShiroAuthorizingRealm configureShiroAuthorizingRealm() {
    	ShiroAuthorizingRealm dbRealm = new ShiroAuthorizingRealm();
        return dbRealm;
    }

    @Bean
    public DefaultWebSecurityManager configureDefaultWebSecurityManager() {
    	DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
    	manager.setRealm(configureShiroAuthorizingRealm());
		return manager;
    }
    
    @Bean
    public ShiroDefinitionSectionMetaSource configureShiroDefinitionSectionMetaSource(){
    	ShiroDefinitionSectionMetaSource dataSource = new ShiroDefinitionSectionMetaSource();
//    	Map map = new HashMap();
//    	map.put("/login", "anon");
//    	map.put("/logout", "logout");
//    	map.put("/styles/**", "anon");
//    	map.put("/common/**", "anon");
//    	map.put("/index", "authc");
    	String dd = "/login = anon" + "\n" +
				"/logout = logout" + "\n" +
				"/styles/** = anon" + "\n" +
				"/common/** = anon" +"\n" +
				"/index = authc";
    	dataSource.setFilterChainDefinitions(dd);
    	return dataSource;
    }

    @Bean(name="shiroFilter")
    @DependsOn(value="executor")
    public ShiroFilterFactoryBean configureShiroFilterFactoryBean() throws Exception {
    	ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
    	shiroFilter.setSecurityManager(configureDefaultWebSecurityManager());
    	shiroFilter.setLoginUrl("/login");
    	shiroFilter.setSuccessUrl("index");
    	shiroFilter.setUnauthorizedUrl("/common/403.jsp");
    	shiroFilter.setFilterChainDefinitionMap(configureShiroDefinitionSectionMetaSource().getObject());
    	return shiroFilter;
    }
}