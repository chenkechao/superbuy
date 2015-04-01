package com.keke.shop.superbuy.workflow;

import org.activiti.engine.RuntimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/workflow/processinstance")
public class ProcessInstanceController {
	
	@Autowired
	private RuntimeService runtimeService;
//	
//	public ModelAndView running() {
//		
//	}

}
