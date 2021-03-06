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
import com.keke.shop.superbuy.security.entity.Org;
import com.keke.shop.superbuy.security.entity.Resource;
import com.keke.shop.superbuy.security.service.ResourceManager;

/**
 * 资源管理Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/security/resource")
public class ResourceController {
	//注入资源管理对象
	@Autowired
	private ResourceManager resourceManager;
	
	/**
	 * 分页查询资源，返回资源列表视图
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<Resource> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		//设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = resourceManager.findPage(page, filters);
		model.addAttribute("page", page);
		return "security/resourceList";
	}
	
	@RequestMapping(value="list/json",produces = "application/json")
	@ResponseBody
	public String list() {
		List<Resource> resourceList = resourceManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(resourceList);
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
		Resource resource = null;
		String action = null;
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if ("action".equals(entry.getKey())) {
				action = entry.getValue()[0];
			} else {
				String subkey = entry.getKey().substring(5, entry.getKey().length() - 1);
				String[] subkeyArray = subkey.split("\\]\\[");
				if (resource == null) {
					String id = subkeyArray[0];
					if ("0".equals(id)) {
						resource = new Resource();
					} else {
						resource = resourceManager.get(Long.parseLong(id));
					}
				}
				if ("edit".equals(action) || "create".equals(action)) {
					try {
						Field field = resource.getClass().getDeclaredField(subkeyArray[1]);
						field.setAccessible(true);
						if (subkeyArray.length > 2) {
							
						} else {
							field.set(resource, entry.getValue()[0]);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		if ("edit".equals(action) || "create".equals(action)) {
			resourceManager.save(resource);
		} else if ("remove".equals(action)) {
			resourceManager.delete(resource.getId());
		}
		List<Resource> resourceList = new ArrayList<Resource>();
		resourceList.add(resource);
		ObjectMapper mapper = new ObjectMapper();

		String mapJson = "";
		Map objectmap = new HashMap<String, Object>();
		objectmap.put("data", resourceList);
		try {
			mapJson = mapper.writeValueAsString(objectmap);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mapJson;
	}
	
	/**
	 * 新建资源时，返回资源编辑视图
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("resource", new Resource(null));
		return "security/resourceEdit";
	}

	/**
	 * 编辑资源时，返回资源编辑视图
	 * @param id
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
//	public String edit(@PathVariable("id") Long id, Model model) {
//		model.addAttribute("resource", resourceManager.get(id));
//		return "security/resourceEdit";
//	}
	
	/**
	 * 编辑资源时，返回资源查看视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("resource", resourceManager.get(id));
		return "security/resourceView";
	}
	
	/**
	 * 新增、编辑资源页面的提交处理。保存资源实体，并返回资源列表视图
	 * @param resource
     * @param parentMenuId
     * @return
	 */
//	@RequestMapping(value = "update", method = RequestMethod.POST)
//	public String update(Resource resource, Long parentMenuId) {
//		if(parentMenuId != null && parentMenuId.longValue() > 0) {
//			Menu menu = new Menu(parentMenuId);
//			resource.setMenu(menu);
//		}
//		resourceManager.save(resource);
//		return "redirect:/security/resource";
//	}
	
	/**
	 * 根据主键ID删除资源实体，并返回资源列表视图
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		resourceManager.delete(id);
		return "redirect:/security/resource";
	}
}
