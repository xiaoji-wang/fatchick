package com.fatchick.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fatchick.base.dao.impl.BaseDaoImpl;
import com.fatchick.dao.ArticleDao;
import com.fatchick.model.Article;

@Repository("articleDao")
public class ArticleDaoImpl extends BaseDaoImpl<Article> implements ArticleDao {

	@Override
	public List<Article> get(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<String> getConditions() {
		List<String> conditions = new ArrayList<String>();
		return conditions;
	}

}
