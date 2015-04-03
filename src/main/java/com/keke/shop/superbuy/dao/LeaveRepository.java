package com.keke.shop.superbuy.dao;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Repository
@Transactional(readOnly = true)
public class LeaveRepository {
	
	@PersistenceContext
    private EntityManager entityManager;
    
	@Transactional
    public Leave save(Leave leave) {
    	entityManager.persist(leave);
    	return leave;
    }
	
	public Leave findOneById(Long id) {
		Leave leave = null;
		try {
			leave = entityManager.find(Leave.class,id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return leave;
	}
}
