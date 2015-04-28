package com.keke.shop.superbuy.form.config;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.dao.LeaveRepository;
import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Component
public class FormManager {

	@Autowired
	private FormRepository formRepository;
	
	public void saveForm(Form form) {
		if(form.getId() == null) {
			form.setCreateTime(new Date());
		}
		formRepository.save(form);
	}
	
	public List<Form> listForm(){
		return formRepository.listForm();
	}
	
	public Form getForm(Long id) {
		return formRepository.findOneById(id);
	}
}
