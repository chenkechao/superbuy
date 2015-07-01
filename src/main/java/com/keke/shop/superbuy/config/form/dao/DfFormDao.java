package com.keke.shop.superbuy.config.form.dao;


import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.config.form.entity.DfForm;
import com.keke.framework.orm.hibernate.HibernateDao;
/**
 * 部门持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class DfFormDao extends HibernateDao<DfForm, Long> {

}
