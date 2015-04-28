package com.keke.shop.superbuy.form.config;

import java.util.ArrayList;
import java.util.List;

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

import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Controller
@RequestMapping(value="/form/config")
public class FormConfigController {
	
	@Autowired
	private FormManager formManager;
	
	@RequestMapping(value="/list")
	public ModelAndView formList(){
		ModelAndView mav = new ModelAndView("form/config/listForm");
		List<Form> formList = new ArrayList<Form>();
		formList = formManager.listForm();
		mav.addObject("formList", formList);
		return mav;
	}

	@RequestMapping(value="/showCreateFormModal")
	public String showCreateFormModal(Model model){
		model.addAttribute("leave", new Leave());
		return "form/config/createformview";
	}
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public String create(@Valid @ModelAttribute Form form){
		try {
			formManager.saveForm(form);
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
		Form form = formManager.getForm(id);
		mav.addObject("form", form);
		return mav;
	}
	
	@RequestMapping(value="designer/{id}")
	public ModelAndView designer(@PathVariable Long id){
		ModelAndView mav = new ModelAndView("form/config/formDesigner");
		Form form = formManager.getForm(id);
		mav.addObject("form", form);
		return mav;
	}
}
