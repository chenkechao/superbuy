package com.keke.shop.superbuy.workflow;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;
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
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.thymeleaf.util.StringUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.keke.shop.superbuy.workflow.util.WorkflowUtils;

@Controller
@RequestMapping(value="/workflow")
public class ActivitController {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private Properties configurePropertiesFactoryBean;
	
	
	@Autowired
	private RepositoryService repositoryService;
	
	/*
	 * 流程定义列表
	 */
	@RequestMapping(value="/processList/{processType}")
	public ModelAndView processList(@PathVariable String processType){
		ModelAndView mav = new ModelAndView("workflow/processList");
		return mav;
	}

	/*
	 * 流程定义列表
	 */
	@RequestMapping(value="/processList/{processType}/list/json", produces="application/json")
	@ResponseBody
	public List<Map<String,Object>> processListJson(@PathVariable String processType){
		List<Object[]> objects = new ArrayList<Object[]>();
		List<Map<String,Object>> processList = new ArrayList<Map<String,Object>>();
		List<ProcessDefinition> processDefinitionList = new ArrayList<ProcessDefinition>();
		if(!StringUtils.equals(processType, "all")) {
			
		}else{
			ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery().orderByDeploymentId().desc();
			processDefinitionList = processDefinitionQuery.list();
			for(ProcessDefinition processDefinition:processDefinitionList) {
				String deploymentId = processDefinition.getDeploymentId();
				Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
				objects.add(new Object[]{processDefinition,deployment});
				
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("id", processDefinition.getId());
				map.put("deploymentId", deploymentId);
				map.put("name", processDefinition.getName());
				map.put("key", processDefinition.getKey());
				map.put("version", processDefinition.getVersion());
				map.put("deploymentTime", deployment.getDeploymentTime());
				map.put("suspended", processDefinition.isSuspended());
				processList.add(map);
			}
		}
//		String json = null;
//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			json = mapper.writeValueAsString(processDefinitionList);
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return json;
		return processList;
	}
	
	/*
	 * 部署全部流程
	 */
//	@RequestMapping(value="redeploy/all")
//	public String redeployAll() {
//	}
	
	@RequestMapping(value="/deploy")
	@ResponseBody
	public String deploy(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
		//创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		//判断request是否有文件上传，即多部分请求
		if(multipartResolver.isMultipart(request)){
			//转换成多部分request
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
			//取的request中的所有文件名
			Iterator<String> iter = multipartRequest.getFileNames();
			while(iter.hasNext()) {
				//取的上传文件
				MultipartFile file = multipartRequest.getFile(iter.next());
				if(file != null) {
					//取的当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					if(myFileName.trim() != "") {
//						//重命名上传后的文件名
//						String fileName = "demoUpload_" +  file.getOriginalFilename();
//						//定义上传路径
//						String path = "D:/" + fileName;
//						File localFile = new File(path);
//						file.transferTo(localFile);
						
						InputStream fileInputStream = null;
						Deployment deployment = null;
						try {
							fileInputStream = file.getInputStream();
							
							String extension = FilenameUtils.getExtension(myFileName);
							if(extension.equals("zip") || extension.equals("bar")) {
								ZipInputStream zip = new ZipInputStream(fileInputStream);
								deployment = repositoryService.createDeployment().addZipInputStream(zip).deploy();
							}else{
								deployment = repositoryService.createDeployment().addInputStream(myFileName, fileInputStream).deploy();
							}
							
							List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).list();
							for(ProcessDefinition processDefinition : list) {
								WorkflowUtils.exportDiagramToFile(repositoryService, processDefinition,configurePropertiesFactoryBean.getProperty("export.diagram.path"));
							}
							return "success";
						} catch (IOException e) {
							logger.error("error on deploy process, because of file input stream", e);
							return "error";
						}
					}
				}
			}
		}
		
		return "success";
	}
	
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
	
	 @RequestMapping(value="/showUploadModal")
	 public String showUploadModal(ModelAndView mav) {
		 return "workflow/uploadview";
	 }
	 
	 @RequestMapping(value="/showTraceModalView")
	 public String showTraceModalView(ModelAndView mav) {
		 return "workflow/traceview";
	 }
}
