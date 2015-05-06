package com.keke.shop.superbuy.form.config;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.persistence.*;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FormRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FieldRepository fieldRepository;
	
	@Transactional
	public DfForm save(DfForm dfForm) {
		if(dfForm.getId()==null){
			entityManager.persist(dfForm);
		}else{
			dfForm = entityManager.merge(dfForm);
			entityManager.flush();
		}
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
	
	public void checkTableFormExist(String tableName) throws Exception{
		String checkSQL = "select count(*) from " + tableName + " where id = 1";
			Query query = entityManager.createNativeQuery(checkSQL);
			if(query.getResultList().size() == 0) {
			}
//		Connection connection = sqlSession.getConnection();
//		Statement stat = connection.createStatement();
//		stat.execute(checkSQL.toString());
	}
	
	public boolean createTableForm(String tableName,List<DfField> fieldList){
		StringBuilder sql = new StringBuilder();
		sql.append("CREATE TABLE ").append(tableName).append(" (");
		sql.append("ID INT NOT NULL AUTO_INCREMENT,");
		for(DfField dfField:fieldList) {
			sql.append(dfField.getFieldname());
			sql.append(" ").append(FieldRepository.fieldSQL(dfField)).append(",");
		}
		sql.append("FORMID INT NOT NULL,");
		sql.append("UPDATETIME VARCHAR(20),");
		sql.append("ORDERID VARCHAR(50),");
		sql.append("TASKID VARCHAR(50),");
		sql.append("PRIMARY KEY (ID)");
		sql.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8;");
		Connection connection = null;
		try {
			//entityManager.createNativeQuery(sql.toString());
			connection = sqlSession.getConnection();
			Statement stat = connection.createStatement();
			stat.execute(sql.toString());
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
							!fieldRepository.queryDfFieldNames(tableName).contains(dfField.getFieldname())){
						String updateSql = "ALTER TABLE " +tableName +" ADD COLUMN " + dfField.getFieldname() + FieldRepository.fieldSQL(dfField);
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
	
	public boolean insertTableForm(Map<String, String[]> map,String tableName){
		StringBuilder beforeSql = new StringBuilder();
		StringBuilder afterSql = new StringBuilder();
		String subBefore = null;
		String subAfter = null;
		beforeSql.append("INSERT INTO ").append(tableName);
		beforeSql.append(" (");
		afterSql.append(") values (");
		if(map != null){
			for(Map.Entry<String, String[]> entry:map.entrySet()){
				String[] data = entry.getValue();
				if(data == null||"".equals(data)||data.length==0){
					continue;
				}
				if("".equals(data[0])){
					continue;
				}
				beforeSql.append(entry.getKey()).append(",");
				if(data.length==1){
					afterSql.append("'").append(data[0]).append("'").append(",");
				}else{
					String dataArr = ArrayUtils.toString(data);
					if(dataArr.length() > 1){
						afterSql.append("'").append(dataArr.substring(1, dataArr.length()-1)).append("'").append(",");
					}
				}
			}
			subBefore = beforeSql.substring(0, beforeSql.length()-1);
			subAfter = afterSql.substring(0, afterSql.length()-1);
		}
		StringBuilder subBeforeBuilder = new StringBuilder(subBefore);
		StringBuilder subAfterBuilder = new StringBuilder(subAfter);
		subAfterBuilder.append(")");
		subBeforeBuilder.append(subAfterBuilder.toString());
		Connection connection = null;
		try {
			//entityManager.createNativeQuery(sql.toString());
			connection = sqlSession.getConnection();
			Statement stat = connection.createStatement();
			stat.executeUpdate(subBeforeBuilder.toString());
			//entityManager.flush();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
