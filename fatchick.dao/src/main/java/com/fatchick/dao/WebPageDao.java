package com.fatchick.dao;

import com.fatchick.base.dao.BaseDao;
import com.fatchick.model.WebPage;

public interface WebPageDao extends BaseDao<WebPage> {

	WebPage getByUrlMd5(String urlMd5);

}
