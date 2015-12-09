package com.keke.shop.superbuy.process;

import java.util.List;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keke.shop.superbuy.security.entity.User;
import com.keke.shop.superbuy.security.shiro.ShiroUtils;

@Controller
@RequestMapping(value = "/process/processinstance")
public class ProcessInstanceController {
	
	@Autowired
	private RuntimeService runtimeService;
	
	@RequestMapping(value = "runningList")
	public ModelAndView runningList() {
		ModelAndView mav = new ModelAndView("workflow/runningList");
		return mav;
	}
	
	@RequestMapping(value = "runningList/json")
	@ResponseBody
	public List<ProcessInstance> runningListJson() {
		User user = (User) ShiroUtils.getUser();
		List<ProcessInstance> list = runtimeService.createProcessInstanceQuery()
				//.involvedUser(String.valueOf(user.getId()))
				.list();
		return list;
		
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
