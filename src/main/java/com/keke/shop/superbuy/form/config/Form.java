package com.keke.shop.superbuy.form.config;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.keke.shop.superbuy.account.Account;

@SuppressWarnings("serial")
@Entity
@Table(name="form")
@NamedQuery(name = Form.FIND_ALL, query = "select a from Form a")
public class Form implements java.io.Serializable{
	
	public static final String FIND_ALL = "Form.findAll";
	
	@Id
	@GeneratedValue
	private Long id;
	@Column
	private String name;
	@Column
	private String displayName;
	@Column
	private String creator;
	@Column
	private Date createTime;
	@Column
	private String type;
	@Column
	private int fieldNum;
	@Column
	private String originalHtml;
	@Column
	private String parseHtml;
	
	
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
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getFieldNum() {
		return fieldNum;
	}
	public void setFieldNum(int fieldNum) {
		this.fieldNum = fieldNum;
	}
	public String getOriginalHtml() {
		return originalHtml;
	}
	public void setOriginalHtml(String originalHtml) {
		this.originalHtml = originalHtml;
	}
	public String getParseHtml() {
		return parseHtml;
	}
	public void setParseHtml(String parseHtml) {
		this.parseHtml = parseHtml;
	}
}
