package com.keke.shop.superbuy.config.form;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.shop.superbuy.config.form.entity.DfField;
import com.keke.shop.superbuy.config.form.entity.DfForm;
import com.keke.shop.superbuy.config.form.service.DfFormManager;
import com.keke.shop.superbuy.config.form.service.FormManager;

@Controller
@RequestMapping(value="/config/form")
public class FormConfigController {
	
	@Autowired
	private FormManager formManager;
	
	@Autowired
	private DfFormManager dfFormManager;
	
	@RequestMapping(value="/list")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView("config/form/formList");
		return mav;
	}

	@RequestMapping(value="/list/json", produces="application/json")
	@ResponseBody
	public List<DfForm> listJson(){
		List<DfForm> dfFormList = new ArrayList<DfForm>();
		dfFormList = dfFormManager.getAll();
		return dfFormList;
	}
	
	@RequestMapping(value="/showCreateForm")
	public String showCreateFormModal(){
		return "config/form/createformview";
	}
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public String create(@Valid @ModelAttribute DfForm dfForm){
		try {
			formManager.saveDfForm(dfForm);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="detail/{id}",produces = "application/json")
	@ResponseBody
	public DfForm detail(@PathVariable("id") Long id){
		DfForm dfForm = dfFormManager.get(id);
//		if(!Hibernate.isInitialized(dfForm)){
//			Hibernate.initialize(dfForm);
//		}
		return dfForm;
	}
	
	@RequestMapping(value="designer/{id}")
	public ModelAndView designer(@PathVariable Long id){
		ModelAndView mav = new ModelAndView("config/form/formDesigner");
		DfForm dfForm = dfFormManager.get(id);
		mav.addObject("form", dfForm);
		return mav;
	}
	
	@RequestMapping(value="/processor")
	public String processor(String formId,String parse_form){
		ObjectMapper mapper = new ObjectMapper();
		try {
			Map<String,Object> map = mapper.readValue(parse_form, Map.class);
			Map<String,Object> datas = (Map<String, Object>) map.get("add_fields");
			
			DfForm dfForm = dfFormManager.get(Long.parseLong(formId));
			Map<String,String> nameMap = formManager.process(dfForm, datas);
			
			String template = (String) map.get("template");
			String parseHtml = (String) map.get("parse");
			if(!nameMap.isEmpty()){
				for(Map.Entry<String, String> entry : nameMap.entrySet()){
					template = template.replaceAll(entry.getKey(), entry.getValue());
					parseHtml = parseHtml.replaceAll(entry.getKey(), entry.getValue());
				}
			}
			
			dfForm.setFieldNum(nameMap.size());
			dfForm.setOriginalHtml(template);
			dfForm.setParseHtml(parseHtml);
			formManager.saveDfForm(dfForm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping(value="/use/{formId}")
	public String use(@PathVariable long formId,Model model){
		DfForm dfForm = dfFormManager.get(formId);
		String processId = null;
		String orderId = null;
		String taskId = null;
		model.addAttribute("dfForm", dfForm);
		model.addAttribute("processId", processId);
		model.addAttribute("orderId", orderId);
		model.addAttribute("taskId", taskId);
		if(StringUtils.isEmpty(orderId)||StringUtils.isNotEmpty(taskId)) {
			return "config/form/formUse";
		}else{
			return "config/form/formUseView";
		}
	}
	
	@RequestMapping(value="use",method=RequestMethod.POST)
	@ResponseBody
	public String submit(long formId,HttpServletRequest request,String processId,String orderId,String taskId){
		List<DfField> dfFields = formManager.getFields(formId);
		DfForm dfForm = dfFormManager.get(formId);
		Map<String,Object> params = new HashMap<String,Object>();
		for(DfField dfField:dfFields){
			//if(Field.F)
		}
		formManager.submitTableForm(dfForm, request.getParameterMap());
		return "success";
	}
	
	@RequestMapping(value="delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") Long id){
		dfFormManager.delete(id);
		return "success";
	}
}
