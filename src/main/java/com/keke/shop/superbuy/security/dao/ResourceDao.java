package com.keke.shop.superbuy.security.dao;


import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.orm.hibernate.HibernateDao;
import com.keke.shop.superbuy.security.entity.Resource;

/**
 * 资源持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class ResourceDao extends HibernateDao<Resource, Long> {

}
