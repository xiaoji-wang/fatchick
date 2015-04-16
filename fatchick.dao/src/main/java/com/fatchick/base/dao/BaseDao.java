package com.fatchick.base.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	T getById(int id);

	List<T> get(Map<String, Object> params);

	void save(T t);

	void update(T t);

	void delete(T t);

}
