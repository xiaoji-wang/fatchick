package com.fatchick.base.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.fatchick.base.dao.BaseDao;

@Repository("baseDao")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	private Class<T> entityClass;

	@Resource(name = "hibernateTemplate")
	protected HibernateTemplate hibernateTemplate;

	protected abstract List<String> getConditions();
	
	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		Class<?> directChild = getClass();
		while (!directChild.getSuperclass().equals(BaseDaoImpl.class)) {
			directChild = directChild.getSuperclass();
		}
		if (ParameterizedType.class.isAssignableFrom(directChild.getGenericSuperclass().getClass())) {
			Type[] actualTypeArguments = ((ParameterizedType) directChild.getGenericSuperclass()).getActualTypeArguments();
			this.entityClass = (Class<T>) (actualTypeArguments[0]);
		}
	}

	@Override
	public T getById(int id) {
		return this.hibernateTemplate.get(entityClass, id);
	}

	@Override
	public void save(T t) {
		this.hibernateTemplate.save(t);
	}

	@Override
	public void update(T t) {
		this.hibernateTemplate.update(t);
	}

	@Override
	public void delete(T t) {
		this.hibernateTemplate.delete(t);
	}
	
	protected List<?> find(String queryString) {
		return (List<?>) this.hibernateTemplate.find(queryString);
	}

	protected List<?> find(String queryString, Map<String, Object> params) {
		String[] paramNames = new String[params.keySet().size()];
		Object[] values = new Object[params.keySet().size()];
		convertParams(params, paramNames, values);
		return (List<?>) this.hibernateTemplate.findByNamedParam(queryString, paramNames, values);
	}

	protected long count(String queryString) {
		return (long) this.hibernateTemplate.find(queryString).listIterator().next();
	}

	protected long count(String queryString, Map<String, Object> params) {
		String[] paramNames = new String[params.keySet().size()];
		Object[] values = new Object[params.keySet().size()];
		convertParams(params, paramNames, values);
		return (long) this.hibernateTemplate.findByNamedParam(queryString, paramNames, values).listIterator().next();
	}

	private void convertParams(Map<String, Object> params, String[] paramNames, Object[] values) {
		int index = 0;
		for (Iterator<String> it = params.keySet().iterator(); it.hasNext(); index++) {
			String key = it.next();
			paramNames[index] = key;
			values[index] = params.get(key);
		}
	}
}
