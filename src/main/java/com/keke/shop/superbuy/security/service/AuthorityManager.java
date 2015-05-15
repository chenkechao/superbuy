package com.keke.shop.superbuy.security.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.keke.shop.superbuy.orm.Page;
import com.keke.shop.superbuy.orm.PropertyFilter;
import com.keke.shop.superbuy.security.dao.AuthorityDao;
import com.keke.shop.superbuy.security.entity.Authority;
import com.keke.shop.superbuy.security.entity.Role;

/**
 * 权限管理类
 * @author yuqs
 * @since 0.1
 */
@Component
@Transactional
public class AuthorityManager {
	//注入权限持久化对象
	@Autowired
	private AuthorityDao authorityDao;
	//注入角色管理对象
	@Autowired
	private RoleManager roleManager;
	
	/**
	 * 保存权限实体
	 * @param entity
	 */
	public void save(Authority entity) {
		authorityDao.save(entity);
	}
	
	/**
	 * 根据主键ID删除对应的实体
	 * @param id
	 */
	public void delete(Long id) {
		List<Role> roles = roleManager.getAll();
		for(Role role : roles) {
			for(Authority auth : role.getAuthorities()) {
				if(auth.getId().longValue() == id.longValue()) {
					role.getAuthorities().remove(auth);
					roleManager.save(role);
					break;
				}
			}
		}
		authorityDao.delete(id);
	}
	
	/**
	 * 根据主键ID获取权限实体
	 * @param id
	 * @return
	 */
	public Authority get(Long id) {
		return authorityDao.get(id);
	}
	
	/**
	 * 根据分页对象、过滤集合参数，分页查询权限列表
	 * @param page
	 * @param filters
	 * @return
	 */
	public Page<Authority> findPage(final Page<Authority> page, final List<PropertyFilter> filters) {
		return authorityDao.findPage(page, filters);
	}
	
	/**
	 * 获取所有权限记录
	 * @return
	 */
	public List<Authority> getAll() {
		return authorityDao.getAll();
	}
}
