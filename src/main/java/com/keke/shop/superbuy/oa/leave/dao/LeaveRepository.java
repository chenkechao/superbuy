package com.keke.shop.superbuy.oa.leave.dao;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.oa.leave.entity.Leave;
@Component
public interface LeaveRepository extends CrudRepository<Leave, Long>{
	
}
