package com.keke.shop.superbuy.signin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SigninController {
	
	private static Logger logger = LoggerFactory.getLogger(SigninController.class);
	
	@Autowired
	private IdentityService identityService;
	
	@RequestMapping(value = "signin")
	public String signin() {
        return "signin/signin";
    }
	
	@RequestMapping(value = "signin",method=RequestMethod.POST)
	public String signin(@RequestParam("userName") String userName,@RequestParam("password") String password,HttpSession session) {
		
		logger.debug("logon request: {username={}, password={}}", userName, password);
        boolean checkPassword = identityService.checkPassword(userName, password);
        if (checkPassword) {

            // read user from database
            User user = identityService.createUserQuery().userId(userName).singleResult();
            session.setAttribute("user", user);

            List<Group> groupList = identityService.createGroupQuery().groupMember(userName).list();
            session.setAttribute("groups", groupList);

            String[] groupNames = new String[groupList.size()];
            for (int i = 0; i < groupNames.length; i++) {
                System.out.println(groupList.get(i).getName());
                groupNames[i] = groupList.get(i).getName();
            }

            session.setAttribute("groupNames", ArrayUtils.toString(groupNames));

            return "redirect:/";
        } else {
            return "redirect:/signin?error=true";
        }
	}
}
