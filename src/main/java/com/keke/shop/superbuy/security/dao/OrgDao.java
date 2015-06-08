package com.keke.shop.superbuy.security.dao;


import org.springframework.stereotype.Component;

import com.keke.framework.orm.hibernate.HibernateDao;
import com.keke.shop.superbuy.security.entity.Org;

/**
 * 部门持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class OrgDao extends HibernateDao<Org, Long> {

}
