package com.keke.shop.superbuy.oa.leave.service;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.oa.leave.dao.LeaveRepository;
import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Component
public class LeaveManager {

	@Autowired
	private LeaveRepository leaveRepository;
	
	public void saveLeave(Leave leave) {
		if(leave.getId() == null) {
			leave.setApplyTime(new Date());
		}
		leaveRepository.save(leave);
	}
	
	public Leave getLeave(Long id) {
		return leaveRepository.findOneById(id);
	}
}
