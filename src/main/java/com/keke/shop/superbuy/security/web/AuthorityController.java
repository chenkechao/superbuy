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
import com.keke.shop.superbuy.security.entity.Resource;
import com.keke.shop.superbuy.security.entity.Role;
import com.keke.shop.superbuy.security.service.AuthorityManager;
import com.keke.shop.superbuy.security.service.ResourceManager;

/**
 * 权限管理Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/security/authority")
public class AuthorityController {
	//注入权限管理对象
	@Autowired
	private AuthorityManager authorityManager;
	//注入资源管理对象
	@Autowired
	private ResourceManager resourceManager;
	
	/**
	 * 分页查询权限，返回权限列表视图
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<Authority> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		//设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = authorityManager.findPage(page, filters);
		model.addAttribute("page", page);
		return "security/authorityList";
	}
	
	@RequestMapping(value="list/json",produces = "application/json")
	@ResponseBody
	public String list() {
		List<Authority> authorityList = authorityManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(authorityList);
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
		Authority authority = null;
		String action = null;
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if ("action".equals(entry.getKey())) {
				action = entry.getValue()[0];
			} else {
				String subkey = entry.getKey().substring(5, entry.getKey().length() - 1);
				String[] subkeyArray = subkey.split("\\]\\[");
				if (authority == null) {
					String id = subkeyArray[0];
					if ("0".equals(id)) {
						authority = new Authority();
					} else {
						authority = authorityManager.get(Long.parseLong(id));
					}
				}
				if ("edit".equals(action) || "create".equals(action)) {
					try {
						Field field = authority.getClass().getDeclaredField(subkeyArray[1]);
						field.setAccessible(true);
						if (subkeyArray.length > 2) {
							
						} else {
							field.set(authority, entry.getValue()[0]);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		if ("edit".equals(action) || "create".equals(action)) {
			authorityManager.save(authority);
		} else if ("remove".equals(action)) {
			authorityManager.delete(authority.getId());
		}
		List<Authority> authorityList = new ArrayList<Authority>();
		authorityList.add(authority);
		ObjectMapper mapper = new ObjectMapper();

		String mapJson = "";
		Map objectmap = new HashMap<String, Object>();
		objectmap.put("data", authorityList);
		try {
			mapJson = mapper.writeValueAsString(objectmap);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mapJson;
	}
	
	/**
	 * 新建权限时，返回权限编辑视图
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("authority", new Authority(null));
		model.addAttribute("resources", resourceManager.getAll());
		return "security/authorityEdit";
	}

	/**
	 * 编辑权限时，返回权限编辑视图
	 * @param id
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
//	public String edit(@PathVariable("id") Long id, Model model) {
//		Authority entity = authorityManager.get(id);
//		List<Resource> resources = resourceManager.getAll();
//		List<Resource> resss = entity.getResources();
//		for(Resource res : resources) {
//			for(Resource selRes : resss) {
//				if(res.getId().longValue() == selRes.getId().longValue())
//				{
//					res.setSelected(1);
//				}
//				if(res.getSelected() == null)
//				{
//					res.setSelected(0);
//				}
//			}
//		}
//		model.addAttribute("authority", entity);
//		model.addAttribute("resources", resources);
//		return "security/authorityEdit";
//	}
	
	/**
	 * 编辑权限时，返回权限查看视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("authority", authorityManager.get(id));
		return "security/authorityView";
	}
	
	/**
	 * 新增、编辑权限页面的提交处理。保存权限实体，并返回权限列表视图
	 * @param Authority
	 * @return
	 */
//	@RequestMapping(value = "update", method = RequestMethod.POST)
//	public String update(Authority authority, Long[] orderIndexs) {
//		if(orderIndexs != null) {
//			for(Long order : orderIndexs) {
//				Resource res = new Resource(order);
//				authority.getResources().add(res);
//			}
//		}
//		authorityManager.save(authority);
//		return "redirect:/security/authority";
//	}
	
	/**
	 * 根据主键ID删除权限实体，并返回权限列表视图
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		authorityManager.delete(id);
		return "redirect:/security/authority";
	}
}
