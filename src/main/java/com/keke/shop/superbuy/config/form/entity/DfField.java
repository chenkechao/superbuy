package com.keke.shop.superbuy.config.form.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.keke.shop.superbuy.security.entity.SecurityEntity;

@Entity
@Table(name="df_field")
@NamedQueries({
	@NamedQuery(name = DfField.FIND_ALL, query = "select a from DfField a")
})
public class DfField extends SecurityEntity{
	
	private static final long serialVersionUID = -2742226951005206260L;
	public static final String FIND_ALL = "DfField.findAll";
	
	private String name;
	private String fieldname;
	private String plugins;
	private String title;
	private String orgtype;
	private String fieldflow;
	private String tableName;
	private Long formId;
	
	public DfField() {}
	
	public DfField(Long id) {
		this.id = id;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Transient
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
	
	@Column(name="plugins")
	public String getPlugins() {
		return plugins;
	}
	public void setPlugins(String plugins) {
		this.plugins = plugins;
	}
	
	@Column(name="title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="orgtype")
	public String getOrgtype() {
		return orgtype;
	}
	public void setOrgtype(String orgtype) {
		this.orgtype = orgtype;
	}
	
	@Column(name="fieldflow")
	public String getFieldflow() {
		return fieldflow;
	}
	public void setFieldflow(String fieldflow) {
		this.fieldflow = fieldflow;
	}
	
	@Column(name="table_name")
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	@Column(name="form_id")
	public Long getFormId() {
		return formId;
	}
	public void setFormId(Long formId) {
		this.formId = formId;
	}
	
}
