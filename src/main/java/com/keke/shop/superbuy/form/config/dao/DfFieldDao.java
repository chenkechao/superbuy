package com.keke.shop.superbuy.form.config.dao;


import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.form.config.entity.DfField;
import com.keke.shop.superbuy.form.config.entity.DfForm;
import com.keke.framework.orm.hibernate.HibernateDao;
/**
 * 部门持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class DfFieldDao extends HibernateDao<DfField, Long> {

}
