package com.keke.shop.superbuy.form.config;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keke.shop.superbuy.dao.LeaveRepository;
import com.keke.shop.superbuy.form.config.entity.DfField;
import com.keke.shop.superbuy.form.config.entity.DfForm;
import com.keke.shop.superbuy.form.config.service.DfFieldManager;
import com.keke.shop.superbuy.form.config.service.DfFormManager;
import com.keke.shop.superbuy.oa.leave.entity.Leave;

@Component
@Transactional
public class FormManager {

	private static final String TABLE_PREFIX ="TBL_";
	
	@Autowired
	private DfFormManager dfFormManager;
	
	@Autowired
	private DfFieldManager dfFieldManager;
	
	public void saveDfForm(DfForm dfForm) {
		if(dfForm.getId() == null) {
			dfForm.setCreateTime(new Date());
		}
		dfFormManager.save(dfForm);
	}
	
	private String getTableName(DfForm dfForm) {
		return TABLE_PREFIX + dfForm.getName();
	}
	
	public Map<String,String> process(DfForm dfForm,Map<String,Object> datas){
		Map<String, String> nameMap = new HashMap<String, String>();
		List<DfField> dfFieldList = new ArrayList<DfField>();
		if(datas == null) {
			throw new NullPointerException();
		}
		for(Map.Entry<String,Object> entry : datas.entrySet()) {
			Map<String,String> dfFieldMap = (Map<String, String>) entry.getValue();
			ObjectMapper mapper = new ObjectMapper();
			DfField dfField = mapper.convertValue(dfFieldMap, DfField.class);
			dfField.setTableName(getTableName(dfForm));
			dfField.setFormId(dfForm.getId());
			dfFieldList.add(dfField);
			nameMap.put(entry.getKey(), dfField.getFieldname());
		}
		boolean isExists = true;
		
		try {
			isExists = dfFormManager.checkTableFormExist(getTableName(dfForm));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			isExists = false;
		}
		
		try {
			if(!isExists){
				dfFormManager.createTableForm(getTableName(dfForm), dfFieldList);
			}else{
				dfFormManager.updateTableForm(getTableName(dfForm), dfFieldList);
			}
			
			
			for(DfField dfField:dfFieldList) {
				boolean hasDfFieldName = dfFieldManager.queryDfFieldNames(getTableName(dfForm)).contains(dfField.getFieldname());
				if(!hasDfFieldName){
					dfFieldManager.save(dfField);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nameMap;
	}
	
	public List<DfField> getFields(long formId){
		return dfFieldManager.findByFormId(formId);
	}
	
	public boolean submitTableForm(DfForm dfForm,Map<String, String[]> map){
		dfFormManager.insertTableForm(map,getTableName(dfForm));
		return true;
	}
}
