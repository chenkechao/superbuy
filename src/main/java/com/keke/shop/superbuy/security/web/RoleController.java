package com.keke.shop.superbuy.security.web;

import java.lang.reflect.Field;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.framework.orm.Page;
import com.keke.framework.orm.PropertyFilter;
import com.keke.shop.superbuy.security.entity.Authority;
import com.keke.shop.superbuy.security.entity.Org;
import com.keke.shop.superbuy.security.entity.Role;
import com.keke.shop.superbuy.security.entity.User;
import com.keke.shop.superbuy.security.service.AuthorityManager;
import com.keke.shop.superbuy.security.service.RoleManager;

/**
 * 角色管理Controller
 * 
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/security/role")
public class RoleController {
	// 注入角色管理对象
	@Autowired
	private RoleManager roleManager;
	// 注入权限管理对象
	@Autowired
	private AuthorityManager authorityManager;

	/**
	 * 分页查询角色，返回角色列表视图
	 * 
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<Role> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		// 设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = roleManager.findPage(page, filters);
		model.addAttribute("page", page);
		return "security/roleList";
	}

	@RequestMapping(value = "list/json", produces = "application/json")
	@ResponseBody
	public String list() {
		List<Role> roleList = roleManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(roleList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 新建角色时，返回角色编辑视图
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("role", new Role());
		model.addAttribute("authorities", authorityManager.getAll());
		return "security/roleEdit";
	}

	// TODO 用户新增没有完成
	@RequestMapping(value = "update")
	@ResponseBody
	public String update(HttpServletRequest request) {
		Map<String, String[]> map = request.getParameterMap();
		Role role = null;
		String action = null;
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if ("action".equals(entry.getKey())) {
				action = entry.getValue()[0];
			} else {
				String subkey = entry.getKey().substring(5, entry.getKey().length() - 1);
				String[] subkeyArray = subkey.split("\\]\\[");
				if (role == null) {
					String id = subkeyArray[0];
					if ("0".equals(id)) {
						role = new Role();
					} else {
						role = roleManager.get(Long.parseLong(id));
					}
				}
				if ("edit".equals(action) || "create".equals(action)) {
					try {
						Field field = role.getClass().getDeclaredField(subkeyArray[1]);
						field.setAccessible(true);
						if (subkeyArray.length > 2) {
							
						} else {
							field.set(role, entry.getValue()[0]);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		if ("edit".equals(action) || "create".equals(action)) {
			roleManager.save(role);
		} else if ("remove".equals(action)) {
			roleManager.delete(role.getId());
		}
		List<Role> roleList = new ArrayList<Role>();
		roleList.add(role);
		ObjectMapper mapper = new ObjectMapper();

		String mapJson = "";
		Map objectmap = new HashMap<String, Object>();
		objectmap.put("data", roleList);
		try {
			mapJson = mapper.writeValueAsString(objectmap);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mapJson;
	}

	/**
	 * 编辑角色时，返回角色编辑视图
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
//	public String edit(@PathVariable("id") Long id, Model model) {
//		Role entity = roleManager.get(id);
//		List<Authority> authorities = authorityManager.getAll();
//		List<Authority> auths = entity.getAuthorities();
//		for (Authority auth : authorities) {
//			for (Authority selAuth : auths) {
//				if (auth.getId().longValue() == selAuth.getId().longValue()) {
//					auth.setSelected(1);
//				}
//				if (auth.getSelected() == null) {
//					auth.setSelected(0);
//				}
//			}
//		}
//		model.addAttribute("role", entity);
//		model.addAttribute("authorities", authorities);
//		return "security/roleEdit";
//	}

	/**
	 * 编辑角色时，返回角色查看视图
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("role", roleManager.get(id));
		return "security/roleView";
	}

	/**
	 * 新增、编辑角色页面的提交处理。保存角色实体，并返回角色列表视图
	 * 
	 * @param user
	 * @return
	 */
//	@RequestMapping(value = "update", method = RequestMethod.POST)
//	public String update(Role role, Long[] orderIndexs) {
//		if (orderIndexs != null) {
//			for (Long order : orderIndexs) {
//				Authority auth = new Authority(order);
//				role.getAuthorities().add(auth);
//			}
//		}
//		roleManager.save(role);
//		return "redirect:/security/role";
//	}

	/**
	 * 根据主键ID删除角色实体，并返回角色列表视图
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		roleManager.delete(id);
		return "redirect:/security/role";
	}
}
