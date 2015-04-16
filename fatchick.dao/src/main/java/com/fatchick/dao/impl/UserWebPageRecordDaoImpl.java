package com.fatchick.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fatchick.base.dao.impl.BaseDaoImpl;
import com.fatchick.common.util.HqlUtil;
import com.fatchick.dao.UserWebPageRecordDao;
import com.fatchick.model.UserWebPageRecord;

@SuppressWarnings("unchecked")
@Repository("userWebPageRecordDao")
public class UserWebPageRecordDaoImpl extends BaseDaoImpl<UserWebPageRecord> implements UserWebPageRecordDao {

	@Override
	public List<UserWebPageRecord> get(Map<String, Object> params) {
		String hql = "select r from UserWebPageRecord r";
		return (List<UserWebPageRecord>) find(HqlUtil.generateHql(hql, getConditions(), params), params);
	}

	@Override
	public List<Map<String,Object>> getWebPages(Map<String, Object> params) {
		String hql = "select p from UserWebPageRecord r left join r.webPage p";
		return (List<Map<String, Object>>) find(HqlUtil.generateHql(hql, getConditions(), params), params);
	}
	
	@Override
	protected List<String> getConditions() {
		List<String> conditions = new ArrayList<String>();
		conditions.add("r.user=:user");
		return conditions;
	}

}
