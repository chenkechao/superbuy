package com.keke.shop.superbuy.form.config;

import java.util.ArrayList;
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
import com.keke.shop.superbuy.form.config.entity.Dictionary;
import com.keke.shop.superbuy.form.config.entity.DictionaryItem;
import com.keke.shop.superbuy.form.config.service.DictionaryManager;
import com.keke.framework.orm.Page;
import com.keke.framework.orm.PropertyFilter;

/**
 * 配置字典管理Controller
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "/config/dictionary")
public class DictionaryController {
	//注入配置字典管理对象
	@Autowired
	private DictionaryManager dictionaryManager;
	
	/**
	 * 分页查询配置，返回配置字典列表视图
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, Page<Dictionary> page, HttpServletRequest request) {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		//设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = dictionaryManager.findPage(page, filters);
		model.addAttribute("page", page);
		return "config/dictionary/dictionaryList";
	}
	
	@RequestMapping(value="list/json",produces = "application/json")
	@ResponseBody
	public String list() {
		List<Dictionary> distionaryList = dictionaryManager.getAll();
		String json = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(distionaryList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	/**
	 * 新建配置字典时，返回配置字典编辑视图
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("dictionary", new Dictionary());
		return "config/dictionary/dictionaryEdit";
	}

	/**
	 * 编辑配置字典时，返回配置字典编辑视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		Dictionary entity = dictionaryManager.get(id);
		model.addAttribute("dictionary", entity);
		return "config/dictionary/dictionaryEdit";
	}
	
	/**
	 * 编辑配置字典时，返回配置字典查看视图
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dictionary", dictionaryManager.get(id));
		return "config/dictionary/dictionaryView";
	}
	
	/**
	 * 新增、编辑配置字典页面的提交处理。保存配置字典实体，并返回配置字典列表视图
	 * @param dictionary
     * @param itemNames
     * @param orderbys
     * @param codes
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Dictionary dictionary, String[] itemNames, Integer[] orderbys, String[] codes) {
		List<DictionaryItem> items = new ArrayList<DictionaryItem>();
		for(int i = 0; i < itemNames.length; i++) {
			DictionaryItem ci = new DictionaryItem();
			ci.setDictionary(dictionary);
			ci.setName(itemNames[i]);
			ci.setOrderby(orderbys[i]);
			ci.setCode(codes[i]);
			items.add(ci);
		}
		dictionaryManager.save(dictionary, items);
		return "redirect:/config/dictionary";
	}
	
	/**
	 * 根据主键ID删除配置字典实体，并返回配置字典列表视图
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		dictionaryManager.delete(id);
		return "redirect:/config/dictionary";
	}

    /**
     * 根据字典名称获取数据
     * @param config
     * @return
     */
    @RequestMapping(value = "items")
    @ResponseBody
    public List<DictionaryItem> getItems(String config) {
        return dictionaryManager.getItemsByName(config);
    }

    @RequestMapping(value = "dicts")
    @ResponseBody
    public List<Dictionary> getDicts() {
        return dictionaryManager.getAll();
    }
}
