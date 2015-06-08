package com.keke.shop.superbuy.security.dao;


import org.springframework.stereotype.Component;

import com.keke.framework.orm.hibernate.HibernateDao;
import com.keke.shop.superbuy.security.entity.Authority;


/**
 * 权限持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class AuthorityDao extends HibernateDao<Authority, Long> {

}
