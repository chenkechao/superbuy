package com.keke.shop.superbuy.workflow;

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
	
	@RequestMapping(value="/formkey/start/showStartForm/{processDefinitionId}")
	public ModelAndView showStartForm(@PathVariable("processDefinitionId")String processDefinitionId,HttpServletRequest request){
		Object startForm = formService.getRenderedStartForm(processDefinitionId);
		
		String contextPath = request.getContextPath();
		StringBuilder sb = new StringBuilder();
		sb.append("<form class='form-horizontal' method='post' action='"+contextPath+"/form/formkey/startProcess/"+processDefinitionId+"'>");
		sb.append(startForm).append("</form>");
		ModelAndView mav = new ModelAndView("workflow/modalview");
		mav.addObject("innerHtml", sb.toString());
		return mav;
	}
}
