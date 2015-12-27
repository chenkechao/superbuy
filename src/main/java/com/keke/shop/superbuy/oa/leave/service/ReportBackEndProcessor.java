package com.keke.shop.superbuy.oa.leave.service;

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
public class ReportBackEndProcessor implements TaskListener{

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
		
		Object realityStartTime = delegateTask.getVariable("realityStartTime");
		leave.setRealityStartTime((Date)realityStartTime);
		Object realityEndTime = delegateTask.getVariable("realityEndTime");
		leave.setRealityEndTime((Date)realityEndTime);
		
		leaveManager.saveLeave(leave);
	}

}
