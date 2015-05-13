package com.keke.shop.superbuy.config;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import com.keke.shop.superbuy.Application;
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
    	Map map = new HashMap();
    	map.put("/login", "anon");
    	map.put("/logout", "logout");
    	map.put("/styles/**", "anon");
    	map.put("/common/**", "anon");
    	map.put("/index", "authc");
    	dataSource.setFilterChainDefinitions(map.toString());
    	return dataSource;
    }

    @Bean
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