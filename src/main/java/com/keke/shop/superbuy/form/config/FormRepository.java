package com.keke.shop.superbuy.form.config;

import java.util.List;

import javax.persistence.*;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(readOnly = true)
public class FormRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional
	public Form save(Form form) {
		entityManager.persist(form);
		return form;
	}
	
	public List<Form> listForm(){
		Query query = entityManager.createNamedQuery(Form.FIND_ALL, Form.class);
		List<Form> list = query.getResultList();
		return list;
	}
	
	public Form findOneById(Long id) {
		Form form = null;
		try {
			form = entityManager.find(Form.class,id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return form;
	}

	
}
