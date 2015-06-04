package com.keke.shop.superbuy.form.config.dao;

import org.springframework.stereotype.Component;

import com.keke.shop.superbuy.form.config.entity.Dictionary;
import com.keke.shop.superbuy.orm.hibernate.HibernateDao;

/**
 * 配置字典持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class DictionaryDao extends HibernateDao<Dictionary, Long> {

}
