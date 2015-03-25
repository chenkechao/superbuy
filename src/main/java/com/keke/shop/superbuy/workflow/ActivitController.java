package com.keke.shop.superbuy.workflow;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="workflow")
public class ActivitController {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private RepositoryService repositoryService;
	
	/*
	 * 流程定义列表
	 */
	@RequestMapping(value="processList")
	public ModelAndView processList(){
		ModelAndView mav = new ModelAndView("workflow/processList");
		
		List<Object[]> objects = new ArrayList<Object[]>();
		ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery().orderByDeploymentId().desc();
		List<ProcessDefinition> processDefinitionList = processDefinitionQuery.listPage(0,10);
		for(ProcessDefinition processDefinition:processDefinitionList) {
			String deploymentId = processDefinition.getDeploymentId();
			Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
			objects.add(new Object[]{processDefinition,deployment});
		}
		mav.addObject("processList",objects);
		return mav;
	}

	@RequestMapping(value="/resource/read")
	public void loadByDeployment(@RequestParam("processDefinitionId")String processDefinitionId,@RequestParam("resourceType")String resourceType,HttpServletResponse response) throws Exception {
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
		String resourceName = "";
		if(resourceType.equals("xml")) {
			resourceName = processDefinition.getResourceName();
		}else if(resourceType.equals("image")){
			resourceName = processDefinition.getDiagramResourceName();
		}
		InputStream resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
		 byte[] b = new byte[1024];
	        int len = -1;
	        while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
	            response.getOutputStream().write(b, 0, len);
	        }
	}
}
