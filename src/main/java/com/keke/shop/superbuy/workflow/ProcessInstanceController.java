package com.keke.shop.superbuy.workflow;

import java.util.List;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/workflow/processinstance")
public class ProcessInstanceController {
	
	@Autowired
	private RuntimeService runtimeService;
	
	@RequestMapping(value = "running")
	public ModelAndView running() {
		ModelAndView mav = new ModelAndView("workflow/runningManage");
		ProcessInstanceQuery processInstanceQuery = runtimeService.createProcessInstanceQuery();
		List<ProcessInstance> list = processInstanceQuery.listPage(0, 100);
		mav.addObject("result",list);
		return mav;
	}
	
    /*
     * 挂起，激活流程实例
     */
	@RequestMapping(value = "update/{state}/{processInstanceId}")
	public String updateState(@PathVariable("state") String state,@PathVariable("processInstanceId") String processInstanceId
			,RedirectAttributes redirectAttributes) {
		return null;
	}
}
