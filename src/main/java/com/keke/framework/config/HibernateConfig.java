package com.keke.framework.config;

import java.util.Properties;

import org.hibernate.cfg.ImprovedNamingStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;

@Configuration
class HibernateConfig extends DefaultDataSourceConfig{

    @Bean(name="sessionFactory")
    public LocalSessionFactoryBean configureLocalSessionFactoryBean() {
    	LocalSessionFactoryBean bean = new LocalSessionFactoryBean();
    	bean.setDataSource(dataSource());
    	bean.setPackagesToScan("com.keke");
    	bean.setMappingResources(null);
    	Properties p = new Properties();
    	p.put("hibernate.current_session_context_class", "org.springframework.orm.hibernate4.SpringSessionContext");
    	p.put("hibernate.show_sql", true);
    	bean.setHibernateProperties(p);
    	bean.setNamingStrategy(new ImprovedNamingStrategy());
    	bean.setHibernateProperties(null);
    	//bean.setMapperLocations(mapperLocations);
		return bean;
    }
    
    @Bean(name="transactionManager")
    public HibernateTransactionManager configureHibernateTransactionManager(){
    	HibernateTransactionManager transactionManager = new HibernateTransactionManager();
    	transactionManager.setSessionFactory(configureLocalSessionFactoryBean().getObject());
    	return transactionManager;
    }

}
