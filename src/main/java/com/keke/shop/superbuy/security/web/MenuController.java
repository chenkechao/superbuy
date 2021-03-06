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
import com.keke.shop.superbuy.security.entity.Menu;
import com.keke.shop.superbuy.security.entity.Resource;
import com.keke.shop.superbuy.security.service.MenuManager;

/**
 * 菜单管理Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/security/menu")
public class MenuController {
	//注入菜单管理对象
	@Autowired
	private MenuManager menuManager;
	
	/**
	 * 分页查询菜单，返回菜单列表视图
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<Menu> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		//设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = menuManager.findPage(page, filters);
		model.addAttribute("page", page);
		model.addAttribute("lookup", request.getParameter("lookup"));
		return "security/menuList";
	}
	
	@RequestMapping(value="list/json",produces = "application/json")
	@ResponseBody
	public String list() {
		List<Menu> menuList = menuManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(menuList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value = "update")
	@ResponseBody
	public String update(HttpServletRequest request) {
		Map<String, String[]> map = request.getParameterMap();
		Menu menu = null;
		String action = null;
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if ("action".equals(entry.getKey())) {
				action = entry.getValue()[0];
			} else {
				String subkey = entry.getKey().substring(5, entry.getKey().length() - 1);
				String[] subkeyArray = subkey.split("\\]\\[");
				if (menu == null) {
					String id = subkeyArray[0];
					if ("0".equals(id)) {
						menu = new Menu();
					} else {
						menu = menuManager.get(Long.parseLong(id));
					}
				}
				if ("edit".equals(action) || "create".equals(action)) {
					try {
						Field field = menu.getClass().getDeclaredField(subkeyArray[1]);
						field.setAccessible(true);
						if (subkeyArray.length > 2) {
							
						} else {
							field.set(menu, entry.getValue()[0]);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		if ("edit".equals(action) || "create".equals(action)) {
			menuManager.save(menu);
		} else if ("remove".equals(action)) {
			menuManager.delete(menu.getId());
		}
		List<Menu> menuList = new ArrayList<Menu>();
		menuList.add(menu);
		ObjectMapper mapper = new ObjectMapper();

		String mapJson = "";
		Map objectmap = new HashMap<String, Object>();
		objectmap.put("data", menuList);
		try {
			mapJson = mapper.writeValueAsString(objectmap);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mapJson;
	}
	
	/**
	 * 新建菜单时，返回菜单编辑视图
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("menu", new Menu(null));
		return "security/menuEdit";
	}

	/**
	 * 编辑菜单时，返回菜单编辑视图
	 * @param id
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
//	public String edit(@PathVariable("id") Long id, Model model) {
//		model.addAttribute("menu", menuManager.get(id));
//		return "security/menuEdit";
//	}
	
	/**
	 * 编辑菜单时，返回菜单查看视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("menu", menuManager.get(id));
		return "security/menuView";
	}
	
	/**
	 * 新增、编辑菜单页面的提交处理。保存菜单实体，并返回菜单列表视图
	 * @param Menu
	 * @return
	 */
//	@RequestMapping(value = "update", method = RequestMethod.POST)
//	public String update(Menu menu, Long parentMenuId) {
//		if(parentMenuId != null && parentMenuId.longValue() > 0) {
//			Menu parent = new Menu(parentMenuId);
//			menu.setParentMenu(parent);
//		}
//		menuManager.save(menu);
//		return "redirect:/security/menu";
//	}
	
	/**
	 * 根据主键ID删除菜单实体，并返回菜单列表视图
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		menuManager.delete(id);
		return "redirect:/security/menu";
	}
}
