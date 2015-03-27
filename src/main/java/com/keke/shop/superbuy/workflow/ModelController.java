package com.keke.shop.superbuy.workflow;

import java.util.List;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/workflow/model")
public class ModelController {

	@Autowired
	private RepositoryService repositoryService;
	
	/*
	 * 模型列表
	 */
	@RequestMapping(value="list")
	public ModelAndView modelList(){
		ModelAndView mav = new ModelAndView("workflow/modelList");
		List<Model> list = repositoryService.createModelQuery().list();
		mav.addObject("modelList", list);
		return mav;
	}
}
