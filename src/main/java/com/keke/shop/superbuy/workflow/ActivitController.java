package com.keke.shop.superbuy.workflow;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

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

	/*
	 * 部署全部流程
	 */
//	@RequestMapping(value="redeploy/all")
//	public String redeployAll() {
//	}
	
	/*
	 * 读取资源，通过部署ID
	 */
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
	
	@RequestMapping(value="/process/convertToModel/{processDefinitionId}")
	@ResponseBody
	public void convertToModel(@PathVariable String processDefinitionId) throws UnsupportedEncodingException, XMLStreamException {
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
				.processDefinitionId(processDefinitionId).singleResult();
		InputStream bpmnStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(),processDefinition.getResourceName());
		XMLInputFactory xif = XMLInputFactory.newInstance();
		InputStreamReader in = new InputStreamReader(bpmnStream , "UTF-8");
		XMLStreamReader xtr = xif.createXMLStreamReader(in);
	    BpmnModel bpmnModel = new BpmnXMLConverter().convertToBpmnModel(xtr);
	    
	    BpmnJsonConverter converter = new BpmnJsonConverter();
	    ObjectNode modelNode = converter.convertToJson(bpmnModel);
		Model modelData = repositoryService.newModel();
		modelData.setKey(processDefinition.getKey());
		modelData.setName(processDefinition.getResourceName());
		modelData.setCategory(processDefinition.getDeploymentId());
		
		ObjectNode modelObjectNode = new ObjectMapper().createObjectNode();
		modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, processDefinition.getName());
		modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
		modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, processDefinition.getDescription());
		modelData.setMetaInfo(modelObjectNode.toString());
		
		repositoryService.saveModel(modelData);
		repositoryService.addModelEditorSource(modelData.getId(), modelNode.toString().getBytes("utf-8"));
		logger.debug("convertToModel success");
		//return "redirect:/workflow/model/list";
	}
	
	@RequestMapping(value="process/deleteProcessDefinition/{deploymentId}")
	@ResponseBody
	public void deleteProcessDefinition(@PathVariable("deploymentId") String deploymentId) {
		repositoryService.deleteDeployment(deploymentId,true);
		logger.debug("deleteProcessDefinition success");
	}
	
	/*
	 * 挂起，激活流程实例
	 */
	@RequestMapping(value="processdefinition/update/{state}/{processDefinitionId}")
	public String updateState(@PathVariable("state") String state,
			@PathVariable("processDefinitionId") String processDefinitionId,RedirectAttributes redirectAttributes) {
		if(state.equals("active")) {
			redirectAttributes.addFlashAttribute("message", "已激活ID为[" + processDefinitionId + "]的流程定义。");
			repositoryService.activateProcessDefinitionById(processDefinitionId, true, null);
		}else if(state.endsWith("suspend")) {
			repositoryService.suspendProcessDefinitionById(processDefinitionId, true, null);
			redirectAttributes.addFlashAttribute("message", "已挂起ID为[" + processDefinitionId + "]的流程定义。");
		}
		return "redirect:/workflow/processList";
	}
}
