package com.fatchick.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fatchick.base.dao.impl.BaseDaoImpl;
import com.fatchick.common.util.HqlUtil;
import com.fatchick.dao.UserDao;
import com.fatchick.model.User;

@Repository("userDao")
@SuppressWarnings("unchecked")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public List<User> get(Map<String, Object> params) {
		String hql = "select u from User u";
		return (List<User>) find(HqlUtil.generateHql(hql, getConditions(), params), params);
	}

	@Override
	public long getCount(Map<String, Object> params) {
		String hql = "select count(*) from User u";
		return this.count(HqlUtil.generateHql(hql, getConditions(), params), params);
	}

	@Override
	protected List<String> getConditions() {
		List<String> conditions = new ArrayList<String>();
		conditions.add("u.id=:userId");
		conditions.add("u.code=:code");
		conditions.add("u.password=:password");
		return conditions;
	}

}
