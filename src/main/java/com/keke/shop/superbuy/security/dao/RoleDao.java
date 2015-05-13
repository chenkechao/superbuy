package com.keke.shop.superbuy.security.dao;


import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.orm.hibernate.HibernateDao;
import com.keke.shop.superbuy.security.entity.Role;

/**
 * 角色持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class RoleDao extends HibernateDao<Role, Long> {

}
