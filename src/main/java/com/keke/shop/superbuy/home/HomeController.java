package com.keke.shop.superbuy.home;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.shop.superbuy.security.entity.User;
import com.keke.shop.superbuy.security.shiro.ShiroPrincipal;
import com.keke.shop.superbuy.security.shiro.ShiroUtils;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/" , "/index"}, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = null;
		User user = (User) ShiroUtils.getUser();
		if(user != null){
			mav = new ModelAndView("home/homeSignedIn");
			mav.addObject("user", user);
		}else{
			mav = new ModelAndView("signin/signin");
		}
		return mav;
	}
	
	@RequestMapping(value="/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("home/main");
		return mav;
	}
	
	@RequestMapping(value="/invited/json",produces = "application/json")
	@ResponseBody
	public ModelAndView invitedJson() {
		ModelAndView mav = new ModelAndView("config/dictionary/data/invited");
		return mav;
	}
}
