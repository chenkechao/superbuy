package com.keke.shop.superbuy.form.config;

import java.util.List;
import java.util.Map;

import javax.persistence.*;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(readOnly = true)
public class FormRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional
	public DfForm save(DfForm dfForm) {
		entityManager.persist(dfForm);
		return dfForm;
	}
	
	public List<DfForm> listDfForm(){
		Query query = entityManager.createNamedQuery(DfForm.FIND_ALL, DfForm.class);
		List<DfForm> list = query.getResultList();
		return list;
	}
	
	public DfForm findOneDfFormById(Long id) {
		DfForm form = null;
		try {
			form = entityManager.find(DfForm.class,id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return form;
	}
	
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

	private String fieldSQL(DfField dfField){
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
	
	public void checkTableFormExist(String tableName){
		String checkSQL = "select count(*) from " + tableName + " where id = 1";
		try {
			Query query = entityManager.createNativeQuery(checkSQL);
			if(query.getResultList().size() == 0) {
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean createTableForm(String tableName,List<DfField> fieldList){
		StringBuilder sql = new StringBuilder();
		sql.append("CREATE TABLE ").append(tableName).append(" (");
		sql.append("ID INT NOT NULL AUTO_INCREMENT,");
		for(DfField dfField:fieldList) {
			sql.append(dfField.getFieldname());
			sql.append(" ").append(fieldSQL(dfField)).append(",");
		}
		sql.append("FORMID INT NOT NULL,");
		sql.append("UPDATETIME VARCHAR(20),");
		sql.append("ORDERID VARCHAR(50),");
		sql.append("TASKID VARCHAR(50),");
		sql.append("PRIMARY KEY (ID)");
		sql.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
		try {
			entityManager.createNativeQuery(sql.toString());
			//entityManager.flush();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateTableForm(String tableName,List<DfField> fieldList){
		try {
			if(fieldList.size()>0){
				for(DfField dfField:fieldList){
					if(StringUtils.isNotEmpty(dfField.getFieldname())&&
							!queryDfFieldNames(tableName).contains(dfField.getFieldname())){
						String updateSql = "ALTER TABLE " +tableName +" ADD COLUMN " + dfField.getFieldname() + fieldSQL(dfField);
						entityManager.createNativeQuery(updateSql);
					}
				}
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
