package com.keke.shop.superbuy.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.cfg.ImprovedNamingStrategy;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import com.keke.shop.superbuy.Application;

@Configuration
class HibernateConfig{

    @Value("${dataSource.driverClassName}")
    private String driver;
    @Value("${dataSource.url}")
    private String url;
    @Value("${dataSource.username}")
    private String username;
    @Value("${dataSource.password}")
    private String password;
    @Value("${hibernate.dialect}")
    private String dialect;
    @Value("${hibernate.hbm2ddl.auto}")
    private String hbm2ddlAuto;

//    @Bean
//    public DataSource configureDataSource() {
//        HikariConfig config = new HikariConfig();
//        config.setDriverClassName(driver);
//        config.setJdbcUrl(url);
//        config.setUsername(username);
//        config.setPassword(password);
//        config.addDataSourceProperty("cachePrepStmts", "true");
//        config.addDataSourceProperty("prepStmtCacheSize", "250");
//        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
//        config.addDataSourceProperty("useServerPrepStmts", "true");
//
//        return new HikariDataSource(config);
//    }
    
    @Bean
    public DataSource configureDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean
    public LocalSessionFactoryBean configureLocalSessionFactoryBean() {
    	LocalSessionFactoryBean bean = new LocalSessionFactoryBean();
    	bean.setDataSource(configureDataSource());
    	bean.setPackagesToScan("com.keke.shop.superbuy");
    	bean.setMappingResources(null);
    	Properties p = new Properties();
    	p.put("hibernate.current_session_context_class", "org.springframework.orm.hibernate4.SpringSessionContext");
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
