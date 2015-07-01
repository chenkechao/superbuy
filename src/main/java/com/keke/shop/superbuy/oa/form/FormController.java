package com.keke.shop.superbuy.oa.form;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.FormService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/form")
public class FormController {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/formkey/showStartForm/{processDefinitionId}")
	@ResponseBody
	public String showStartForm(@PathVariable("processDefinitionId")String processDefinitionId,HttpServletRequest request){
		Object startForm = formService.getRenderedStartForm(processDefinitionId);
		
		String contextPath = request.getContextPath();
		StringBuilder sb = new StringBuilder();
		sb.append("<form class='form-horizontal' method='post' action='"+contextPath+"/form/formkey/startProcess/"+processDefinitionId+"'>");
		sb.append(startForm).append("</form>");
		return sb.toString();
	}
	
	@RequestMapping(value="/formkey/startProcess/{processDefinitionId}")
	public String startProcess(@PathVariable("processDefinitionId")String processDefinitionId,HttpServletRequest request){
		
		Map<String,String[]> parameterMap = request.getParameterMap();
		Set<Entry<String,String[]>> entrySet = parameterMap.entrySet();
		return null;
	}
}
