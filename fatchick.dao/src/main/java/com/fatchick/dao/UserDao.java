package com.fatchick.dao;

import java.util.List;
import java.util.Map;

import com.fatchick.base.dao.BaseDao;
import com.fatchick.model.User;

public interface UserDao extends BaseDao<User> {

	long getCount(Map<String, Object> params);
	
	List<User> get(Map<String, Object> params);
	
}
