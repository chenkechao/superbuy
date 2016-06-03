package com.keke.shop.superbuy.security.web;


import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.framework.orm.Page;
import com.keke.framework.orm.PropertyFilter;
import com.keke.framework.util.Variable;
import com.keke.shop.superbuy.security.entity.DataJson;
import com.keke.shop.superbuy.security.entity.Org;
import com.keke.shop.superbuy.security.entity.Role;
import com.keke.shop.superbuy.security.entity.User;
import com.keke.shop.superbuy.security.service.OrgManager;
import com.keke.shop.superbuy.security.service.RoleManager;
import com.keke.shop.superbuy.security.service.UserManager;

/**
 * 用户管理Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/security/user")
public class UserController {
	//注入用户管理对象
	@Autowired
	private UserManager userManager;
	//注入角色管理对象
	@Autowired
	private RoleManager roleManager;
	//注入部门管理对象
	@Autowired
	private OrgManager orgManager;
	
	/**
	 * 分页查询用户，返回用户列表视图
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<User> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		//设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = userManager.findPage(page, filters);
		model.addAttribute("page", page);
		return "security/userList";
	}
	
	@RequestMapping(value="list/json",produces = "application/json")
	@ResponseBody
	public String list() {
		List<User> userList = userManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(Feature.ALLOW_UNQUOTED_CONTROL_CHARS, false) ;
		mapper.configure(Feature.ALLOW_SINGLE_QUOTES, false) ;
		try {
			json = mapper.writeValueAsString(userList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String mapJson = "";
		Map map = new HashMap<String,Object>();
		map.put("data", userList);
		try {
			mapJson = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapJson;
	}
	
	/**
	 * 编辑用户时，返回用户查看视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("userId", id);
		return "security/userView";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create() {
		return "security/userEdit";
	}
	
	@RequestMapping(value = "view/json/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String view(@PathVariable("id") Long id) {
		User user = userManager.get(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(user);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	//TODO 用户新增没有完成
		@RequestMapping(value = "update")
		public String update(HttpServletRequest request) {
			Map map = request.getParameterMap();
//			User user = userManager.get(Long.parseLong(id));
//			user.setUsername(username);
//			user.setFullname(fullname);
			//userManager.save(user);
			return "redirect:/security/user";
		}
	
	//TODO 用户新增没有完成
	@RequestMapping(value = "batchUpdate",produces = "application/text")
	@ResponseBody
	public String batchUpdate(User user,@RequestParam("roleIndexs[]") String[] roleIndexs,HttpServletRequest request) {
		if(roleIndexs != null) {
			for(String order : roleIndexs) {
				Role role = new Role();
				role.setId(Long.parseLong(order));
				user.getRoles().add(role);
			}
		}
		userManager.save(user);
		return "success";
	}
	
	@RequestMapping(value="getOrgs",produces = "application/json")
	@ResponseBody
	public String getOrgs() {
		List<Org> orgList = orgManager.getAll();
		List<Variable> variables = new ArrayList<Variable>();
		for(Org org:orgList) {
			Variable variable = new Variable();
			//variable.setId(org.getId());
			variable.setValue(String.valueOf(org.getId()));
			variable.setText(org.getName());
			variables.add(variable);
		}
		
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(variables);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value="getRoles",produces = "application/json")
	@ResponseBody
	public String getRoles(){
		List<Role> roleList = roleManager.getAll();
		List<Variable> variables = new ArrayList<Variable>();
		for(Role role:roleList) {
			Variable variable = new Variable();
			//variable.setId(org.getId());
			variable.setValue(String.valueOf(role.getId()));
			variable.setText(role.getName());
			variables.add(variable);
		}
		
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(variables);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	/**
	 * 根据主键ID删除用户实体，并返回用户列表视图
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		userManager.delete(id);
		return "redirect:/security/user";
	}
}
