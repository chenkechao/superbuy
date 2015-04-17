package com.keke.shop.superbuy.service.oa.leave;

import java.util.Date;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Component
@Transactional
public class AfterModifyApplyContentProcessor implements TaskListener{

	private static final long serialVersionUID = 1L;

	@Autowired
	private LeaveManager leaveManager;
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Override
	public void notify(DelegateTask delegateTask) {
		String processInstanceId = delegateTask.getProcessInstanceId();
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		Leave leave = leaveManager.getLeave(new Long(processInstance.getBusinessKey()));
		
		leave.setLeaveType((String)delegateTask.getVariable("leaveType"));
		leave.setStartTime((Date)delegateTask.getVariable("startTime"));
		leave.setEndTime((Date)delegateTask.getVariable("endTime"));
		leave.setReason((String)delegateTask.getVariable("reason"));
		
		leaveManager.saveLeave(leave);
	}

}
