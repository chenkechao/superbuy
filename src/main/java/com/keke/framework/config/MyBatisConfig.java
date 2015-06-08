package com.keke.framework.config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
class MyBatisConfig extends DefaultDataSourceConfig{

	@Bean
    public SqlSessionFactoryBean configureSqlSessionFactoryBean() {
    	SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
    	bean.setDataSource(dataSource());
    	//bean.setMapperLocations(mapperLocations);
		return bean;
    }
    
    @Bean
    public SqlSessionTemplate configureSqlSessionTemplate(){
    	SqlSessionTemplate sqlSessionTemplate = null;
		try {
			sqlSessionTemplate = new SqlSessionTemplate(configureSqlSessionFactoryBean().getObject());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return sqlSessionTemplate;
    }

}
