package com.keke.shop.superbuy.process;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.apache.commons.lang3.StringUtils;
import org.h2.util.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
@RequestMapping(value = "/process/model")
public class ModelController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private RepositoryService repositoryService;
	
	/*
	 * 模型列表
	 */
	@RequestMapping(value="list")
	public ModelAndView modelList(){
		ModelAndView mav = new ModelAndView("process/model/modelList");
		return mav;
	}
	
	@RequestMapping(value="list/json", produces="application/json")
	@ResponseBody
	public List<Model> modelListJson(){
		List<Model> list = repositoryService.createModelQuery().list();
		return list;
	}
	
	@RequestMapping(value="showCreateModelForm")
	public String showCreateFormModal(){
		return "process/model/createModelForm";
	}
	
	@RequestMapping(value="create",method=RequestMethod.POST)
	@ResponseBody
	public String create(@RequestParam("name") String name,
			@RequestParam("key") String key,
			@RequestParam("description")String description
			,HttpServletRequest request,HttpServletResponse response) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			ObjectNode editorNode = objectMapper.createObjectNode();
			editorNode.put("id", "canvas");
			editorNode.put("resourceId", "canvas");
			ObjectNode stencilSetNode = objectMapper.createObjectNode();
			stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
			editorNode.put("stencilset", stencilSetNode);
			Model modelData = repositoryService.newModel();
			
			ObjectNode modelObjectNode = objectMapper.createObjectNode();
			 modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
	         modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
	         description = StringUtils.defaultString(description);
	         modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
	         modelData.setMetaInfo(modelObjectNode.toString());
	         modelData.setName(name);
	         modelData.setKey(StringUtils.defaultString(key));
	         
	         repositoryService.saveModel(modelData);
	         repositoryService.addModelEditorSource(modelData.getId(), editorNode.toString().getBytes("utf-8"));
	         return "success";
		} catch (Exception e) {
           // logger.error("创建模型失败：", e);
			return "error";
        }
	}
	
	@RequestMapping(value="delete/{modelId}")
	@ResponseBody
	public String delete(@PathVariable String modelId){
		try {
			repositoryService.deleteModel(modelId);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="deploy/{modelId}")
	@ResponseBody
	public String deploy(@PathVariable("modelId") String modelId){
		try {
			Model modelData = repositoryService.getModel(modelId);
			ObjectNode modelNode = (ObjectNode) new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelData.getId()));
			byte[] bpmnBytes = null;
			BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);
			bpmnBytes = new BpmnXMLConverter().convertToXML(model);
			
			String processName = modelData.getName() + ".bpmn20.xml";
			Deployment deployment = repositoryService.createDeployment().name(modelData.getName())
					.addString(processName, new String(bpmnBytes)).deploy();
			return "success";
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="export/{modelId}/{type}")
	public void export(@PathVariable("modelId") String modelId,
			@PathVariable("type") String type,
			HttpServletResponse response){
		Model modelData = repositoryService.getModel(modelId);
		BpmnJsonConverter jsonConverter = new BpmnJsonConverter();
		byte[] modelEditorSource = repositoryService.getModelEditorSource(modelData.getId());
		
		try {
			JsonNode editorNode = new ObjectMapper().readTree(modelEditorSource);
			BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);
			
			if(bpmnModel.getMainProcess() == null){
				response.setStatus(HttpStatus.UNPROCESSABLE_ENTITY.value());
				response.getOutputStream().println("no main process, can't export for type: " + type);
				response.flushBuffer();
				return;
			}
			
			String filename = "";
			byte[] exportBytes = null;
			String mainProcessId = bpmnModel.getMainProcess().getId();
			switch(type) {
				case "bpmn":{
					BpmnXMLConverter xmlConverter = new BpmnXMLConverter();
					exportBytes = xmlConverter.convertToXML(bpmnModel);
					
					filename = mainProcessId + ".bpmn20.xml";
					break;
				}
				case "json":{
					exportBytes = modelEditorSource;
					filename = mainProcessId + ".json";
					break;
				}
			}
			
			ByteArrayInputStream in = new ByteArrayInputStream(exportBytes);
			IOUtils.copy(in, response.getOutputStream());
			
			response.setHeader("Content-Disposition", "attachment; filename="+filename);
			response.flushBuffer();
		} catch (IOException e) {
			logger.error("导出model的xml文件失败：modelId={}, type={}", modelId, type, e);
		}
	}
}
