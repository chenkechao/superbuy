package com.keke.shop.superbuy.form.config.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.form.config.dao.DfFieldDao;
import com.keke.shop.superbuy.form.config.dao.DfFormDao;
import com.keke.shop.superbuy.form.config.entity.DfField;
import com.keke.shop.superbuy.form.config.entity.DfForm;
import com.keke.shop.superbuy.orm.Page;
import com.keke.shop.superbuy.orm.PropertyFilter;
import com.keke.shop.superbuy.security.dao.OrgDao;
import com.keke.shop.superbuy.security.entity.Org;

/**
 * 部门管理类
 * @author yuqs
 * @since 0.1
 */
@Component
@Transactional
public class DfFormManager {
	//注入部门持久化对象
	@Autowired
	private DfFormDao dfFormDao;
	
	@Autowired
	private DfFieldManager dfFieldManager;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存部门实体
	 * @param entity
	 */
	public void save(DfForm entity) {
		dfFormDao.save(entity);
	}
	
	/**
	 * 根据主键ID删除对应的部门
	 * @param id
	 */
	public void delete(Long id) {
		dfFormDao.delete(id);
	}
	
	/**
	 * 根据主键ID获取部门实体
	 * @param id
	 * @return
	 */
	public DfForm get(Long id) {
		return dfFormDao.get(id);
	}
	
	/**
	 * 根据分页对象、过滤集合参数，分页查询部门列表
	 * @param page
	 * @param filters
	 * @return
	 */
	public Page<DfForm> findPage(final Page<DfForm> page, final List<PropertyFilter> filters) {
		return dfFormDao.findPage(page, filters);
	}
	
	/**
	 * 获取所有部门记录
	 * @return
	 */
	public List<DfForm> getAll() {
		return dfFormDao.getAll();
	}
	
	public boolean checkTableFormExist(String tableName) throws Exception{
		String checkSQL = "select count(*) from " + tableName + " where id = 1";
		try {
			Connection connection = sqlSession.getConnection();
			Statement stat = connection.createStatement();
			ResultSet rest = stat.executeQuery(checkSQL.toString());
			if(rest.getRow()>0){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean createTableForm(String tableName,List<DfField> fieldList){
		StringBuilder sql = new StringBuilder();
		sql.append("CREATE TABLE ").append(tableName).append(" (");
		sql.append("ID INT NOT NULL AUTO_INCREMENT,");
		for(DfField dfField:fieldList) {
			sql.append(dfField.getFieldname());
			sql.append(" ").append(DfFieldManager.fieldSQL(dfField)).append(",");
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
							!dfFieldManager.queryDfFieldNames(tableName).contains(dfField.getFieldname())){
						String updateSql = "ALTER TABLE " +tableName +" ADD COLUMN " + dfField.getFieldname() + DfFieldManager.fieldSQL(dfField);
						Connection connection = null;
						try {
							//entityManager.createNativeQuery(sql.toString());
							connection = sqlSession.getConnection();
							Statement stat = connection.createStatement();
							stat.executeUpdate(updateSql.toString());
							//entityManager.flush();
							return true;
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							return false;
						}
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
