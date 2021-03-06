package com.keke.shop.superbuy.config.form.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.config.form.dao.DfFieldDao;
import com.keke.shop.superbuy.config.form.entity.DfField;


/**
 * 部门管理类
 * @author yuqs
 * @since 0.1
 */
@Component
@Transactional
public class DfFieldManager {
	//注入部门持久化对象
	@Autowired
	private DfFieldDao dfFieldDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存部门实体
	 * @param entity
	 */
	public void save(DfField entity) {
		dfFieldDao.save(entity);
	}
	
	public List<String> queryDfFieldNames(String tableName){
		List<DfField> list = dfFieldDao.findBy("tableName", tableName);
		List<String> nameList = new ArrayList<String>();
		for(DfField dfField:list){
			String fieldName = dfField.getFieldname();
			nameList.add(fieldName);
		}
		return nameList;
	}
	
	public static String fieldSQL(DfField dfField){
		String plugins = dfField.getPlugins();
		if(plugins.equalsIgnoreCase("textarea")
				||plugins.equalsIgnoreCase("listctrl")){
			return " TEXT";
		} else if(plugins.equalsIgnoreCase("text")){
			String type = dfField.getOrgtype();
			if("text".equals(type)) {
				return " VARCHAR(255) NOT NULL DEFAULT ''";
			}else if("int".equals(type)) {
				return " INT NOT NULL DEFAULT 0";
			}else if("float".equals(type)) {
				return " FLOAT";
			}else {
				return " VARCHAR(255) NOT NULL DEFAULT ''";
			}
		}else if(plugins.equalsIgnoreCase("radios")) {
			return " VARCHAR(255) NOT NULL DEFAULT ''";
		}else {
			return " VARCHAR(255) NOT NULL DEFAULT ''";
		}
	}
	
	public List<DfField> findByFormId(long formId){
		Criteria criteria = dfFieldDao.getSession().createCriteria(DfField.class);
		criteria.add(Expression.eq("formId", formId));
		List<DfField> dfFieldList = criteria.list();
		return dfFieldList;
	}
}
