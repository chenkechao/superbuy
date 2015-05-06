package com.keke.shop.superbuy.form.config;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FieldRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional
	public boolean saveDfField(DfField dfField){
		entityManager.persist(dfField);
		return true;
	}
	
	public List<String> queryDfFieldNames(String tableName){
		Query query = entityManager.createNamedQuery(DfField.FIND_NAMES)
				.setParameter("tableName", tableName);
		List<String> list = query.getResultList();
		return list;
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
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<DfField> criterQUery = criteriaBuilder.createQuery(DfField.class);
		Root<DfField> dfField = criterQUery.from(DfField.class);
		Predicate condition = criteriaBuilder.equal(dfField.get(DfField_.formId), formId);
		criterQUery.where(condition);
		TypedQuery<DfField> typeQuery = entityManager.createQuery(criterQUery);
		List<DfField> result = typeQuery.getResultList();
		return result;
	}
}
