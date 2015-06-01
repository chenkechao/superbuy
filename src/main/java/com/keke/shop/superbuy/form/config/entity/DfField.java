package com.keke.shop.superbuy.form.config.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.keke.shop.superbuy.account.Account;

@SuppressWarnings("serial")
@Entity
@Table(name="df_field")
@NamedQueries({
	@NamedQuery(name = DfField.FIND_ALL, query = "select a from DfField a"),
	@NamedQuery(name = DfField.FIND_NAMES, query = "select a.fieldname from DfField a where a.tableName= :tableName")
})
public class DfField implements java.io.Serializable{
	
	public static final String FIND_ALL = "DfField.findAll";
	public static final String FIND_NAMES = "DfField.findNames";
	
	@Id
	@GeneratedValue
	private Long id;
	@Column
	private String name;
	
	private String fieldname;
	@Column
	private String plugins;
	@Column
	private String title;
	@Column
	private String orgtype;
	@Column
	private String fieldflow;
	@Column
	private String tableName;
	@Column
	private Long formId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
	public String getPlugins() {
		return plugins;
	}
	public void setPlugins(String plugins) {
		this.plugins = plugins;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOrgtype() {
		return orgtype;
	}
	public void setOrgtype(String orgtype) {
		this.orgtype = orgtype;
	}
	public String getFieldflow() {
		return fieldflow;
	}
	public void setFieldflow(String fieldflow) {
		this.fieldflow = fieldflow;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public Long getFormId() {
		return formId;
	}
	public void setFormId(Long formId) {
		this.formId = formId;
	}
	
}
