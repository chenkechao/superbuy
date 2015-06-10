package com.keke.shop.superbuy.security.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.framework.orm.Page;
import com.keke.framework.orm.PropertyFilter;
import com.keke.shop.superbuy.form.config.entity.Dictionary;
import com.keke.shop.superbuy.security.entity.Org;
import com.keke.shop.superbuy.security.entity.Role;
import com.keke.shop.superbuy.security.entity.User;
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
		try {
			json = mapper.writeValueAsString(userList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	/**
	 * 新建用户时，返回用户编辑视图
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("roles", roleManager.getAll());
		return "security/userEdit";
	}

	/**
	 * 编辑用户时，返回用户编辑视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		User entity = userManager.get(id);
		List<Role> roles = roleManager.getAll();
		List<Role> roless = entity.getRoles();
		for(Role role : roles) {
			for(Role selRole : roless) {
				if(role.getId().longValue() == selRole.getId().longValue())
				{
					role.setSelected(1);
				}
				if(role.getSelected() == null)
				{
					role.setSelected(0);
				}
			}
		}
		model.addAttribute("user", userManager.get(id));
		model.addAttribute("roles", roles);
		return "security/userEdit";
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
	
	/**
	 * 新增、编辑用户页面的提交处理。保存用户实体，并返回用户列表视图
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(User user, Long[] orderIndexs, Long parentOrgId) {
		if(orderIndexs != null) {
			for(Long order : orderIndexs) {
				Role role = new Role();
				role.setId(order);
				user.getRoles().add(role);
			}
		}
		if(parentOrgId != null && parentOrgId.longValue() > 0) {
			Org parent = new Org(parentOrgId);
			user.setOrg(parent);
		}
		userManager.save(user);
		return "redirect:/security/user";
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
