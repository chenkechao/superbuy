package com.keke.shop.superbuy.config.dictionary.dao;

import org.springframework.stereotype.Component;

import com.keke.framework.orm.hibernate.HibernateDao;
import com.keke.shop.superbuy.config.dictionary.entity.Dictionary;

/**
 * 配置字典持久化类
 * @author yuqs
 * @since 0.1
 */
@Component
public class DictionaryDao extends HibernateDao<Dictionary, Long> {

}
