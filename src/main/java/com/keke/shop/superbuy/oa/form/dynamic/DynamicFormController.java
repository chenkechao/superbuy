package com.keke.shop.superbuy.oa.form.dynamic;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.FormService;
import org.activiti.engine.impl.form.StartFormDataImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/form/dynamic")
public class DynamicFormController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
//	@Autowired
//	private FormService formService;
//	
//	
//	@RequestMapping(value="get-form/start/{processDefinitionId}")
//	@ResponseBody
//	public Map<String,Object> findStartForm(@PathVariable("processDefinitionId") String processDefinitionId) {
//		Map<String,Object> result = new HashMap<String,Object>();
//		StartFormDataImpl startFormData = (StartFormDataImpl)formService.getStartFormData(processDefinitionId);
//		startFormData.setProcessDefinition(null);
//		
//		result.put("form", startFormData);
//		return result;
//	}
	
	@RequestMapping("formDesigner")
	public String formDesigner(){
		return "oa/form/formDesigner";
	}
}
