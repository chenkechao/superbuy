package com.keke.shop.superbuy.form.config.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.context.annotation.Lazy;

import com.keke.shop.superbuy.security.entity.SecurityEntity;

@Entity
@Table(name="df_form")
public class DfForm extends SecurityEntity{

	private static final long serialVersionUID = -4415247205658265155L;
	
	private String name;
	private String displayName;
	private String creator;
	private Date createTime;
	private String type;
	private int fieldNum;
	private String originalHtml;
	private String parseHtml;
	
	public DfForm() {}
	
	public DfForm(Long id) {
		this.id = id;
	}
	
	@Column(name="name",nullable =false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="display_name")
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
	@Column(name="creator")
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	@Column(name="create_time")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="field_num")
	public int getFieldNum() {
		return fieldNum;
	}
	public void setFieldNum(int fieldNum) {
		this.fieldNum = fieldNum;
	}
	
	@Column(columnDefinition="TEXT",name="original_html")
	public String getOriginalHtml() {
		return originalHtml;
	}
	public void setOriginalHtml(String originalHtml) {
		this.originalHtml = originalHtml;
	}
	
	@Column(columnDefinition="TEXT",name="parse_html")
	public String getParseHtml() {
		return parseHtml;
	}
	public void setParseHtml(String parseHtml) {
		this.parseHtml = parseHtml;
	}

	@Override
	public String toString() {
		return "DfForm [name=" + name + ", displayName=" + displayName
				+ ", creator=" + creator + ", createTime=" + createTime
				+ ", type=" + type + ", fieldNum=" + fieldNum
				+ ", originalHtml=" + originalHtml + ", parseHtml=" + parseHtml
				+ ", id=" + id + "]";
	}

	
}
