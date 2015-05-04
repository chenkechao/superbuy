package com.keke.shop.superbuy.form.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

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
import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Controller
@RequestMapping(value="/form/config")
public class FormConfigController {
	
	@Autowired
	private FormManager formManager;
	
	@RequestMapping(value="/list")
	public ModelAndView formList(){
		ModelAndView mav = new ModelAndView("form/config/listForm");
		List<DfForm> dfFormList = new ArrayList<DfForm>();
		dfFormList = formManager.listDfForm();
		mav.addObject("formList", dfFormList);
		return mav;
	}

	@RequestMapping(value="/showCreateFormModal")
	public String showCreateFormModal(Model model){
		model.addAttribute("leave", new Leave());
		return "form/config/createformview";
	}
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public String create(@Valid @ModelAttribute DfForm dfForm){
		try {
			formManager.saveDfForm(dfForm);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value="view/{id}")
	public ModelAndView view(@PathVariable Long id){
		ModelAndView mav = new ModelAndView("form/config/formView");
		DfForm dfForm = formManager.getDfForm(id);
		mav.addObject("form", dfForm);
		return mav;
	}
	
	@RequestMapping(value="designer/{id}")
	public ModelAndView designer(@PathVariable Long id){
		ModelAndView mav = new ModelAndView("form/config/formDesigner");
		DfForm dfForm = formManager.getDfForm(id);
		mav.addObject("form", dfForm);
		return mav;
	}
	
	@RequestMapping(value="/processor")
	public String processor(String formId,String parse_form){
		ObjectMapper mapper = new ObjectMapper();
		try {
			Map<String,Object> map = mapper.readValue(parse_form, Map.class);
			Map<String,Object> datas = (Map<String, Object>) map.get("add_fields");
			
			DfForm dfForm = formManager.getDfForm(Long.parseLong(formId));
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
	public ModelAndView use(@PathVariable String formId){
		ModelAndView mav = new ModelAndView("form/config/formUseView");
		DfForm dfForm = formManager.getDfForm(Long.parseLong(formId));
		String orderId = null;
		String taskId = null;
		mav.addObject("form", dfForm);
		return mav;
	}
}
