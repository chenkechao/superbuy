package com.keke.shop.superbuy.process;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
@RequestMapping(value = "/process/model")
public class ModelController {

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
}
