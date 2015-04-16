package com.fatchick.dao;

import java.util.List;
import java.util.Map;

import com.fatchick.base.dao.BaseDao;
import com.fatchick.model.UserWebPageRecord;

public interface UserWebPageRecordDao extends BaseDao<UserWebPageRecord> {
	List<UserWebPageRecord> get(Map<String, Object> params);

	List<Map<String, Object>> getWebPages(Map<String, Object> params);	
}
