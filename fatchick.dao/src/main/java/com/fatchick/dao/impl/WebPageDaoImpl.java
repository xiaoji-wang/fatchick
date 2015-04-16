package com.fatchick.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fatchick.base.dao.impl.BaseDaoImpl;
import com.fatchick.common.util.HqlUtil;
import com.fatchick.dao.WebPageDao;
import com.fatchick.model.WebPage;

@Repository("webPageDao")
@SuppressWarnings("unchecked")
public class WebPageDaoImpl extends BaseDaoImpl<WebPage> implements WebPageDao {

	@Override
	public WebPage getByUrlMd5(String urlMd5) {
		String hql = "select p from WebPage p where p.urlMd5=:urlMd5";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("urlMd5", urlMd5);
		List<WebPage> pages = (List<WebPage>) find(hql, params);
		return pages.isEmpty() ? null : pages.get(0);
	}

	@Override
	public List<WebPage> get(Map<String, Object> params) {
		String hql = "select p from WebPage p";
		return (List<WebPage>) find(HqlUtil.generateHql(hql, getConditions(), params), params);
	}

	@Override
	protected List<String> getConditions() {
		List<String> conditions = new ArrayList<String>();
		conditions.add("p.host=:host");
		conditions.add("p.urlMd5=:urlMd5");
		return conditions;
	}

}
