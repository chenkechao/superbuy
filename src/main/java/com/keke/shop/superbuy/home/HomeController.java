package com.keke.shop.superbuy.home;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.activiti.engine.identity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		User user = (User) session.getAttribute("user");
		ModelAndView mav = null;
		if(user!=null){
			mav = new ModelAndView("home/homeSignedIn");
			mav.addObject("user", user);
		}else{
			mav = new ModelAndView("signin/signin");
		}
		return mav;
	}
}
