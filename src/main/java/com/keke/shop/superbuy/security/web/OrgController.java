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
import com.keke.shop.superbuy.security.entity.Org;
import com.keke.shop.superbuy.security.entity.Role;
import com.keke.shop.superbuy.security.entity.User;
import com.keke.shop.superbuy.security.service.OrgManager;

/**
 * 部门管理Controller
 * 
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/security/org")
public class OrgController {
	// 注入部门管理对象
	@Autowired
	private OrgManager orgManager;

	/**
	 * 分页查询部门，返回部门列表视图
	 * 
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<Org> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		// 设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = orgManager.findPage(page, filters);
		model.addAttribute("page", page);
		model.addAttribute("lookup", request.getParameter("lookup"));
		return "security/orgList";
	}

	@RequestMapping(value = "list/json", produces = "application/json")
	@ResponseBody
	public String list() {
		List<Org> orgList = orgManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(orgList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}

	// TODO 用户新增没有完成
	@RequestMapping(value = "update")
	@ResponseBody
	public String update(HttpServletRequest request) {
		Map<String, String[]> map = request.getParameterMap();
		Org org = null;
		String action = null;
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if ("action".equals(entry.getKey())) {
				action = entry.getValue()[0];
			} else {
				String subkey = entry.getKey().substring(5, entry.getKey().length() - 1);
				String[] subkeyArray = subkey.split("\\]\\[");
				if (org == null) {
					String id = subkeyArray[0];
					if ("0".equals(id)) {
						org = new Org();
					} else {
						org = orgManager.get(Long.parseLong(id));
					}
				}
				if ("edit".equals(action) || "create".equals(action)) {
					try {
						Field field = org.getClass().getDeclaredField(subkeyArray[1]);
						field.setAccessible(true);
						if (subkeyArray.length > 2) {
						} else {
							field.set(org, entry.getValue()[0]);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		if ("edit".equals(action) || "create".equals(action)) {
			orgManager.save(org);
		} else if ("remove".equals(action)) {
			orgManager.delete(org.getId());
		}
		List<Org> orgList = new ArrayList<Org>();
		orgList.add(org);
		ObjectMapper mapper = new ObjectMapper();

		String mapJson = "";
		Map objectmap = new HashMap<String, Object>();
		objectmap.put("data", orgList);
		try {
			mapJson = mapper.writeValueAsString(objectmap);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mapJson;
	}

	/**
	 * 新建部门时，返回部门编辑视图
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("org", new Org(null));
		return "security/orgEdit";
	}

	/**
	 * 编辑部门时，返回部门编辑视图
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	// @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	// public String edit(@PathVariable("id") Long id, Model model) {
	// model.addAttribute("org", orgManager.get(id));
	// return "security/orgEdit";
	// }

	/**
	 * 编辑部门时，返回部门查看视图
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("org", orgManager.get(id));
		return "security/orgView";
	}

	/**
	 * 新增、编辑部门页面的提交处理。保存部门实体，并返回部门列表视图
	 * 
	 * @param org
	 * @return
	 */
	// @RequestMapping(value = "update", method = RequestMethod.POST)
	// public String update(Org org, Long parentOrgId) {
	// if(parentOrgId != null && parentOrgId.longValue() > 0) {
	// Org parent = new Org(parentOrgId);
	// org.setParentOrg(parent);
	// }
	// orgManager.save(org);
	// return "redirect:/security/org";
	// }

	/**
	 * 根据主键ID删除部门实体，并返回部门列表视图
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		orgManager.delete(id);
		return "redirect:/security/org";
	}
}
